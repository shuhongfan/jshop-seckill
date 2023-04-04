package com.sugo.seckill.pay.service.impl;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.sugo.seckill.config.AlipayConfig;
import com.sugo.seckill.pay.service.AlipayService;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Map;

@Service
public class AliPayServiceImpl implements AlipayService {

    public String createTradePay(String out_trade_no, String total_amount){
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest aliPayRequest = new AlipayTradePagePayRequest();
        String  subject ="开课吧秒杀商品";
        aliPayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        try {
            String response = alipayClient.pageExecute(aliPayRequest).getBody();
            System.out.println(response);
            return response;

        }catch (Exception e) {
            String response = "";
            System.out.println(response);
            return response;
        }
    }

    @Override
    public String tradeQuery(String out_trade_no) {

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradeQueryRequest aliPayRequest = new AlipayTradeQueryRequest ();
        aliPayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"}");
        try {
            String response = alipayClient.execute(aliPayRequest).getBody();
            return response;
        }catch (Exception e) {
            String response = null;
            return response;
        }
    }


}
