package com.sugo.seckill.web.user;

import com.sugo.seckill.pojo.FrontUser;
import com.sugo.seckill.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by on 2020/5/25.
 */
@RestController
public class UserController {

    //注入service服务
    @Autowired
    private UserService userService;


    @RequestMapping("/user")
    public List<FrontUser> showUser(){
        //查询list集合
        List<FrontUser> uList = userService.getAllUser();
        return uList;
    }



}
