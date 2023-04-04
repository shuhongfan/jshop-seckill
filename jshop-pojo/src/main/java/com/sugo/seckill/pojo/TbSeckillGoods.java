package com.sugo.seckill.pojo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;


public class TbSeckillGoods {

    /** 商品秒杀产品表id */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    /** 商品id */
    private Long productId;


    /** 推荐图 */
    private String image;


    /** 轮播图 */
    private String images;


    /** 活动标题 */
    private String title;
    /** 活动标签 */
    private String mark;


    /** 简介 */
    private String info;



    /** 价格 */
    private BigDecimal price;


    /** 秒杀价格 */
    private BigDecimal costPrice;


    /** 原价 */
    private BigDecimal otPrice;


    /** 返多少积分 */
    private BigDecimal giveIntegral;


    /** 排序 */
    private Integer sort;


    /** 秒杀商品数 */
    private Integer stock;

    /** 剩余库存数 */
    private Integer stockCount;


    /** 销量 */
    private Integer sales;


    /** 单位名 */
    private String unitName;


    /** 邮费 */
    private BigDecimal postage;


    /** 内容 */
    private String description;


    /** 开始时间 */
    private Integer startTime;


    /** 结束时间 */
    private Integer stopTime;


    /** 添加时间 */
    private String addTime;


    /** 产品状态 */
    private Integer status;


    /** 是否包邮 */
    private Integer isPostage;


    /** 热门推荐 */
    private Integer isHot;


    /** 删除 0未删除1已删除 */
    private Integer isDel;


    /** 最多秒杀几个 */
    private Integer num;


    /** 显示 */
    private Integer isShow;

    private Date endTimeDate;

    private Date startTimeDate;


    /** 时间段id */
    private Integer timeId;
    /** 时间段id */
    private Integer version;


    private Integer tranStatus;

    public Integer getTranStatus() {
        return tranStatus;
    }

    public void setTranStatus(Integer tranStatus) {
        this.tranStatus = tranStatus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(BigDecimal costPrice) {
        this.costPrice = costPrice;
    }

    public Integer getStockCount() {
        return stockCount;
    }

    public void setStockCount(Integer stockCount) {
        this.stockCount = stockCount;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public BigDecimal getOtPrice() {
        return otPrice;
    }

    public void setOtPrice(BigDecimal otPrice) {
        this.otPrice = otPrice;
    }

    public BigDecimal getGiveIntegral() {
        return giveIntegral;
    }

    public void setGiveIntegral(BigDecimal giveIntegral) {
        this.giveIntegral = giveIntegral;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public BigDecimal getPostage() {
        return postage;
    }

    public void setPostage(BigDecimal postage) {
        this.postage = postage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStartTime() {
        return startTime;
    }

    public void setStartTime(Integer startTime) {
        this.startTime = startTime;
    }

    public Integer getStopTime() {
        return stopTime;
    }

    public void setStopTime(Integer stopTime) {
        this.stopTime = stopTime;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsPostage() {
        return isPostage;
    }

    public void setIsPostage(Integer isPostage) {
        this.isPostage = isPostage;
    }

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public Date getEndTimeDate() {
        return endTimeDate;
    }

    public void setEndTimeDate(Date endTimeDate) {
        this.endTimeDate = endTimeDate;
    }

    public Date getStartTimeDate() {
        return startTimeDate;
    }

    public void setStartTimeDate(Date startTimeDate) {
        this.startTimeDate = startTimeDate;
    }

    public Integer getTimeId() {
        return timeId;
    }

    public void setTimeId(Integer timeId) {
        this.timeId = timeId;
    }
}
