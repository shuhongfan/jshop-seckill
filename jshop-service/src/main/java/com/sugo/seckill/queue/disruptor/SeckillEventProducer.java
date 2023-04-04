package com.sugo.seckill.queue.disruptor;

import com.lmax.disruptor.EventTranslatorVararg;
import com.lmax.disruptor.RingBuffer;

/**
 * @Description: 使用translator方式生产者
 * @Author: hubin
 * @CreateDate: 2020/7/15 11:25
 * @UpdateUser: hubin
 * @UpdateDate: 2020/7/15 11:25
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
public class SeckillEventProducer {
	
	private final static EventTranslatorVararg<SeckillEvent> translator = (seckillEvent, seq, objs) -> {
        seckillEvent.setSeckillId((Long) objs[0]);
        seckillEvent.setUserId((Long) objs[1]);
    };

	private final RingBuffer<SeckillEvent> ringBuffer;
	
	public SeckillEventProducer(RingBuffer<SeckillEvent> ringBuffer){
		this.ringBuffer = ringBuffer;
	}
	
	public void seckill(long seckillId, long userId){
		this.ringBuffer.publishEvent(translator, seckillId, userId);
	}
}
