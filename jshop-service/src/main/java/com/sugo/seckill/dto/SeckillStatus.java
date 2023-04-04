package com.sugo.seckill.dto;

import java.io.Serializable;
import java.util.Date;

/***
 * @Author:jackhu
 * @Description:jackhu
 * @date: 2019/3/29 15:03
 *  记录用户抢单信息
 ****/
public class SeckillStatus implements Serializable {
    //秒杀用户名
    private String userId;
    //创建时间
    private Date createTime;
    //秒杀状态  1:排队中，2:秒杀等待支付,3:支付超时，4:秒杀失败,5:支付完成
    private Integer status;
    //秒杀的商品ID
    private Long goodsId;

    public SeckillStatus() {
    }

    public SeckillStatus(String userId, Date createTime, Integer status, Long goodsId) {
        this.userId = userId;
        this.createTime = createTime;
        this.status = status;
        this.goodsId = goodsId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }
}
