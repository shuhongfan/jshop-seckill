package com.sugo.seckill.web.pay;

import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.sugo.seckill.http.HttpResult;
import com.sugo.seckill.http.HttpStatus;
import com.sugo.seckill.order.service.PayLogService;
import com.sugo.seckill.order.service.SeckillOrderService;
import com.sugo.seckill.pay.service.AlipayService;
import com.sugo.seckill.pay.service.WeixinPayService;
import com.sugo.seckill.pojo.FrontUser;
import com.sugo.seckill.pojo.TbPayLog;
import com.sugo.seckill.pojo.TbSeckillOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


@RestController
@RequestMapping("/pay")
public class PayController {

	@Autowired
	private WeixinPayService weixinPayService;

	@Autowired
	private SeckillOrderService orderService;

	@Autowired
	private AlipayService alipayService;

	@Autowired
	private PayLogService payLogService;

	/**
	 * 请求统一下单接口
	 * @return
	 */
	@RequestMapping("/createNative")
	public Map createNative(){

		String userId = "";

		TbPayLog payLog = orderService.searchPayLogFromRedis(userId);

        return weixinPayService.createNative(payLog.getOutTradeNo(), payLog.getTotalFee()+"");
	}

	/**
	 * 支付宝支付接口
	 * @return
	 */
	@RequestMapping("/createTradePay/{orderId}")
	public HttpResult createTradePay(@PathVariable long orderId, HttpServletRequest request){
		String token = request.getHeader("Authorization");
		// 单体架构，用户数据从当前session中获取
		FrontUser user = orderService.getUserInfoFromRedis(token);
		//根据订单号查询订单信息
		TbSeckillOrder seckillOrder = orderService.findOrderById(Long.valueOf(orderId));
		// 判断
		String userId = user.getId() + "";
		TbPayLog payLog = payLogService.insertOne(orderId+"",seckillOrder.getMoney().doubleValue(),userId);
		System.out.println("========"+payLog.getOutTradeNo());
		String payUrl = alipayService.createTradePay(payLog.getOutTradeNo(),seckillOrder.getMoney().doubleValue()+"");
		HttpResult httpResult = new HttpResult();
		httpResult.setData(payUrl);
		return httpResult;
	}


 @RequestMapping("/tradeQuery")
  public HttpResult tradeQuery(String out_trade_no){
	 HttpResult result=null;
	 int x=0;
	 while(true){
		 String  response = alipayService.tradeQuery(out_trade_no);
		 JSONObject json = JSONObject.parseObject(response);
		 String queryResponse = json.getString("alipay_trade_query_response");
		 JSONObject queryJson = JSONObject.parseObject(queryResponse);
		 if(response==null){
			 result=HttpResult.error(HttpStatus.SC_NOT_FOUND, "查询发生错误！");
			 break;
		 }
		 if("Success".equals(queryJson.get("msg"))  ){
			 //判断交易状态
			 result=HttpResult.ok("支付成功");
			 //修改订单状态
//			 orderService.updateOrderStatus(out_trade_no,"4200000005201710147980202916");
			 break;
		 }
		 System.out.println("调用查询："+response);


		 try {
			 Thread.sleep(3000);//间隔三秒
		 } catch (InterruptedException e) {
			 e.printStackTrace();
		 }
		 x++;

		 if(x>=100){
			 result=HttpResult.error(HttpStatus.SC_REQUEST_TIMEOUT,"二维码超时");
			 break;
		 }

	 }

	 return result;
 }


	@RequestMapping("/queryOrderStatus")
	public HttpResult queryOrderStatus(String out_trade_no){
		HttpResult result=null;
		int x=0;
		while(true){

			Map map = weixinPayService.queryOrderStatus(out_trade_no);
			if(map==null){
				result=HttpResult.error(HttpStatus.SC_NOT_FOUND, "查询发生错误！");
				break;
			}
			if("SUCCESS".equals(map.get("trade_state"))  ){
				//判断交易状态
				result=HttpResult.ok("支付成功");
				//修改订单状态
				orderService.updateOrderStatus(out_trade_no,(String)map.get("transaction_id") );
				break;
			}
			System.out.println("调用查询："+map);


			try {
				Thread.sleep(3000);//间隔三秒
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			x++;

			if(x>=100){
				result=HttpResult.error(HttpStatus.SC_REQUEST_TIMEOUT,"二维码超时");
				break;
			}

		}

		return result;
	}


	/**
	 * 根据订单Id获取订单金额
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/getOrderMoney/{orderId}")
	public HttpResult getOrderMoney(@PathVariable Long orderId){
		return orderService.getOrderMoney(orderId);
	}
}
