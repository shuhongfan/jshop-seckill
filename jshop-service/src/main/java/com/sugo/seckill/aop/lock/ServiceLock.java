package com.sugo.seckill.aop.lock;

import java.lang.annotation.*;

/**
 * @ClassName ServiceRedisLock
 * @Description 自定义注解,实现aop锁
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

