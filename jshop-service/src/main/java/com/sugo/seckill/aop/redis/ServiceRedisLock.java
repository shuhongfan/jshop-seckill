package com.sugo.seckill.aop.redis;

import java.lang.annotation.*;

/**
 * @ClassName ServiceRedisLock
 * @Description
 * @Author hubin
 * @Date 2021/6/4 21:04
 * @Version V1.0
 **/
@Target({ElementType.PARAMETER,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ServiceRedisLock {

    String description() default "";

}

