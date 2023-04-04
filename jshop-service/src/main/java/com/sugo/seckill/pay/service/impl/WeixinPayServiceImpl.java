package com.sugo.seckill.pay.service.impl;

import java.util.HashMap;
import java.util.Map;

import com.sugo.seckill.config.StaticProperty;
import com.sugo.seckill.pay.service.WeixinPayService;
import com.sugo.seckill.utils.HttpClient;

import com.github.wxpay.sdk.WXPayUtil;

import org.springframework.stereotype.Service;

@Service
public class WeixinPayServiceImpl implements WeixinPayService {

	
	@Override
	public Map createNative(String out_trade_no, String total_fee) {
		
		//1.构建请求参数(给微信的)
		Map param=new HashMap<>();
		param.put("appid", StaticProperty.APPID);//公众号
		param.put("mch_id", StaticProperty.PARTNER);//商户号
		param.put("nonce_str", WXPayUtil.generateNonceStr());//随机串
		param.put("body", "品优购");
		param.put("out_trade_no", out_trade_no);//订单号
		param.put("total_fee", total_fee);//金额（分）
		param.put("spbill_create_ip", "127.0.0.1");
		param.put("notify_url", StaticProperty.NOTIFYURL);
		param.put("trade_type", "NATIVE");
		
		
		//转换为xml字符串(给出秘钥)
		try {
			String xmlParam = WXPayUtil.generateSignedXml(param, StaticProperty.PARTNERKEY);
			
			System.out.println("请求参数："+xmlParam);
			//2.通过httpclient请求微信支付接口
			HttpClient client=new HttpClient("https://api.mch.weixin.qq.com/pay/unifiedorder");
			client.setHttps(true);
			client.setXmlParam(xmlParam);
			client.post();
			//3.返回结果，转换为map
			String resultXml = client.getContent();
			System.out.println("返回参数："+resultXml);
			Map<String, String> resultMap = WXPayUtil.xmlToMap(resultXml);
			Map<String,String> map=new HashMap();
			
			if( "SUCCESS".equals(resultMap.get("result_code")) ){
				map.put("code_url", resultMap.get("code_url"));//返回的支付url
				map.put("out_trade_no", out_trade_no);//订单号
				map.put("total_fee", total_fee);//金额
			}			
			
			return map;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Map<String,String> map=new HashMap();
			return map;			
		}
		
	}

	@Override
	public Map queryOrderStatus(String out_trade_no) {
		//1.构建请求参数
		Map param=new HashMap<>();
		param.put("appid", StaticProperty.APPID);
		param.put("mch_id", StaticProperty.PARTNER);
		param.put("nonce_str", WXPayUtil.generateNonceStr());//随机串
		param.put("out_trade_no", out_trade_no);//订单号
		
		
		try {
			String xmlParam = WXPayUtil.generateSignedXml(param, StaticProperty.PARTNERKEY);
			System.out.println("查询请求参数："+xmlParam);
			//2.通过httpclient请求微信支付接口
			HttpClient client=new HttpClient("https://api.mch.weixin.qq.com/pay/orderquery");
			client.setHttps(true);
			client.setXmlParam(xmlParam);
			client.post();
						
			//3.获取返回结果 
			String resultXml = client.getContent();
			System.out.println("查询返回参数："+resultXml);
			Map<String, String> resultMap = WXPayUtil.xmlToMap(resultXml);
			return resultMap;
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return null;
		}
		
	}

}
