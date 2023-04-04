package com.sugo.seckill.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/***
 *
 * @Author:jackhu
 * @Description:jackhu
 * @date: 2019/3/26 18:39
 *
 ****/
public class DateUtil {

    /***
     * 将字符串转成Date类型
     * @return
     */
    public static Date str2Date(String str){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        try {
            return simpleDateFormat.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  null;
    }

}
