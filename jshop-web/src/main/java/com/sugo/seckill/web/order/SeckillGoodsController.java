package com.sugo.seckill.web.order;
import java.util.List;

import com.sugo.seckill.http.HttpResult;
import com.sugo.seckill.order.service.SeckillGoodsService;
import com.sugo.seckill.page.PageResult;
import com.sugo.seckill.pojo.TbSeckillGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Id;


/**
 * @desc 秒杀商品
 * @author hubin
 */
@RestController
@RequestMapping("/seckill")
public class SeckillGoodsController {

	@Autowired
	private SeckillGoodsService seckillGoodsService;


	@RequestMapping("/goods/test")
	public String test(){
		try{
			//模拟业务执行
			Thread.sleep(1000L);
		}catch (Exception e){
			e.printStackTrace();
		}
		return "{'goods:':'商品测试'}";
	}

	/**
	 * 返回全部列表
	 * @return
	 */
	@RequestMapping("/goods/list/{page}/{rows}")
	public PageResult list(@PathVariable Integer page, @PathVariable Integer rows){
		return seckillGoodsService.findPage(page, rows);
	}

	

	/**
	 * @Description: 商品详情信息获取
	 * @Author: hubin
	 * @CreateDate: 2020/6/9 18:29
	 * @UpdateUser: hubin
	 * @UpdateDate: 2020/6/9 18:29
	 * @UpdateRemark: 修改内容
	 * @Version: 1.0
	 */
	@RequestMapping(value = "/goods/detail/{seckillId}",method = RequestMethod.GET)
	public TbSeckillGoods findOne(@PathVariable Integer seckillId){
		// 接入缓存方法
		return seckillGoodsService.findOneByCache(seckillId);
	}


	@RequestMapping(value = "/goods/insert",method = RequestMethod.POST)
	public HttpResult insert(@RequestBody TbSeckillGoods tbSeckillGoods){
		int count =  seckillGoodsService.insertOne(tbSeckillGoods);
		return  HttpResult.ok(count);
	}

	@RequestMapping(value = "/goods/image/{seckillId}",method = RequestMethod.GET)
	public List<String> getImg(@PathVariable Integer seckillId){
		return seckillGoodsService.getByIdImg(seckillId);
	}
}
