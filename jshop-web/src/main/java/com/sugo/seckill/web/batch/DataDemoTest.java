package com.sugo.seckill.web.batch;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

/**
 * @ClassName DataDemoTest
 * @Description
 * @Author hubin
 * @Date 2020/8/11 10:06
 * @Version V1.0
 **/
public class DataDemoTest {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        final String url = "jdbc:mysql://39.105.200.72:3306/shop?useUnicode=true&characterEncoding=utf8&autoReconnect=true&allowMultiQueries=true" ;
        final String name = "com.mysql.jdbc.Driver" ;
        final String user = "root" ;
        final String password = "root" ;
        Connection conn = null ;
        Class.forName(name); //指定连接类型
        conn = DriverManager.getConnection(url, user, password); //获取连接
        if (conn!= null ) {
            System.out.println( "获取连接成功" );
            insert(conn);
        } else {
            System.out.println( "获取连接失败" );
        }
    }
    public static void insert(Connection conn) {
        // 开始时间
        Long begin = new Date().getTime();
        // sql前缀


        String prefix = "insert  into tb_seckill_goods(product_id,image,images,mark," +
                "title,info,price,cost_price,ot_price,give_integral,sort,stock,stock_count," +
                "sales,unit_name,postage,description,start_time,stop_time,add_time,status," +
                "is_postage,is_hot,is_del,num,is_show,end_time_date,start_time_date,time_id,version) values" ;
        try {
            // 保存sql后缀
            StringBuffer suffix = new StringBuffer();
            // 设置事务为非自动提交
            conn.setAutoCommit( false );
            // 比起st，pst会更好些
            PreparedStatement pst = (PreparedStatement) conn.prepareStatement( "" );
            //准备执行语句
            // 外层循环，总提交事务次数
            for ( int i = 1 ; i <= 100 ; i++) {
                suffix = new StringBuffer();
                // 第j次提交步长
                for ( int j = 1 ; j <= 100000 ; j++) {
                    // 构建SQL后缀
                   String str =  "(30,'https://img.kaikeba.com/under_line_shalong_one.png','https://img.kaikeba.com/under_line_shalong_one.png',NULL,'开课吧java架构师','开课吧课程',9.90,50.00,99.00,0.00,1,100,375,0,'开课吧 秒杀实战落地开启最强实战!',10.00,'开课吧课程',1590940800,1593446400,'1592997034',1,0,0,0,1,1,'2020-06-30 00:00:00','2020-06-01 00:00:00',212,0),";
                   suffix.append(str);
                }
                // 构建完整SQL
                String sql = prefix + suffix.substring( 0 , suffix.length() - 1 );
                // 添加执行SQL
                pst.addBatch(sql);
                // 执行操作
                pst.executeBatch();
                // 提交事务
                conn.commit();
                // 清空上一次添加的数据
                suffix = new StringBuffer();
            }
            // 头等连接
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // 结束时间
        Long end = new Date().getTime();
        // 耗时
        System.out.println( "1000万条数据插入花费时间 : " + (end - begin) / 1000 + " s" );
        System.out.println( "插入完成" );
    }



}

