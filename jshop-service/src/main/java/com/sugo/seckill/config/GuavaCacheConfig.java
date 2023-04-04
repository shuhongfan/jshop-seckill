package com.sugo.seckill.config;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName GuavaCacheConfig
 * @Description
 * @Author hubin
 * @Date 2021/1/23 20:52
 * @Version V1.0
 **/
@Configuration
public class GuavaCacheConfig {

    //定义一个guavacache对象
    private Cache<String,Object> commonCache = null;

    @PostConstruct
    public void init(){

        commonCache  = CacheBuilder.newBuilder()
                .initialCapacity(10)
                // 设置缓存中最大的支持存储缓存的key, 超过100个，采用LRU淘汰策略淘汰缓存
                .maximumSize(100)
                // 设置缓存写入后过期时间
                .expireAfterWrite(60, TimeUnit.SECONDS)
                .build();
    }


    @Bean
    public Cache<String,Object> getCommonCache(){
        return commonCache;
    }






}

