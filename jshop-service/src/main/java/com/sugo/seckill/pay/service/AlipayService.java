package com.sugo.seckill.pay.service;

import com.alipay.api.AlipayApiException;

import java.io.IOException;
import java.util.Map;

public interface AlipayService {

    /**
     *
     * @param out_trade_no
     * @param total_amount
     * @return
     */
    public String createTradePay(String out_trade_no, String total_amount) ;


   public String tradeQuery(String out_trade_no);
}
