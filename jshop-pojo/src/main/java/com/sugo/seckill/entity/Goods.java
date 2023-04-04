package com.sugo.seckill.entity;

import com.sugo.seckill.pojo.TbGoods;
import com.sugo.seckill.pojo.TbGoodsDesc;
import com.sugo.seckill.pojo.TbItem;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 商品组合实体类
 * @author Administrator
 *
 */
public class Goods implements Serializable{
	
	private TbGoods goods;//商品SPU基本信息
	private TbGoodsDesc goodsDesc;	//商品SPU扩展信息
	private List<TbItem> itemList;//SKU列表
	
	private Map map;//扩展属性
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	public TbGoods getGoods() {
		return goods;
	}
	public void setGoods(TbGoods goods) {
		this.goods = goods;
	}
	public TbGoodsDesc getGoodsDesc() {
		return goodsDesc;
	}
	public void setGoodsDesc(TbGoodsDesc goodsDesc) {
		this.goodsDesc = goodsDesc;
	}
	public List<TbItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<TbItem> itemList) {
		this.itemList = itemList;
	}
	
	
	
}
