package com.sugo.seckill.aop.lock;

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
public @interface ServiceLock {

    String description() default "";

}

