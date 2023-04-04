package com.sugo.seckill.queue.disruptor;

import java.io.Serializable;

/**
 * @Description: 秒杀事件，秒杀对象
 * @Author: hubin
 * @CreateDate: 2020/7/15 11:24
 * @UpdateUser: hubin
 * @UpdateDate: 2020/7/15 11:24
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
public class SeckillEvent implements Serializable {
	private static final long serialVersionUID = 1L;
	private long seckillId;
	private long userId;
	
	public SeckillEvent(){
		
	}

	public long getSeckillId() {
		return seckillId;
	}

	public void setSeckillId(long seckillId) {
		this.seckillId = seckillId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}
	
}