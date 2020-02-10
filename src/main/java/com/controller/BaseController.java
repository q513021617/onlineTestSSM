package com.controller;


import com.service.BaseService;
import com.model.MsgBean;
import com.util.WebUtilsPro;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@Controller
public abstract class BaseController<T> {


    private T t;
    private final static Logger logger= LoggerFactory.getLogger(BaseController.class);


    public MsgBean queryById(String id, BaseService baseService, Object object){


        logger.info("收到一个请求参数为{id:"+id+"}");
        baseService.setBaseDao(object);
//        Object object=;
//        if(object !=null){
//            return new com.model(true,"queryGoodsById 操作成功!",object);
//        }
        return baseService.selectById(id);
    }

    public MsgBean queryAllByPage(int page, int count ,BaseService baseService, Object object){

        baseService.setBaseDao(object);
        return baseService.selectAllByPage(page,count);
    }

    public  MsgBean instertById( T t,BaseService baseService , Object object){
        baseService.setBaseDao(object);
        return baseService.instert(t);
    }


    public  MsgBean updateByKey( T t,BaseService baseService , Object object){
        baseService.setBaseDao(object);
        return baseService.updateByPrimaryKeySelective(t);
    }


    public MsgBean deleteById(String id,BaseService baseService , Object object) {
        baseService.setBaseDao(object);
        return baseService.deleteByPrimaryKey(id);
    }

    @ExceptionHandler({ UnauthenticatedException.class, AuthenticationException.class })
    @ResponseBody
    public MsgBean authenticationException(HttpServletRequest request, HttpServletResponse response) {

        if (WebUtilsPro.isAjaxRequest(request)) {
            // 输出JSON


            return new MsgBean(false,"没有登录",431);
        }

        try {
            response.sendRedirect("/adminlogin/");
        }catch (Exception e){

            return new MsgBean(false,"没有登录",e.getMessage());
        }

        return new MsgBean(false,"没有登录",431);
    }


    @ExceptionHandler({ UnauthorizedException.class, AuthorizationException.class })
    @ResponseBody
    public MsgBean authorizationException(HttpServletRequest request, HttpServletResponse response) {
        if (WebUtilsPro.isAjaxRequest(request)) {
            // 输出JSON


            return new MsgBean(false,"没有权限",435);
        }
        try {
            response.sendRedirect("/permison/");
        }catch (Exception e){

            return new MsgBean(false,"没有权限",e.getMessage());
        }

        return new MsgBean(false,"没有权限",435);

    }

    /**
     * 输出JSON
     *
     * @param response
     * @author SHANHY
     * @create 2017年4月4日
     */



}
