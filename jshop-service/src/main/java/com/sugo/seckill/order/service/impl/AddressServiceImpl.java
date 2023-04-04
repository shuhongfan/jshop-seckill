package com.sugo.seckill.order.service.impl;
import java.util.List;

import com.sugo.seckill.order.service.AddressService;
import com.sugo.seckill.mapper.cart.TbAddressMapper;
import com.sugo.seckill.page.PageResult;
import com.sugo.seckill.pojo.TbAddress;
import org.springframework.beans.factory.annotation.Autowired;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

/**
 * 服务实现层
 * @author Administrator
 *
 */
@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private TbAddressMapper addressMapper;
	
	/**
	 * 查询全部
	 */
	@Override
	@Transactional
	public List<TbAddress> findAll() {
		return addressMapper.selectByExample(null);

	}

	/**
	 * 按分页查询
	 */
	@Override
	@Transactional
	public PageResult findPage(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);		
		Page<TbAddress> page=   (Page<TbAddress>) addressMapper.selectByExample(null);
		return new PageResult(page.getTotal(), page.getResult());
	}

	/**
	 * 增加
	 */
	@Override
	@Transactional
	public void add(TbAddress address) {
		addressMapper.insert(address);		
	}

	
	/**
	 * 修改
	 */
	@Override
	@Transactional
	public void update(TbAddress address){
		addressMapper.updateByPrimaryKey(address);
	}	
	
	/**
	 * 根据ID获取实体
	 * @param id
	 * @return
	 */
	@Override
	@Transactional
	public TbAddress findOne(Long id){
		return addressMapper.selectByPrimaryKey(id);
	}

	/**
	 * 批量删除
	 */
	@Override
	@Transactional
	public void delete(Long[] ids) {
		for(Long id:ids){
			addressMapper.deleteByPrimaryKey(id);
		}		
	}

	@Override
	@Transactional
	public void delete(Long id) {

			addressMapper.deleteByPrimaryKey(id);

	}
	

	@Override
	@Transactional
	public List<TbAddress> findListByUserId(String userId) {
		Example example = new Example(TbAddress.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("userId",userId);
		return addressMapper.selectByExample(example);
	}
	
}
