package com.sugo.seckill.order.service.impl;
import java.math.BigDecimal;
import java.util.Date;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import com.github.pagehelper.Page;

import com.sugo.seckill.aop.lock.ServiceLock;
import com.sugo.seckill.aop.redis.ServiceRedisLock;
import com.sugo.seckill.error.BaseException;
import com.sugo.seckill.http.HttpResult;
import com.sugo.seckill.http.HttpStatus;
import com.sugo.seckill.mapper.order.SeckillGoodsMapper;
import com.sugo.seckill.mapper.order.SeckillOrderMapper;
import com.sugo.seckill.mapper.pay.TbPayLogMapper;
import com.sugo.seckill.order.service.SeckillOrderService;
import com.sugo.seckill.page.PageResult;
import com.sugo.seckill.pojo.*;
import com.sugo.seckill.queue.jvm.SeckillQueue;
import com.sugo.seckill.queue.mq.MqProducer;
import com.sugo.seckill.utils.Constants;
import com.sugo.seckill.utils.IdWorker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import com.github.pagehelper.PageHelper;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

/**
 * 服务实现层
 * @author Administrator
 *
 */
@Service
public class SeckillOrderServiceImpl implements SeckillOrderService {

	@Autowired
	private SeckillOrderMapper seckillOrderMapper;

	//注入支付
	@Autowired
	private TbPayLogMapper payLogMapper;


	//注入商品对象
	@Autowired
	private SeckillGoodsMapper seckillGoodsMapper;

	//注入redis
	@Autowired
	private RedisTemplate redisTemplate;

	//注入Idworker
	@Autowired
	private IdWorker idWorker;


	@Autowired
	private MqProducer producer;



	//程序锁
	//互斥锁 参数默认false，不公平锁
	private Lock lock = new ReentrantLock(true);

	//日志
	private final static Logger LOGGER = LoggerFactory.getLogger(SeckillOrderServiceImpl.class);



	// disruptor 队列 --- 600w /s
	// 分布式队列
	// redis
	// mq


	public void getSeckillGoods(Long seckillId){

		redisTemplate.delete("seckill_goods_"+seckillId);
		redisTemplate.delete("seckill_goods_stock_"+seckillId);

		//创建example对象
		Example example = new Example(TbSeckillGoods.class);
		Example.Criteria criteria = example.createCriteria();

		/*//设置查询条件
		//状态可用
		criteria.andEqualTo("status",1);
		//时间必须在活动区间
		criteria.andCondition("now() BETWEEN start_time_date AND end_time_date");
		//库存必须大于0
		criteria.andGreaterThan("stockCount",0);
		criteria.andEqualTo("id",1);

		//获取Redis中所有的key,实现排除当前Redis中已经存在的商品
		Set<Long> ids = redisTemplate.boundHashOps("seckillGoods").keys();
		//判断
		if(ids!=null && ids.size()>0){
			criteria.andNotIn("id",ids);
		}

		//查询
		List<TbSeckillGoods> seckillGoodsList = seckillGoodsMapper.selectByExample(example);
*/
		TbSeckillGoods seckillGoods = seckillGoodsMapper.selectByPrimaryKey(seckillId);

		//判断是否有入库商品
		//if(seckillGoodsList!=null && seckillGoodsList.size()>0){
			//循环
			//for (TbSeckillGoods goods : seckillGoodsList) {

				//放入商品对象
				redisTemplate.opsForValue().set("SECKILL_GOODS_"+seckillId,seckillGoods);
				//存储库存
				redisTemplate.opsForValue().set("SECKILL_GOODS_STOCK_"+seckillId,seckillGoods.getStockCount());

               /* //存储到redis
                redisTemplate.boundHashOps("seckillGoods").put(String.valueOf(goods.getId()),goods);
                //存储库存:剩余库存存，用来防止超卖
                redisTemplate.boundHashOps("seckillGoodsCount").put(String.valueOf(goods.getId()),goods.getStockCount());*/

			//}
		//}
	}

