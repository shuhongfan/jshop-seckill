package com.sugo.seckill.pay.service;

import java.util.Map;

public interface WeixinPayService {

	/**
	 * 生成二维码
	 * @param out_trade_no
	 * @param total_fee
	 * @return
	 */
	public Map createNative(String out_trade_no, String total_fee);
	
	/**
	 * 查询清单
	 * @param out_trade_no 订单号
	 * @return
	 */
	public Map queryOrderStatus(String out_trade_no);
	
}
