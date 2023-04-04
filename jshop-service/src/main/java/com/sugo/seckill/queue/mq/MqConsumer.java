package com.sugo.seckill.queue.mq;


import com.alibaba.fastjson.JSON;
import com.sugo.seckill.config.MqConfigProperties;
import com.sugo.seckill.mapper.order.SeckillGoodsMapper;
import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.common.consumer.ConsumeFromWhere;
import org.apache.rocketmq.common.message.MessageExt;
import org.apache.rocketmq.remoting.common.RemotingHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.util.Map;


@Component
public class MqConsumer {


    @Autowired
    private MqConfigProperties configProperties;


    @Autowired
    private SeckillGoodsMapper seckillGoodsMapper;

    @Bean
    public DefaultMQPushConsumer defaultMQPushConsumer() {
        DefaultMQPushConsumer consumer = new DefaultMQPushConsumer(configProperties.getNamesvc_group());
        consumer.setNamesrvAddr(configProperties.getNamesrvAddr());
        try {
            //广播模式消费
            //consumer.setMessageModel(MessageModel.BROADCASTING);
            consumer.subscribe("seckill_goods_asnc_stock", "*");

            // 如果是第一次启动，从队列头部开始消费
            // 如果不是第一次启动，从上次消费的位置继续消费
            consumer.setConsumeFromWhere(ConsumeFromWhere.CONSUME_FROM_FIRST_OFFSET);
            consumer.registerMessageListener((MessageListenerConcurrently) (list, context) -> {
                try {
                    for (MessageExt messageExt : list) {
                        String messageBody = new String(messageExt.getBody(), RemotingHelper.DEFAULT_CHARSET);

                        //
                        Map<String,String> maps = JSON.parseObject(messageBody, Map.class);

                        String seckillId = maps.get("seckillId");

                        //执行扣减库存的操作
                        //同步数据库的库存
                        seckillGoodsMapper.updateSeckillGoodsByPrimaryKeyByLock(Long.parseLong(seckillId));
                        System.out.println("[Consumer] msgID(" + messageExt.getMsgId() + ") msgBody : " + seckillId);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    //如果出现异常，必须告知消息进行重试
                    return ConsumeConcurrentlyStatus.RECONSUME_LATER;
                }
                return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
            });
            consumer.start();
            System.out.println("[Consumer 已启动]");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return consumer;
    }
}
