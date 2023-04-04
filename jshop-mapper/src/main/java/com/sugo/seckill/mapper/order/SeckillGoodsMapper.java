package com.sugo.seckill.mapper.order;

import com.sugo.seckill.pojo.TbSeckillGoods;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;


public interface SeckillGoodsMapper extends Mapper<TbSeckillGoods> {

    @Select(value = "select * from tb_seckill_goods where id = #{seckillId} for update")
    @Results(value = {
            @Result(column = "id",property = "id"),
            @Result(column = "product_id",property = "productId"),
            @Result(column = "item_id",property = "itemId"),
            @Result(column = "image",property = "image"),
            @Result(column = "images",property = "images"),
            @Result(column = "title",property = "title"),
            @Result(column = "info",property = "info"),
            @Result(column = "price",property = "price"),
            @Result(column = "cost_price",property = "costPrice"),
            @Result(column = "unit_name",property = "unitName"),
            @Result(column = "postage",property = "postage"),
            @Result(column = "add_time",property = "addTime"),
            @Result(column = "status",property = "status"),
            @Result(column = "start_time_date",property = "startTimeDate"),
            @Result(column = "end_time_date",property = "endTimeDate"),
            @Result(column = "stock",property = "stock"),
            @Result(column = "mark",property = "mark"),
            @Result(column = "stock_count",property = "stockCount"),
            @Result(column = "description",property = "description")
    })
    TbSeckillGoods selectByPrimaryKeyBySQLLock(Long seckillId);

    /**
     * @Description: 悲观锁的另一种实现方式
     * @Author: hubin
     * @CreateDate: 2020/9/12 21:12
     * @UpdateUser: hubin
     * @UpdateDate: 2020/9/12 21:12
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
    @Update(value = "UPDATE tb_seckill_goods SET stock_count=stock_count-1 WHERE id=#{seckillId} AND stock_count>0")
    int updateSeckillGoodsByPrimaryKeyByLock(@Param("seckillId") Long seckillId);

    @Update(value = "UPDATE tb_seckill_goods SET stock_count= stock_count-1,version=version+1 WHERE id = #{seckillId} AND version = #{version} AND stock_count>0")
    int updateSeckillGoodsByPrimaryKeyByVersion(@Param("seckillId") Long seckillId, @Param("version") Integer version);

}
