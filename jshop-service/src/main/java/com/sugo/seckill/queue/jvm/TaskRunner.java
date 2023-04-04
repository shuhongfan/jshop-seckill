package com.sugo.seckill.queue.jvm;

import com.sugo.seckill.order.service.SeckillOrderService;
import com.sugo.seckill.pojo.TbSeckillOrder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

/**
 * 消费秒杀队列
 * 创建者
 * 创建时间	2020年8月9日
 */
@Component
public class TaskRunner implements ApplicationRunner {

    private final static Logger LOGGER = LoggerFactory.getLogger(TaskRunner.class);
	
	@Autowired
    private SeckillOrderService seckillService;

    @Override
    public void run(ApplicationArguments var){
        new Thread(() -> {
            LOGGER.info("提醒队列启动成功");
            // 开启一个线程，一直监听bockingQueue队列
            while(true){
                try {
                    //进程内队列
                    TbSeckillOrder order = SeckillQueue.getMailQueue().consume();
                    if(order!=null){
                        // 从队列中获取订单，执行下单操作
                      seckillService.startAsyncKilled(order);
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
}