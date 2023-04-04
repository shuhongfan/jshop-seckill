package com.sugo.seckill.queue.mq;


import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.ser.Serializers;
import com.sugo.seckill.config.MqConfigProperties;
import com.sugo.seckill.error.BaseException;
import com.sugo.seckill.mapper.order.SeckillGoodsMapper;
import com.sugo.seckill.order.service.SeckillOrderService;
import com.sugo.seckill.pojo.TbSeckillGoods;
import com.sugo.seckill.utils.Constants;
import org.apache.rocketmq.client.producer.*;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.common.message.MessageExt;
import org.apache.rocketmq.remoting.common.RemotingHelper;
import org.redisson.misc.Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

@Component
public class MqProducer {



    @Autowired
    private MqConfigProperties configProperties;


    //private DefaultMQProducer producer;
    private TransactionMQProducer producer;

    //注入订单服务
    @Autowired
    private SeckillOrderService orderService;

    //注入
    @Autowired
    private SeckillGoodsMapper seckillGoodsMapper;

    // 注入
    @Autowired
    private RedisTemplate redisTemplate;


    @PostConstruct
    public void initProducer() {
        producer = new TransactionMQProducer(configProperties.getNamesvc_group());
        producer.setNamesrvAddr(configProperties.getNamesrvAddr());
        producer.setRetryTimesWhenSendFailed(3);
        try {
            producer.start();

            // 设置一个监听器
            producer.setTransactionListener(new TransactionListener() {

                /*执行本地业务方法*/
                @Override
                public LocalTransactionState executeLocalTransaction(Message message, Object o) {

                    String seckillId = null;
                    try {
                        // 获取消息
                        String msg = new String(message.getBody(), RemotingHelper.DEFAULT_CHARSET);
                        // 把消息转换为map
                        Map<String,String> maps = JSON.parseObject(msg,Map.class);
                        // 获取数据
                        seckillId = maps.get("seckillId");
                        String userId = maps.get("userId");

                        // 调用下单业务方法，实现下单操作
                        orderService.startKilledMoreBetter(Long.parseLong(seckillId),userId);

                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }catch (BaseException e){
                        // 订单下单异常现象，为了保证缓存操作一致性，需要对库存做回补
                        redisTemplate.opsForValue().increment(Constants.REDIS_GOODS_STOCK_KEY+seckillId, 1);
                    }


                    return null;
                }

                /*状态回查,确定事务提交，还是回滚*/
                @Override
                public LocalTransactionState checkLocalTransaction(MessageExt messageExt) {

                    try {
                        // 获取消息
                        String msg = new String(messageExt.getBody(), RemotingHelper.DEFAULT_CHARSET);
                        // 把消息转换为map
                        Map<String,String> maps = JSON.parseObject(msg,Map.class);
                        // 获取数据
                        String seckillId = maps.get("seckillId");

                        // 根据id查询事务状态
                        TbSeckillGoods seckillGoods = seckillGoodsMapper.selectByPrimaryKey(seckillId);

                        // 获取事务状态
                        Integer tranStatus = seckillGoods.getTranStatus();

                        if (null != tranStatus) {
                            switch (tranStatus) {
                                case 0:
                                    return LocalTransactionState.UNKNOW;
                                case 1:
                                    return LocalTransactionState.COMMIT_MESSAGE;
                                case 2:
                                    return LocalTransactionState.ROLLBACK_MESSAGE;
                            }
                        }
                        return LocalTransactionState.COMMIT_MESSAGE;


                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }


                    return null;
                }
            });


            System.out.println("[Producer 已启动]");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String send(String topic, String tags, String msg) {
        SendResult result = null;
        try {
            Message message = new Message(topic, tags, msg.getBytes(RemotingHelper.DEFAULT_CHARSET));
            result = producer.send(message);
            System.out.println("[Producer] msgID(" + result.getMsgId() + ") " + result.getSendStatus());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "{\"MsgId\":\"" + result.getMsgId() + "\"}";
    }

    @PreDestroy
    public void shutDownProducer() {
        if (producer != null) {
            producer.shutdown();
        }
    }

    /**
     * @Description: 发送消息，同步数据库库存
     * @Author: hubin
     * @CreateDate: 2020/10/26 21:59
     * @UpdateUser: hubin
     * @UpdateDate: 2020/10/26 21:59
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
    public boolean asncSendMsg(Long seckillId) {
        try {
            Message message = new Message("seckill_goods_asnc_stock", "increase", (seckillId+"").getBytes(RemotingHelper.DEFAULT_CHARSET));
            //发送消息
            producer.send(message);
        } catch (Exception e) {
            e.printStackTrace();
            //发送失败
            return false;
        }
        return true;
    }



    /**
     * @Description: 发送消息，使用事务型消息把所有的操作原子化
     * @Author: hubin
     * @CreateDate: 2020/10/26 21:59
     * @UpdateUser: hubin
     * @UpdateDate: 2020/10/26 21:59
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
    public boolean asncSendTransactionMsg(Long seckillId,String userId) {
        try {

            Map<String,String> maps = new HashMap<>();
            maps.put("seckillId",seckillId+"");
            maps.put("userId",userId);

            //把对象转换为字符串
            String jsonStr = JSON.toJSONString(maps);

            // 发送sekillId,userId
            Message message = new Message("seckill_goods_asnc_stock", "increase", jsonStr.getBytes(RemotingHelper.DEFAULT_CHARSET));
            //发送事务消息
            producer.sendMessageInTransaction(message,null);
        } catch (Exception e) {
            e.printStackTrace();
            //发送失败
            return false;
        }
        return true;
    }
}
