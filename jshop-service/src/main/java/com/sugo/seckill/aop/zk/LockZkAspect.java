package com.sugo.seckill.aop.zk;

import com.sugo.seckill.distributedlock.zookeeper.ZkLockUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.context.annotation.Scope;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @ClassName LockAspect
 * @Description
 * @Author hubin
 * @Date 2021/6/4 21:06
 * @Version V1.0
 **/
@Component
@Scope
@Aspect
@Order(1)
public class LockZkAspect {


    @Pointcut("@annotation(com.sugo.seckill.aop.zk.ServiceZkLock)")
    public void lockAspect(){

    }

    // 增强方法
    @Around("lockAspect()")
    public Object around(ProceedingJoinPoint joinPoint){

        Object obj = null;
        // 加锁
        boolean acquire = ZkLockUtil.acquire(10, TimeUnit.SECONDS);
        // 执行业务
        try {
            if(acquire){

                obj = joinPoint.proceed();
            }
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        } finally {
            // 释放锁
            if(acquire){

                ZkLockUtil.release();
            }
        }

        return obj;

    }



}

