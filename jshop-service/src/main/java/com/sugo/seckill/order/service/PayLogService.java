package com.sugo.seckill.order.service;

import com.sugo.seckill.pojo.TbPayLog;

public interface PayLogService {
	
	public TbPayLog insertOne(String orderIds, double money, String userId);

}
