package com.sugo.seckill.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @ClassName MqConfigProperties
 * @Description
 * @Author hubin
 * @Date 2021/6/8 22:07
 * @Version V1.0
 **/
@Component
@ConfigurationProperties(prefix = "rocketmq")
public class MqConfigProperties {

    private String namesvc_group;
    private String namesrvAddr;

    public String getNamesvc_group() {
        return namesvc_group;
    }

    public void setNamesvc_group(String namesvc_group) {
        this.namesvc_group = namesvc_group;
    }

    public String getNamesrvAddr() {
        return namesrvAddr;
    }

    public void setNamesrvAddr(String namesrvAddr) {
        this.namesrvAddr = namesrvAddr;
    }
}

