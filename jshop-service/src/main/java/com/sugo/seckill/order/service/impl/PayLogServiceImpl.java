package com.sugo.seckill.order.service.impl;

import java.util.Date;

import com.sugo.seckill.order.service.PayLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sugo.seckill.mapper.pay.TbPayLogMapper;
import com.sugo.seckill.pojo.TbPayLog;
import com.sugo.seckill.utils.IdWorker;

@Service
public class PayLogServiceImpl implements PayLogService {

	// 注入支付
	@Autowired
	private TbPayLogMapper payLogMapper;
	
	@Autowired
	private IdWorker idWorker;

	public TbPayLog insertOne(String orderIds,double money,String userId) {

		String out_trade_no = idWorker.nextId()+"";//订单编号
		TbPayLog payLog = new TbPayLog();
		payLog.setOutTradeNo(out_trade_no);
		payLog.setCreateTime(new Date());
		payLog.setTotalFee((long) (money*100));
		payLog.setUserId(userId);
		payLog.setTradeState("0");
		payLog.setOrderList(orderIds);
		payLog.setPayType("0");
		
		payLogMapper.insert(payLog);
		System.out.println("订单号======"+payLog.getOutTradeNo());
		return payLog;
	}

}
