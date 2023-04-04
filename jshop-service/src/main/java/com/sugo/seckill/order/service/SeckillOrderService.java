package com.sugo.seckill.order.service;

import com.sugo.seckill.error.BaseException;
import com.sugo.seckill.http.HttpResult;
import com.sugo.seckill.page.PageResult;
import com.sugo.seckill.pojo.*;

/**
 * 服务层接口
 * @author Administrator
 */
public interface SeckillOrderService {

	/**
	 * 返回分页列表
	 * @return
	 */
	public PageResult findPage(int pageNum, int pageSize);
	

	/**
	 * 根据ID获取实体
	 * @param id
	 * @return
	 */
	public TbSeckillOrder findOne(Long id);

	public void updateOrderStatus(String out_trade_no, String transaction_id);


	public TbPayLog searchPayLogFromRedis(String userId);


	/**
	 * @Description: 从redis中查询用户信息
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 10:47
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 10:47
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	FrontUser getUserInfoFromRedis(String token);

    HttpResult getOrderMoney(Long orderId);

	TbSeckillOrder findOrderById(Long orderId);

	public void getSeckillGoods(Long seckillId);




	/**
	 * @Description: 普通下单操作
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult startKilled(Long killId,String userId);

	/**
	 * @Description: Lock锁控制库存超卖的问题
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult startKilledByLocked(Long killId,String userId);


	/**
	 * @Description: MySQL分布式锁：for update 悲观锁控制库存超卖的问题
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult startKilledByLockedWithForUpdate(Long killId,String userId);


	/**
	 * @Description: MySQL分布式锁：版本的乐观锁控制库存超卖的问题
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult startKilledByLockedWithVersion(Long killId,String userId);



	/**
	 * @Description: Redis分布式锁控制库存超卖
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult startKilledByLockedWithRedis(Long killId,String userId);


	/**
	 * @Description: 性能优化
	 * @Author: hubin
	 * @CreateDate: 2020/11/27 22:01
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/11/27 22:01
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult startKilledMoreBetter(Long killId,String userId) throws BaseException;


	/**
	 * @Description: 开启异步化下单实现
	 * @Author: hubin
	 * @CreateDate: 2021/6/8 21:07
	 * @UpdateUser: hubin
	 * @UpdateDate: 2021/6/8 21:07
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult startAsyncKilled(TbSeckillOrder order);
}
