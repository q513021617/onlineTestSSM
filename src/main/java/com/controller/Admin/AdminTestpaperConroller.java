package com.controller.Admin;

import com.UUID.UUIDgenarater;
import com.controller.BaseController;
import com.dao.TestpaperMapper;
import com.service.TestpaperService;
import com.model.MsgBean;
import com.model.Testpaper;
import com.util.FreemarkerUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Admin/Testpaper")
public class AdminTestpaperConroller extends BaseController<Testpaper> {

    @Autowired
    private TestpaperService testpaperService;
    @Autowired
    private TestpaperMapper testpaperMapper;
    private final static Logger logger= LoggerFactory.getLogger(AdminUserConroller.class);


    public MsgBean page(HttpServletRequest request,int page,int count) {

        String reslut="";
        Map<String,Object> map=new HashMap<>();
        request.getContextPath();
        map.put("request",request);

        testpaperService.setBaseDao(testpaperMapper);
        MsgBean paperList=testpaperService.selectAllByPage(page,count);

        List<Map> tempList=(List<Map>) paperList.getData();
        Map tempManp=tempList.get(0);
        List list=(List)tempManp.get("data");
        map.put("paperlist",list);

        try {
            reslut= FreemarkerUtils.getTemplate("admin/paperManager.ftl",map);
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


        return page(request,1,5);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryById(@PathVariable("id")String id) {
        return super.queryById(id, testpaperService,testpaperMapper);
    }

    @RequestMapping(value = "/{page}/{count}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryAllByPage(HttpServletRequest request,@PathVariable("page") int page, @PathVariable("count") int count) {
        return page(request,page,count);
    }

    @RequestMapping(value = "/",method = RequestMethod.POST)
    @ResponseBody
    public MsgBean instertById(@RequestBody Testpaper testpaper) {
        testpaper.setId(new UUIDgenarater().getUUID());
        return super.instertById(testpaper, testpaperService,testpaperMapper);
    }

    @RequestMapping(value = "/",method = RequestMethod.PUT)
    @ResponseBody
    public MsgBean updateByKey(@RequestBody Testpaper testpaper) {
        return super.updateByKey(testpaper, testpaperService,testpaperMapper);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public MsgBean deleteById(@PathVariable("id") String id) {


        return super.deleteById(id, testpaperService,testpaperMapper);
    }

}
