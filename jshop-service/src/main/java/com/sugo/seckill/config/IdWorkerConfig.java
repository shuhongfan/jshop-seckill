package com.sugo.seckill.config;

import com.sugo.seckill.utils.IdWorker;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @ClassName IdWorker
 * @Description
 * @Author hubin
 * @Date 2020/6/15 21:09
 * @Version V1.0
 **/
@Configuration
public class IdWorkerConfig {

    @Bean
    public IdWorker getIdWorkder(){
        return new IdWorker();
    }

}

