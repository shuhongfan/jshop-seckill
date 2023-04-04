package com.sugo.seckill.config;

import com.google.common.util.concurrent.RateLimiter;
import org.apache.http.conn.util.PublicSuffixList;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @ClassName CommonUtils
 * @Description
 * @Author hubin
 * @Date 2020/12/27 20:38
 * @Version V1.0
 **/
@Component
public class CommonUtils {


   @Bean
   public ExecutorService getExecutorService(){
       return Executors.newFixedThreadPool(20);
   }


   @Bean
   public RateLimiter getRatelimiter(){
       return RateLimiter.create(10);
   }




}

