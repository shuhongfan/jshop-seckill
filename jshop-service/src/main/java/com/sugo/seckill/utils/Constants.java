package com.sugo.seckill.utils;

/**
 * @ClassName Constants
 * @Description
 * @Author hubin
 * @Date 2021/6/4 22:39
 * @Version V1.0
 **/
public class Constants {

    // 定义redis分布式锁key
    public static final String DISTRIBUTED_REDIS_LOCK_KEY = "SECKILL_GOODS_LOCKED";

    // redis商品存储key
    public static final String REDIS_GOODS_INFO_KEY = "SECKILL_GOODS_";

    // 商品库存key
    public static final String REDIS_GOODS_STOCK_KEY = "SECKILL_GOODS_STOCK_";

    // 商品已售罄标识
    public static final String REDIS_GOODS_END_KEY = "SECKILL_GOODS_END_";

}

