package com.sugo.seckill.queue.disruptor;

import com.lmax.disruptor.EventFactory;

/**
 * @Description: 事件生成工厂（用来初始化预分配事件对象）
 * @Author: hubin
 * @CreateDate: 2020/7/15 11:25
 * @UpdateUser: hubin
 * @UpdateDate: 2020/7/15 11:25
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
public class SeckillEventFactory implements EventFactory<SeckillEvent> {

	@Override
    public SeckillEvent newInstance() {
		return new SeckillEvent();
	}
}
