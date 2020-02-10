package com.controller;

import com.UUID.UUIDgenarater;
import com.controller.Admin.AdminUserConroller;
import com.dao.UserMapper;
import com.service.UserService;
import com.model.MsgBean;
import com.model.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Mobile/User")
public class UserConroller extends BaseController<User> {

    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;

    private final static Logger logger= LoggerFactory.getLogger(AdminUserConroller.class);

    @RequestMapping(value = "/login/",method = RequestMethod.POST)
    @ResponseBody
    public MsgBean Login(@ModelAttribute User user, HttpSession session, Model model){

        if(user.getUname()==null){

            return new MsgBean(false,"账号不为空 ",false);
        }
        //主体,当前状态为没有认证的状态“未认证”
        Subject subject = SecurityUtils.getSubject();
        // 登录后存放进shiro token
        User tempuser;
        //登录方法（认证是否通过）
        //使用subject调用securityManager,安全管理器调用Realm
        try {
            //利用异常操作
            //需要开始调用到Realm中
            UsernamePasswordToken token=new UsernamePasswordToken(user.getUname(),user.getPwd());
            logger.info("========================================");
            logger.info("1、进入认证方法");
            subject.login(token);
            tempuser = (User)subject.getPrincipal();
            session.setAttribute("user",subject);
            logger.info("登录完成");
            return new MsgBean(true,"登录完成 ",true);


        } catch (AuthenticationException e) {

            return new MsgBean(false,"账号密码不正确 ",false);
        }

    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryById(@PathVariable("id")String id) {
        return super.queryById(id, userService,userMapper);
    }

    @RequestMapping(value = "/{page}/{count}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryAllByPage(@PathVariable("page") int page, @PathVariable("count") int count) {
        return super.queryAllByPage(page, count, userService,userMapper);
    }

    @RequestMapping(value = "/",method = RequestMethod.POST)
    @ResponseBody
    public MsgBean instertById(@ModelAttribute User user) {
        user.setId(new UUIDgenarater().getUUID());
        return super.instertById(user, userService,userMapper);
    }

    @RequestMapping(value = "/",method = RequestMethod.PUT)
    @ResponseBody
    public MsgBean updateByKey(@ModelAttribute User user) {
        return super.updateByKey(user, userService,userMapper);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public MsgBean deleteById(@PathVariable("id") String id) {
        return super.deleteById(id, userService,userMapper);
    }
}
