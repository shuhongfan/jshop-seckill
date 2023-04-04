package com.sugo.seckill.order.service;

import com.sugo.seckill.page.PageResult;
import com.sugo.seckill.pojo.TbSeckillGoods;

import java.io.IOException;
import java.util.List;

/**
 * 服务层接口
 * @author Administrator
 *
 */
public interface SeckillGoodsService {


	/**
	 * 返回分页列表
	 * @return
	 */
	public PageResult findPage(int pageNum, int pageSize);

	/**
	 * 根据ID获取实体
	 * @param id
	 * @return
	 */
	public TbSeckillGoods findOne(Integer id);


	public int insertOne(TbSeckillGoods tbSeckillGoods);

	public TbSeckillGoods findOneByCache(Integer id);

	/**
	 * 查询轮播图
	 * @param id 秒杀ID
	 * @throws IOException /
	 */
	List<String> getByIdImg(Integer id);
	
}
