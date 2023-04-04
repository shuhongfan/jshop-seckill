package com.sugo.seckill.queue.disruptor;

import com.lmax.disruptor.EventHandler;
import com.sugo.seckill.config.SpringUtil;
import com.sugo.seckill.order.service.SeckillOrderService;

/**
 * @Description: 消费者(秒杀处理器)
 * @Author: hubin
 * @CreateDate: 2020/7/15 11:25
 * @UpdateUser: hubin
 * @UpdateDate: 2020/7/15 11:25
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
public class SeckillEventConsumer implements EventHandler<SeckillEvent> {
	
	private SeckillOrderService seckillService = (SeckillOrderService) SpringUtil.getBean("seckillOrderService");
	
	@Override
    public void onEvent(SeckillEvent seckillEvent, long seq, boolean bool) {
		//seckillService.startSubmitOrder(seckillEvent.getSeckillId(), seckillEvent.getUserId()+"");
	}
}
