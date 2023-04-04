package com.sugo.seckill.queue.disruptor;

import com.lmax.disruptor.RingBuffer;
import com.lmax.disruptor.dsl.Disruptor;

import java.util.concurrent.ThreadFactory;

/**
 * @Description: 方法描述
 * @Author: hubin
 * @CreateDate: 2020/7/15 11:28
 * @UpdateUser: hubin
 * @UpdateDate: 2020/7/15 11:28
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
public class DisruptorUtil {
	
	static Disruptor<SeckillEvent> disruptor;
	static{
		SeckillEventFactory factory = new SeckillEventFactory();
		int ringBufferSize = 1024;
		ThreadFactory threadFactory = runnable -> new Thread(runnable);
		disruptor = new Disruptor<>(factory, ringBufferSize, threadFactory);
		disruptor.handleEventsWith(new SeckillEventConsumer());
		disruptor.start();
	}
	
	public static void producer(SeckillEvent kill){
		RingBuffer<SeckillEvent> ringBuffer = disruptor.getRingBuffer();
		SeckillEventProducer producer = new SeckillEventProducer(ringBuffer);
		producer.seckill(kill.getSeckillId(),kill.getUserId());
	}
}