	/**
	 * @Description: 普通下单操作
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	@Transactional
	@Override
	public HttpResult startKilled(Long killId, String userId) {

		try {

			// 从数据库查询商品数据
			TbSeckillGoods seckillGoods = seckillGoodsMapper.selectByPrimaryKey(killId);
			//判断
			if(seckillGoods == null){
                return HttpResult.error(HttpStatus.SEC_GOODS_NOT_EXSISTS,"商品不存在");
            }
			if(seckillGoods.getStatus() != 1){
                return HttpResult.error(HttpStatus.SEC_NOT_UP,"商品未审核");
            }
			if(seckillGoods.getStockCount() <= 0){
                return HttpResult.error(HttpStatus.SEC_GOODS_END,"商品已售罄");
            }
			if(seckillGoods.getStartTimeDate().getTime() > new Date().getTime()){
                return HttpResult.error(HttpStatus.SEC_ACTIVE_NOT_START,"活动未开始");
            }
			if(seckillGoods.getEndTimeDate().getTime() <= new Date().getTime()){
                return HttpResult.error(HttpStatus.SEC_ACTIVE_END,"活动结束");
            }

			//库存扣减
			seckillGoods.setStockCount(seckillGoods.getStockCount() - 1);
			//更新库存
			seckillGoodsMapper.updateByPrimaryKeySelective(seckillGoods);


			//下单
			TbSeckillOrder order = new TbSeckillOrder();
			order.setSeckillId(killId);
			order.setUserId(userId);
			order.setCreateTime(new Date());
			order.setStatus("0");
			order.setMoney(seckillGoods.getCostPrice());

			seckillOrderMapper.insertSelective(order);

			return HttpResult.ok("秒杀成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @Description: Lock锁控制库存超卖的问题
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	@Transactional
	@ServiceLock
	@Override
	public HttpResult startKilledByLocked(Long killId, String userId) {
		try {

			// 从数据库查询商品数据
			TbSeckillGoods seckillGoods = seckillGoodsMapper.selectByPrimaryKey(killId);
			//判断
			if(seckillGoods == null){
				return HttpResult.error(HttpStatus.SEC_GOODS_NOT_EXSISTS,"商品不存在");
			}
			if(seckillGoods.getStatus() != 1){
				return HttpResult.error(HttpStatus.SEC_NOT_UP,"商品未审核");
			}
			if(seckillGoods.getStockCount() <= 0){
				return HttpResult.error(HttpStatus.SEC_GOODS_END,"商品已售罄");
			}
			if(seckillGoods.getStartTimeDate().getTime() > new Date().getTime()){
				return HttpResult.error(HttpStatus.SEC_ACTIVE_NOT_START,"活动未开始");
			}
			if(seckillGoods.getEndTimeDate().getTime() <= new Date().getTime()){
				return HttpResult.error(HttpStatus.SEC_ACTIVE_END,"活动结束");
			}

			//库存扣减
			seckillGoods.setStockCount(seckillGoods.getStockCount() - 1);
			//更新库存
			seckillGoodsMapper.updateByPrimaryKeySelective(seckillGoods);


			//下单
			TbSeckillOrder order = new TbSeckillOrder();
			order.setSeckillId(killId);
			order.setUserId(userId);
			order.setCreateTime(new Date());
			order.setStatus("0");
			order.setMoney(seckillGoods.getCostPrice());

			seckillOrderMapper.insertSelective(order);

			return HttpResult.ok("秒杀成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @Description: MySQL分布式锁：for update 悲观锁控制库存超卖的问题
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	@Transactional
	@Override
	public HttpResult startKilledByLockedWithForUpdate(Long killId, String userId) {
		try {

			// 从数据库查询商品数据
			TbSeckillGoods seckillGoods = seckillGoodsMapper.selectByPrimaryKeyBySQLLock(killId);
			//判断
			if(seckillGoods == null){
				return HttpResult.error(HttpStatus.SEC_GOODS_NOT_EXSISTS,"商品不存在");
			}
			if(seckillGoods.getStatus() != 1){
				return HttpResult.error(HttpStatus.SEC_NOT_UP,"商品未审核");
			}
			if(seckillGoods.getStockCount() <= 0){
				return HttpResult.error(HttpStatus.SEC_GOODS_END,"商品已售罄");
			}
			if(seckillGoods.getStartTimeDate().getTime() > new Date().getTime()){
				return HttpResult.error(HttpStatus.SEC_ACTIVE_NOT_START,"活动未开始");
			}
			if(seckillGoods.getEndTimeDate().getTime() <= new Date().getTime()){
				return HttpResult.error(HttpStatus.SEC_ACTIVE_END,"活动结束");
			}

			//库存扣减
			seckillGoods.setStockCount(seckillGoods.getStockCount() - 1);
			//更新库存
			seckillGoodsMapper.updateByPrimaryKeySelective(seckillGoods);


			//下单
			TbSeckillOrder order = new TbSeckillOrder();
			order.setSeckillId(killId);
			order.setUserId(userId);
			order.setCreateTime(new Date());
			order.setStatus("0");
			order.setMoney(seckillGoods.getCostPrice());

			seckillOrderMapper.insertSelective(order);

			return HttpResult.ok("秒杀成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @Description: MySQL分布式锁：版本的乐观锁控制库存超卖的问题
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	@Transactional
	@Override
	public HttpResult startKilledByLockedWithVersion(Long killId, String userId) {
		try {

			// 1、查询版本 从数据库查询商品数据
			TbSeckillGoods seckillGoods = seckillGoodsMapper.selectByPrimaryKey(killId);
			//判断
			if(seckillGoods == null){
				return HttpResult.error(HttpStatus.SEC_GOODS_NOT_EXSISTS,"商品不存在");
			}
			if(seckillGoods.getStatus() != 1){
				return HttpResult.error(HttpStatus.SEC_NOT_UP,"商品未审核");
			}
			if(seckillGoods.getStockCount() <= 0){
				return HttpResult.error(HttpStatus.SEC_GOODS_END,"商品已售罄");
			}
			if(seckillGoods.getStartTimeDate().getTime() > new Date().getTime()){
				return HttpResult.error(HttpStatus.SEC_ACTIVE_NOT_START,"活动未开始");
			}
			if(seckillGoods.getEndTimeDate().getTime() <= new Date().getTime()){
				return HttpResult.error(HttpStatus.SEC_ACTIVE_END,"活动结束");
			}

			// 使用乐观锁的方式更新库存
			int res = seckillGoodsMapper.updateSeckillGoodsByPrimaryKeyByVersion(killId, seckillGoods.getVersion());
			if(res == 0){
				return HttpResult.error("版本匹配失败");
			}

			//下单
			TbSeckillOrder order = new TbSeckillOrder();
			order.setSeckillId(killId);
			order.setUserId(userId);
			order.setCreateTime(new Date());
			order.setStatus("0");
			order.setMoney(seckillGoods.getCostPrice());

			seckillOrderMapper.insertSelective(order);

			return HttpResult.ok("秒杀成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	/**
	 * @Description: Redis分布式锁控制库存超卖
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	@Transactional
	@ServiceRedisLock
	@Override
	public HttpResult startKilledByLockedWithRedis(Long killId, String userId) {

		try {
			// 从数据库查询商品数据
			TbSeckillGoods seckillGoods = seckillGoodsMapper.selectByPrimaryKey(killId);
			//判断
			if(seckillGoods == null){
				return HttpResult.error(HttpStatus.SEC_GOODS_NOT_EXSISTS,"商品不存在");
			}
			if(seckillGoods.getStatus() != 1){
				return HttpResult.error(HttpStatus.SEC_NOT_UP,"商品未审核");
			}
			if(seckillGoods.getStockCount() <= 0){
				return HttpResult.error(HttpStatus.SEC_GOODS_END,"商品已售罄");
			}
			if(seckillGoods.getStartTimeDate().getTime() > new Date().getTime()){
				return HttpResult.error(HttpStatus.SEC_ACTIVE_NOT_START,"活动未开始");
			}
			if(seckillGoods.getEndTimeDate().getTime() <= new Date().getTime()){
				return HttpResult.error(HttpStatus.SEC_ACTIVE_END,"活动结束");
			}

			//库存扣减
			seckillGoods.setStockCount(seckillGoods.getStockCount() - 1);
			//更新库存
			seckillGoodsMapper.updateByPrimaryKeySelective(seckillGoods);

			//下单
			TbSeckillOrder order = new TbSeckillOrder();
			order.setSeckillId(killId);
			order.setUserId(userId);
			order.setCreateTime(new Date());
			order.setStatus("0");
			order.setMoney(seckillGoods.getCostPrice());

			seckillOrderMapper.insertSelective(order);

			return HttpResult.ok("秒杀成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @Description: 性能优化
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	@Transactional
	@Override
	public HttpResult startKilledMoreBetter(Long killId, String userId) throws BaseException {
		// 判断此商品是否已售罄
		Integer endStatus = (Integer) redisTemplate.opsForValue().get(Constants.REDIS_GOODS_END_KEY + killId);

		// 判断
		if(endStatus!=null && HttpStatus.SEC_GOODS_END == endStatus){
			return HttpResult.error("商品已售罄");
		}

		// 1、从缓存中获取商品数据
		TbSeckillGoods seckillGoods = (TbSeckillGoods) redisTemplate
				.opsForValue()
				.get(Constants.REDIS_GOODS_INFO_KEY+killId);
		//判断
		if(seckillGoods == null){
			return HttpResult.error(HttpStatus.SEC_GOODS_NOT_EXSISTS,"商品不存在");
		}
		if(seckillGoods.getStatus() != 1){
			return HttpResult.error(HttpStatus.SEC_NOT_UP,"商品未审核");
		}
		if(seckillGoods.getStockCount() <= 0){
			return HttpResult.error(HttpStatus.SEC_GOODS_END,"商品已售罄");
		}
		if(seckillGoods.getStartTimeDate().getTime() > new Date().getTime()){
			return HttpResult.error(HttpStatus.SEC_ACTIVE_NOT_START,"活动未开始");
		}
		if(seckillGoods.getEndTimeDate().getTime() <= new Date().getTime()){
			return HttpResult.error(HttpStatus.SEC_ACTIVE_END,"活动结束");
		}

		try {

			// 2、从缓存中扣减即可
			// 成功，失败
			// 扣减库存： 不考虑数据一致性问题，只需要在最终时候考虑数据一致性问题即可
			boolean res = this.reduceStock(killId);

			// 锁定库存
			// 支付完成后，对数据库减法 ：
			// 1、数据库库存 - 锁定库存
			// 2、删除锁定库存

			if(!res){
				return HttpResult.error("下单失败");
			}


			// 3、下单操作异步化
			// 队列：
			// BlockingQueue队列，disruptor队列
			// Redis消息队列
			// RocketMQ队列
			//下单
			TbSeckillOrder order = new TbSeckillOrder();
			order.setSeckillId(killId);
			order.setUserId(userId);
			// 把秒杀商品id,用户id成功放入队列，秒杀成功
			Boolean produce = SeckillQueue.getMailQueue().produce(order);
			if(!produce){
				throw new BaseException(HttpStatus.SEC_GOODS_STOCK_FAIL,"下单失败");
			}

			seckillGoods.setStockCount(null);
			seckillGoods.setTranStatus(1);
			// 更新事务状态
			seckillGoodsMapper.updateByPrimaryKeySelective(seckillGoods);


			return HttpResult.ok("秒杀成功");
		} catch (Exception e) {
			e.printStackTrace();

			seckillGoods.setStockCount(null);
			seckillGoods.setTranStatus(2);
			// 更新事务状态
			seckillGoodsMapper.updateByPrimaryKeySelective(seckillGoods);

		}
		return null;
	}



	/**
	 * @Description: 开启异步化下单实现
	 * @Author: hubin
	 * @CreateDate: 2021/6/8 21:07
	 * @UpdateUser: hubin
	 * @UpdateDate: 2021/6/8 21:07
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	@Transactional
	@Override
	public HttpResult startAsyncKilled(TbSeckillOrder order) {

		// 获取数据
		TbSeckillGoods seckillGoods = (TbSeckillGoods) redisTemplate
				.opsForValue()
				.get(Constants.REDIS_GOODS_INFO_KEY+order.getId());

		// 构造订单数据
		order.setMoney(BigDecimal.ZERO);
		order.setStatus("0");
		order.setCreateTime(new Date());

		seckillOrderMapper.insertSelective(order);


		return HttpResult.ok("秒杀成功");
	}

	/**
	 * @Description: 扣减库存
	 * @Author: hubin
	 * @CreateDate: 2021/6/8 20:27
	 * @UpdateUser: hubin
	 * @UpdateDate: 2021/6/8 20:27
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	private boolean reduceStock(Long killId) {
		// 扣减库存，每一个限抢购一个商品
		Long res = redisTemplate.opsForValue().increment(Constants.REDIS_GOODS_STOCK_KEY+killId, -1);

		if(res > 0){
			return true;
		}else if(res == 0){
			// 添加一个标识
			redisTemplate.opsForValue().set(Constants.REDIS_GOODS_END_KEY+killId,HttpStatus.SEC_GOODS_END);
			return true;
		}
		return false;
	}


	/**
	 * 按分页查询
	 */
	@Override
	@Transactional
	public PageResult findPage(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		Page<TbSeckillOrder> page=   (Page<TbSeckillOrder>) seckillOrderMapper.selectByExample(null);
		return new PageResult(page.getTotal(), page.getResult());
	}


