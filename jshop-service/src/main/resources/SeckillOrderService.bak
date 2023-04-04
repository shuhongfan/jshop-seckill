package com.sugo.seckill.order.service;

import com.sugo.seckill.http.HttpResult;
import com.sugo.seckill.page.PageResult;
import com.sugo.seckill.pojo.FrontUser;
import com.sugo.seckill.pojo.TbPayLog;
import com.sugo.seckill.pojo.TbSeckillOrder;

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



	/**
	 * 方式零： 普通秒杀下单 会出现库存超卖现象
	 * @param seckillId
	 * @param userId
	 */
	public HttpResult startSubmitOrder(Long seckillId, String userId);

	/**
	 * 方式零： 普通秒杀下单 会出现库存超卖现象（多线程的方式）
	 * @param seckillId
	 * @param userId
	 */
	public HttpResult startSubmitOrderMultiThread(Long seckillId, String userId);


	/**
	 * 方式一： 秒杀下单--程序锁的方式
	 * @param seckillId
	 * @param userId
	 */
	public HttpResult startSubmitOrderLock(Long seckillId, String userId);


	/**
	 * 方式一： 秒杀下单--程序锁的方式
	 * @param seckillId
	 * @param userId
	 */
	public HttpResult startSubmitOrderLockMultiThread(Long seckillId, String userId);



    /**
     * @Description: 方式二：AOP秒杀下单
     * @Author: hubin
     * @CreateDate: 2020/6/10 17:58
     * @UpdateUser: hubin
     * @UpdateDate: 2020/6/10 17:58
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
	HttpResult startSubmitOrderAopLock(Long seckillId, String userId);


	/**
	 * @Description: 方式二：AOP秒杀下单，多线程方式
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 17:58
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 17:58
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	HttpResult startsubmitOrderAopLockWithMultiThread(Long seckillId, String userId);


	/**
	 * @Description: 方式三：数据库悲观锁秒杀下单
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 18:10
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 18:10
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult submitOrderDataBaseLockForUpdateOne(Long seckillId, String userId);


	/**
	 * @Description: 方式三：数据库悲观锁秒杀下单,多线程方式
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 18:10
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 18:10
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult submitOrderDataBaseLockForUpdateOneWithMultiThread(Long seckillId, String userId);

	/**
	 * @Description: 方式四：数据库悲观锁秒杀下单第二种方式，解放锁资源
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 18:10
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 18:10
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult submitOrderDataBaseLockForUpdateTwo(Long seckillId, String userId);

	/**
	 * @Description: 方式五：数据库乐观锁秒杀下单第二种方式，解放锁资源
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 18:10
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 18:10
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	public HttpResult submitOrderDataBaseLockForVersion(Long seckillId, String userId);


	/**
	 * @Description: 方式六：队列方式，调用秒杀下单接口
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 18:10
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 18:10
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	HttpResult startSeckilByQueue(long seckillId, long userId);


	/**
	 * @Description: 方式七：DisruptorQueue队列方式，调用秒杀下单接口
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 18:10
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 18:10
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	HttpResult startSeckilByDisruptorQueue(long seckillId, long userId);


	/**
	 * @Description: 方式八：RocketMQ队列方式，调用秒杀下单接口
	 * @Author: hubin
	 * @CreateDate: 2020/6/10 18:10
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/10 18:10
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	HttpResult startSeckilByRocketMQ(long seckillId, long userId);





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
}
