package com.sugo.seckill.user.impl;

import com.sugo.seckill.http.HttpResult;
import com.sugo.seckill.http.HttpStatus;
import com.sugo.seckill.mapper.user.UserMapper;
import com.sugo.seckill.pojo.FrontUser;
import com.sugo.seckill.user.UserService;
import com.sugo.seckill.utils.JsonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * Created by on 2020/5/25.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    //注入Redis
    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * @Description: 查询所有的用户数据
     * @Author: hubin
     * @CreateDate: 2020/5/25 17:35
     * @UpdateUser: hubin
     * @UpdateDate: 2020/5/25 17:35
     * @UpdateRemark: 查询所有的用户数据
     * @Version: 1.0
     */
    public List<FrontUser> getAllUser() {
        return userMapper.selectAll();
    }

    /**
     * @Description: 登录
     * @Author: hubin
     * @CreateDate: 2020/6/9 17:07
     * @UpdateUser: hubin
     * @UpdateDate: 2020/6/9 17:07
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
    @Transactional
    public HttpResult login(FrontUser frontUser) {

        //根据用户查询
        Example example = new Example(FrontUser.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("username", frontUser.getUsername());
        List<FrontUser> list = userMapper.selectByExample(example);

        //判断用户是否存在
        if(list==null || list.size()==0){
            return HttpResult.error(HttpStatus.SC_FORBIDDEN,"用户名密码错误");
        }
        //获取用户
        FrontUser tbFrontUser = list.get(0);

        //判断密码
        String oldPwd = tbFrontUser.getPassword();
        //对密码加密
        String newPwd = DigestUtils.md5DigestAsHex(frontUser.getPassword().getBytes());
        if(!oldPwd.equals(newPwd)){
            return HttpResult.error(HttpStatus.SC_FORBIDDEN,"用户名密码错误");
        }

        //生成token
        String token = UUID.randomUUID().toString();

        //添加redis数据为对象类型
        redisTemplate.opsForValue().set(token,tbFrontUser,1, TimeUnit.HOURS);

        //登录成功
        return HttpResult.ok(token);
    }

    /**
     * @Description: 根据token查询用户信息
     * @Author: hubin
     * @CreateDate: 2020/6/9 20:58
     * @UpdateUser: hubin
     * @UpdateDate: 2020/6/9 20:58
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
    @Override
    public FrontUser getUserInfoFromCache(String token) {
        FrontUser user = (FrontUser) redisTemplate.opsForValue().get(token);
        return user;
    }
}
