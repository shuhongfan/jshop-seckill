package com.sugo.seckill.web.order;

import com.sugo.seckill.http.HttpResult;
import com.sugo.seckill.http.HttpStatus;
import com.sugo.seckill.order.service.SeckillOrderService;
import com.sugo.seckill.pojo.FrontUser;
import com.sugo.seckill.queue.mq.MqProducer;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sun.swing.plaf.synth.DefaultSynthStyle;

import javax.xml.transform.sax.SAXTransformerFactory;
import java.util.concurrent.*;


/**
 * controller
 * @author Administrator
 *
 */
@RestController
@RequestMapping("/seckill")
public class SeckillOrderController {

	@Autowired
	private SeckillOrderService seckillOrderService;


	//注入mqproducer
	@Autowired
	private MqProducer producer;

	// 定义线程池，泄洪
	private ExecutorService executorService = new ThreadPoolExecutor(Runtime.getRuntime().availableProcessors(),
			100, 100,TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(2000), new ThreadFactory() {
		@Override
		public Thread newThread(Runnable r) {
			Thread thread = new Thread(r);
			thread.setName("client-transaction-msg-check-thread");
			return thread;
		}
	});


			/**
             * @Description: 获取时间
             * @Author: hubin
             * @CreateDate: 2020/6/10 16:19
             * @UpdateUser: hubin
             * @UpdateDate: 2020/6/10 16:19
             * @UpdateRemark: 修改内容
             * @Version: 1.0
             */
	@RequestMapping("/submitOrder/times")
	public HttpResult getConcurrentTime(){
		return HttpResult.ok(System.currentTimeMillis()+"");
	}


	@RequestMapping("/test")
	public HttpResult getSeckillGoods(Long seckillId){
		seckillOrderService.getSeckillGoods(seckillId);
		return HttpResult.ok();
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
	@RequestMapping("/order/kill/{killId}/{token}")
	public HttpResult startKilled(@PathVariable Long killId, @PathVariable String token){
		//判断
		if(StringUtils.isBlank(token)){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}
		//获取用户数据
		FrontUser user = seckillOrderService.getUserInfoFromRedis(token);

		//判断
		if(user == null){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}

		//获取userid
		String userId = user.getId()+"";
		//下单
		HttpResult result = seckillOrderService.startKilled(killId, userId);

		return result;

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
	@RequestMapping("/order/kill/locked/{killId}/{token}")
	public HttpResult startKilledByLocked(@PathVariable Long killId, @PathVariable String token){
		//判断
		if(StringUtils.isBlank(token)){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}
		//获取用户数据
		FrontUser user = seckillOrderService.getUserInfoFromRedis(token);

		//判断
		if(user == null){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}

		//获取userid
		String userId = user.getId()+"";
		//下单
		HttpResult result = seckillOrderService.startKilledByLocked(killId, userId);

		return result;

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
	@RequestMapping("/order/kill/forupdate/{killId}/{token}")
	public HttpResult startKilledByLockedWithForUpdate(@PathVariable Long killId, @PathVariable String token){
		//判断
		if(StringUtils.isBlank(token)){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}
		//获取用户数据
		FrontUser user = seckillOrderService.getUserInfoFromRedis(token);

		//判断
		if(user == null){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}

		//获取userid
		String userId = user.getId()+"";
		//下单
		HttpResult result = seckillOrderService.startKilledByLockedWithForUpdate(killId, userId);

		return result;

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
	@RequestMapping("/order/kill/version/{killId}/{token}")
	public HttpResult startKilledByLockedWithVersion(@PathVariable Long killId, @PathVariable String token){
		//判断
		if(StringUtils.isBlank(token)){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}
		//获取用户数据
		FrontUser user = seckillOrderService.getUserInfoFromRedis(token);

		//判断
		if(user == null){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}

		//获取userid
		String userId = user.getId()+"";
		//下单
		HttpResult result = seckillOrderService.startKilledByLockedWithVersion(killId, userId);

		return result;

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

	@RequestMapping("/order/kill/redis/{killId}/{token}")
	public HttpResult startKilledByLockedWithRedis(@PathVariable Long killId, @PathVariable String token){
		//判断
		if(StringUtils.isBlank(token)){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}
		//获取用户数据
		FrontUser user = seckillOrderService.getUserInfoFromRedis(token);

		//判断
		if(user == null){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}

		//获取userid
		String userId = user.getId()+"";
		//下单
		HttpResult result = seckillOrderService.startKilledByLockedWithRedis(killId, userId);

		return result;

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

	@RequestMapping("/order/kill/better/{killId}/{token}")
	public HttpResult startKilledMoreBetter(@PathVariable Long killId, @PathVariable String token){
		//判断
		if(StringUtils.isBlank(token)){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}
		//获取用户数据
		FrontUser user = seckillOrderService.getUserInfoFromRedis(token);

		//判断
		if(user == null){
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED,"用户未登录");
		}

		//获取userid
		String userId = user.getId()+"";

		try {
			// 在业务开始之前就发送一个消息：half message
			Object obj = executorService.submit(()-> {
                // 发送消息
				boolean res = producer.asncSendTransactionMsg(killId, userId);
				// 判断
				if(!res){
					return HttpResult.error("下单失败");
				}
				return res;
			}).get();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}

		return HttpResult.ok();

	}




}
