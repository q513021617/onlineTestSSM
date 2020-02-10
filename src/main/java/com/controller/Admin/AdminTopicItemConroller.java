package com.controller.Admin;

import com.UUID.UUIDgenarater;
import com.model.MsgBean;
import com.model.Page;
import com.model.TopicItem;
import com.service.TopicItemService;
import com.util.FreemarkerUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Admin/TopicItem")
public class AdminTopicItemConroller {

    @Autowired
    private TopicItemService topicItemService;

    private final static Logger logger= LoggerFactory.getLogger(AdminUserConroller.class);


    @RequestMapping(value = "/upload/",method = RequestMethod.POST)
    @ResponseBody
    public MsgBean uploadFile(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) {


        logger.info("fileName："+file.getOriginalFilename());
        String basepath="F:\\code\\java\\onlineTest\\src\\main\\webapp\\WEB-INF";
        String path=basepath+"\\static\\upload\\"+file.getOriginalFilename();

        File newFile=new File(path);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        try {
            file.transferTo(newFile);
        }catch (Exception e){
            logger.error(e.getMessage());
        }

        try {
        topicItemService.insertAllFromFile(path);
        }catch (Exception e){
            logger.error(e.getMessage());
        }
        return new MsgBean(true,"","");
    }
    public MsgBean page(HttpServletRequest request,int page,int count) {
        String reslut="";
        Map<String,Object> map=new HashMap<>();
        request.getContextPath();
        map.put("request",request);
        List<TopicItem> topicItemList=new ArrayList<TopicItem>();
        Page<TopicItem> page1=new Page<TopicItem>();
        int total=0;
        try {
            page1=topicItemService.quryAllByPage(page,count);
            topicItemList=(List<TopicItem>)page1.getRecords();

            total=page1.getSize();
        }catch (Exception e){
            logger.error(e.toString());
        }


        map.put("topicList",topicItemList);
        map.put("pagesize",total);
        try {
            reslut= FreemarkerUtils.getTemplate("admin/topicManager.ftl",map);
        }catch (Exception e){
            logger.error(e.toString());
        }
        Map mappage=new HashMap();
        mappage.put("page",reslut);
        mappage.put("pageindex",page);
        mappage.put("totaldata",total);
        return new MsgBean(true,"返回页面成功！",mappage);
    }

    @RequestMapping(value = "/",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean index(HttpServletRequest request) {


        return page(request,1,5);

    }


    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryById(@PathVariable("id")String id) {

        TopicItem topicItem;
        try {
            topicItem=topicItemService.quryById(id);

        }catch (Exception e){

            return new MsgBean(true,"查询失败",e.getMessage());
        }


        return new MsgBean(true,"查询成功",topicItem);
    }

    @RequestMapping(value = "/{page}/{count}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryAllByPage(HttpServletRequest request,@PathVariable("page") int page, @PathVariable("count") int count) {

        return page(request,page,count);

    }

    @RequestMapping(value = "/",method = RequestMethod.POST)
    @ResponseBody
    public MsgBean instert(@RequestBody TopicItem topicItem) {
        topicItem.setId(new UUIDgenarater().getUUID());
        try {
            topicItemService.insert(topicItem);
        }catch (Exception e){
            return new MsgBean(true,"插入失败",e.getMessage());
        }

        return new MsgBean(true,"插入成功",true);
    }

    @RequestMapping(value = "/",method = RequestMethod.PUT)
    @ResponseBody
    public MsgBean updateByKey(@RequestBody TopicItem topicItem) {



        try {
            topicItemService.update(topicItem);
        }catch (Exception e){
            return new MsgBean(true,"更新失败",e.getMessage());
        }

        return new MsgBean(true,"更新成功",true);

    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public MsgBean deleteById(@PathVariable("id") String id) {


        try {
            topicItemService.delete(new TopicItem(id,"","","","","","","","",""));
        }catch (Exception e){
            return new MsgBean(false,"删除失败",e.getMessage());
        }
        return new MsgBean(true,"删除成功",true);

    }
}
