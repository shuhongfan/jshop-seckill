package com.sugo.seckill.web.login;

import com.sugo.seckill.http.HttpResult;
import com.sugo.seckill.pojo.FrontUser;
import com.sugo.seckill.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @ClassName LoginController
 * @Description
 * @Author hubin
 * @Date 2020/6/9 16:59
 * @Version V1.0
 **/
@RestController
@RequestMapping("/login")
public class LoginController {

    //注入服务
    @Autowired
    private UserService userService;

    /**
     * @Description: 秒杀系统登录
     * @Author: hubin
     * @CreateDate: 2020/6/9 17:02
     * @UpdateUser: hubin
     * @UpdateDate: 2020/6/9 17:02
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public HttpResult login(@RequestBody FrontUser frontUser){

        HttpResult result = userService.login(frontUser);

        return result;
    }

    /**
     * @Description: 根据token获取用户信息
     * @Author: hubin
     * @CreateDate: 2020/6/9 20:41
     * @UpdateUser: hubin
     * @UpdateDate: 2020/6/9 20:41
     * @UpdateRemark: 修改内容
     * @Version: 1.0
     */
    @RequestMapping("/getLoginUser/{token}")
    public HttpResult getUserInfo(@PathVariable String token){
        //根据token查询用户信息
        FrontUser frontUser = userService.getUserInfoFromCache(token);
        return HttpResult.ok(frontUser);
    }

}

