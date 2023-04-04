package com.sugo.seckill.web.demo;

import com.sugo.seckill.utils.IdWorker;

/**
 * @ClassName DemoTest
 * @Description
 * @Author hubin
 * @Date 2020/6/15 21:03
 * @Version V1.0
 **/
public class DemoTest {

    public static void main(String[] args) {

        //循环200次
        IdWorker idWorker = new IdWorker();
        for(int i=0; i<200; i++){
            long nextId = idWorker.nextId();

            System.out.println("================"+nextId+"===============");
        }

    }

}

