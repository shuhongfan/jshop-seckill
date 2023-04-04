package com.sugo.seckill.utils;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Map;

/**
 * @ClassName BeanUtils
 * @Description TODO
 * @Author wesker
 * @Date 7/19/2019 5:21 PM
 * @Version 1.0
 **/
public class BeanUtils {


    private BeanUtils() {
    }

    public static <T> T convertMapToObject(Map dataMap, Class<T> t) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(dataMap);
        T obj = JSON.parseObject(json, t);
        return obj;
    }
}
