package com.sugo.seckill.order.service.impl;

import com.github.pagehelper.PageInfo;
import com.google.common.cache.Cache;
import com.sugo.seckill.mapper.order.SeckillGoodsMapper;
import com.sugo.seckill.order.service.SeckillGoodsService;
import com.sugo.seckill.page.PageResult;
import com.sugo.seckill.pojo.TbSeckillGoods;
import org.apache.lucene.util.RamUsageEstimator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 服务实现层
 * @author Administrator
 *
 */
@Service
public class SeckillGoodsServiceImpl implements SeckillGoodsService {

      @Autowired
      private SeckillGoodsMapper seckillGoodsMapper;

      //注入redistemplate对象
      @Autowired
      private RedisTemplate redisTemplate;

      //注入guva缓存对象
      @Autowired
      private Cache<String,Object> guavaCahce;


      //日志
      private final static Logger LOGGER = LoggerFactory.getLogger(SeckillGoodsServiceImpl.class);


      /**
       * @Description: 商品列表信息
       * @Author: hubin
       * @CreateDate: 2020/6/9 18:44
       * @UpdateUser: hubin
       * @UpdateDate: 2020/6/9 18:44
       * @UpdateRemark: 修改内容
       * @Version: 1.0
       */
      @Override
      public PageResult findPage(int pageNum, int pageSize) {
            PageHelper.startPage(pageNum, pageSize);
            PageInfo<TbSeckillGoods> page = new PageInfo<>(seckillGoodsMapper.selectByExample(null));
            return new PageResult(page.getTotal(), page.getList());
      }


      /**
       * @Description: 根据商品id获取商品详情
       * @Author: hubin
       * @CreateDate: 2020/6/9 18:31
       * @UpdateUser: hubin
       * @UpdateDate: 2020/6/9 18:31
       * @UpdateRemark: 修改内容
       * @Version: 1.0
       */
      @Override
      public TbSeckillGoods findOne(Integer id){

            //直接从数据库查询
            //主键查询 ： cpu不耗时操作
            TbSeckillGoods  seckillGoods = seckillGoodsMapper.selectByPrimaryKey(id);
            //计算对象大小

            //模拟程序耗时操作，如果方法是一个笔记耗时的操作，性能优化非常有必要的！！
              try {
                  Thread.sleep(1000);

                  LOGGER.info("模拟耗时操作，睡眠1s时间！");
                  LOGGER.info("对象占用jvm堆内存大小: {}", RamUsageEstimator.humanSizeOf(seckillGoods));

            } catch (InterruptedException e) {
                  e.printStackTrace();
            }

            //返回结果
            return seckillGoods;

      }

      
      /**
       * @Description: 根据商品id获取商品详情
       * @Author: hubin
       * @CreateDate: 2020/6/9 18:31
       * @UpdateUser: hubin
       * @UpdateDate: 2020/6/9 18:31
       * @UpdateRemark: 修改内容
       * @Version: 1.0
       */
      public TbSeckillGoods findOneByCache(Integer id){
            //1、先从jvm堆缓存中读取数据，使用guva缓存
            TbSeckillGoods seckillGoods = (TbSeckillGoods) guavaCahce.getIfPresent("seckill_goods_"+id);

            //判断jvm堆内缓存是否存在
            if(seckillGoods == null){

                  //2、从分布式缓存中查询
                  seckillGoods = (TbSeckillGoods) redisTemplate.opsForValue().get("seckill_goods_"+id);

                  //判断
                  if(seckillGoods == null){
                        //3、直接从数据库查询
                        seckillGoods = seckillGoodsMapper.selectByPrimaryKey(id);
                        if(seckillGoods != null && seckillGoods.getStatus() == 1){
                              //添加缓存
                              redisTemplate.opsForValue().set("seckill_goods_"+id,seckillGoods,1,TimeUnit.HOURS);
                        }
                  }
                  //添加guava缓存
                  guavaCahce.put("seckill_goods_"+id,seckillGoods);
           }
            //如果缓存存在，返回Redis缓存
            return seckillGoods;
            
      }

      /**
       * @Description: 商品详情
       * @Author: hubin
       * @CreateDate: 2020/6/6 11:13
       * @UpdateUser: hubin
       * @UpdateDate: 2020/6/6 11:13
       * @UpdateRemark: 修改内容
       * @Version: 1.0
       */


      public int insertOne(TbSeckillGoods tbSeckillGoods){
           return seckillGoodsMapper.insertSelective(tbSeckillGoods);
      }

      /**
       * 根据秒杀ID查询
       * @param id 秒杀ID
       * @return
       */
      @Override
      public List<String> getByIdImg(Integer id)  {
            ArrayList<String> images = new ArrayList<>();
            TbSeckillGoods storeSeckill = seckillGoodsMapper.selectByPrimaryKey(id);
            if (storeSeckill != null){
                  String imageStr = storeSeckill.getImages();
                  String[] split = imageStr.split(",");
                  for (String s : split) {
                        images.add(s);
                  }
                  images.add(0,storeSeckill.getImage());
                  return images;
            }
            return null;
      }

}
