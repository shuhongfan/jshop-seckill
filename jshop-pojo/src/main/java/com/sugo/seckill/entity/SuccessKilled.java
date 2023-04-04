package com.sugo.seckill.entity;
import java.io.Serializable;

public class SuccessKilled implements Serializable{
	private static final long serialVersionUID = 1L;

	private Long seckillId;
	private Long userId;


	public Long getSeckillId() {
		return seckillId;
	}

	public void setSeckillId(Long seckillId) {
		this.seckillId = seckillId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
}
