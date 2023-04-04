package com.sugo.seckill.order.service;
import java.util.List;

import com.sugo.seckill.page.PageResult;
import com.sugo.seckill.pojo.TbAddress;
/**
 * 服务层接口
 * @author Administrator
 *
 */
public interface AddressService {

	/**
	 * 返回全部列表
	 * @return
	 */
	public List<TbAddress> findAll();


	/**
	 * 返回分页列表
	 * @return
	 */
	public PageResult findPage(int pageNum, int pageSize);
	
	
	/**
	 * 增加
	*/
	public void add(TbAddress address);
	
	
	/**
	 * 修改
	 */
	public void update(TbAddress address);
	

	/**
	 * 根据ID获取实体
	 * @param id
	 * @return
	 */
	public TbAddress findOne(Long id);
	
	
	/**
	 * 批量删除
	 * @param ids
	 */
	public void delete(Long[] ids);

	public void delete(Long ids);

	/**
	 * 根据用户账号查询地址列表
	 * @param userId
	 * @return
	 */
	public List<TbAddress> findListByUserId(String userId);
	
}
