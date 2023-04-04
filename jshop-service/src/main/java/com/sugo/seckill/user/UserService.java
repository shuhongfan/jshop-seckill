package com.sugo.seckill.user;



import com.sugo.seckill.http.HttpResult;
import com.sugo.seckill.pojo.FrontUser;

import java.util.List;

public interface UserService {

    /**
     * 查询用户信息
     */
    public List<FrontUser> getAllUser();

    /**
     * @Description: 登录
     * @Author: hubin
     * @CreateDate: 2020/6/9 17:07
     * @UpdateUser: hubin
     * @UpdateDate: 2020/6/9 17:07
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
    public HttpResult login(FrontUser frontUser);

    /**
     * @Description: 根据token查询用户信息
     * @Author: hubin
     * @CreateDate: 2020/6/9 20:57
     * @UpdateUser: hubin
     * @UpdateDate: 2020/6/9 20:57
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
    FrontUser getUserInfoFromCache(String token);
}
