package com.controller.Admin;

import com.UUID.UUIDgenarater;
import com.controller.BaseController;
import com.dao.UserMapper;
import com.service.UserService;
import com.model.MsgBean;
import com.model.User;
import com.util.FreemarkerUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.RequestContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Admin/User")
public class AdminUserConroller extends BaseController<User> {

    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;

    private final static Logger logger= LoggerFactory.getLogger(AdminUserConroller.class);



    public MsgBean page(HttpServletRequest request,int page,int count) {

        String reslut="";
        Map<String,Object> map=new HashMap<>();
        request.getContextPath();
        map.put("request",request);

        userService.setBaseDao(userMapper);
        MsgBean userList=userService.selectAllByPage(page,count);

        List<Map> tempList=(List<Map>) userList.getData();
        Map tempManp=tempList.get(0);

        List list=(List)tempManp.get("data");
        map.put("userlist",list);
        map.put("pagesize",list.size());
        try {
            reslut=FreemarkerUtils.getTemplate("admin/UserManager.ftl",map);
        }catch (Exception e){
            logger.error(e.toString());
        }
        Map mappage=new HashMap();
        mappage.put("page",reslut);
        mappage.put("pageindex",page);
        mappage.put("pagesize",tempManp.get("totalPage"));
        return new MsgBean(true,"返回页面成功！",mappage);
    }

    @RequestMapping(value = "/",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean index(HttpServletRequest request) {


        return page(request,1, 5);

    }



    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryById(@PathVariable("id")String id) {
        return super.queryById(id, userService,userMapper);
    }

    @RequestMapping(value = "/{page}/{count}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryAllByPage(HttpServletRequest request,@PathVariable("page") int page, @PathVariable("count") int count) {
        return page(request,page, count);
    }

    @RequestMapping(value = "/",method = RequestMethod.POST)
    @ResponseBody
    public MsgBean instertById(@RequestBody  User user) {
        user.setId(new UUIDgenarater().getUUID());
        return super.instertById(user, userService,userMapper);
    }

    @RequestMapping(value = "/",method = RequestMethod.PUT)
    @ResponseBody
    public MsgBean updateByKey(@RequestBody User user) {
        return super.updateByKey(user, userService,userMapper);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public MsgBean deleteById(@PathVariable("id") String id) {
        return super.deleteById(id, userService,userMapper);
    }
}