	/**
	 * 根据ID获取实体
	 * @param id
	 * @return
	 */
	@Override
	@Transactional
	public TbSeckillOrder findOne(Long id){
		return seckillOrderMapper.selectByPrimaryKey(id);
	}

	/**
	 * @Description: 支付完毕，更新订单的状态
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 22:20
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 22:20
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	@Override
	@Transactional
	public void updateOrderStatus(String out_trade_no, String transaction_id) {
		//1.修改支付日志状态

		TbPayLog payLog = payLogMapper.selectByPrimaryKey(out_trade_no);
		payLog.setPayTime(new Date());//支付时间
		payLog.setTradeState("1");//交易状态
		payLog.setTransactionId(transaction_id);//流水号
		payLogMapper.updateByPrimaryKey(payLog);

		//2.修改订单状态
		String orderList = payLog.getOrderList();
		String[] ids = orderList.split(",");//订单号
		for(String id:ids){

			TbSeckillOrder order = seckillOrderMapper.selectByPrimaryKey( Long.valueOf(id) );
			order.setStatus("2");//支付状态
			order.setPayTime(new Date());//支付时间
			seckillOrderMapper.updateByPrimaryKey(order);
		}
	}





	@Override
	public TbPayLog searchPayLogFromRedis(String userId) {
		return (TbPayLog) redisTemplate.boundHashOps("payLog").get(userId);
	}

	/**
	 * @Description: 根据token查询用户信息
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 10:47
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 10:47
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	@Override
	public FrontUser getUserInfoFromRedis(String token) {
		FrontUser user =
				(FrontUser) redisTemplate.opsForValue().get(token);
		return user;
	}

	@Override
	public HttpResult getOrderMoney(Long orderId) {
		TbSeckillOrder order = seckillOrderMapper.selectByPrimaryKey(orderId);
		HttpResult httpResult = new HttpResult();
		httpResult.setData(order.getMoney());
		return httpResult;
	}

	@Override
	public TbSeckillOrder findOrderById(Long orderId) {
		return seckillOrderMapper.selectByPrimaryKey(orderId);
	}
}
