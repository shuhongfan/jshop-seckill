package com.sugo.seckill.web.order;
import java.util.Date;
import java.util.List;

import com.sugo.seckill.order.service.AddressService;
import com.sugo.seckill.http.HttpResult;
import com.sugo.seckill.http.HttpStatus;
import com.sugo.seckill.order.service.SeckillOrderService;
import com.sugo.seckill.page.PageResult;
import com.sugo.seckill.pojo.FrontUser;
import com.sugo.seckill.pojo.TbAddress;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * controller
 * @author Administrator
 *
 */
@RestController
@RequestMapping("/address")
public class AddressController {

	@Autowired
	private AddressService addressService;

	@Autowired
	private SeckillOrderService seckillOrderService;
	
	/**
	 * 返回全部列表
	 * @return
	 */
	@RequestMapping("/findAll")
	public HttpResult findAll(HttpServletRequest request){
		String token = request.getHeader("Authorization");

		//判断
		if(StringUtils.isBlank(token)){
			return null;
//			return HttpResult.error(HttpStatus.SC_FORBIDDEN,"先登录，才能抢购哦!");
		}

		//单体架构，用户数据从当前session中获取
		FrontUser frontUser = seckillOrderService.getUserInfoFromRedis(token);

		//判断用户是否登录
		if(frontUser == null){
			return null;
//			return HttpResult.error(HttpStatus.SC_FORBIDDEN,"先登录，才能抢购哦!");
		}
		HttpResult httpResult = new HttpResult();
		httpResult.setData(addressService.findListByUserId(String.valueOf(frontUser.getId())));
		return httpResult;
	}
	
	
	/**
	 * 返回全部列表
	 * @return
	 */
	@RequestMapping("/findPage/{page}/{rows}")
	public PageResult findPage(@PathVariable Integer page, @PathVariable Integer rows){
		return addressService.findPage(page, rows);
	}
	
	/**
	 * 增加
	 * @param address
	 * @return
	 */
	@RequestMapping("/add")
	public HttpResult add(@RequestBody TbAddress address, HttpServletRequest request){
		String token = request.getHeader("Authorization");

		//判断
		if(StringUtils.isBlank(token)){
			return HttpResult.error(HttpStatus.SC_FORBIDDEN,"先登录，才能抢购哦!");
		}

		//单体架构，用户数据从当前session中获取
		FrontUser frontUser = seckillOrderService.getUserInfoFromRedis(token);

		//判断用户是否登录
		if(frontUser == null){
			return HttpResult.error(HttpStatus.SC_FORBIDDEN,"先登录，才能抢购哦!");
		}


		try {

			address.setCreateDate(new Date());
			address.setUserId(String.valueOf(frontUser.getId()));
			addressService.add(address);
			return HttpResult.ok("增加成功");
		} catch (Exception e) {
			e.printStackTrace();
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED, "增加失败");
		}
	}


	
	/**
	 * 修改
	 * @param address
	 * @return
	 */
	@RequestMapping("/update")
	public HttpResult update(@RequestBody TbAddress address){
		try {
			addressService.update(address);
			return HttpResult.ok("修改成功");
		} catch (Exception e) {
			e.printStackTrace();
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED, "修改失败");
		}
	}	
	
	/**
	 * 获取实体
	 * @param id
	 * @return
	 */
	@RequestMapping("/findOne/{id}")
	public TbAddress findOne(@PathVariable Long id){

	    return addressService.findOne(id);
	}
	
	/**
	 * 批量删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete/{id}")
	public HttpResult delete(@PathVariable Long id){
		try {

			addressService.delete(id);
			return HttpResult.ok("删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			return HttpResult.error(HttpStatus.SC_EXPECTATION_FAILED, "删除失败");
		}
	}
	
		/**
	 * 查询+分页
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/search")
	public PageResult search( int page, int rows  ){
		return addressService.findPage(page, rows);
	}
	
	/**
	 * 获取当前登录人的地址
	 * @return
	 */
	@RequestMapping("/findListByLoginUser")
	public List<TbAddress> findListByLoginUser(){
				
		String userId= "";
		return addressService.findListByUserId(userId);
	}
	
}
