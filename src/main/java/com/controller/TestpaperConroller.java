package com.controller;

import com.UUID.UUIDgenarater;
import com.dao.TestpaperMapper;
import com.service.TestpaperService;
import com.model.MsgBean;
import com.model.Testpaper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/Mobile/Testpaper")
public class TestpaperConroller extends BaseController<Testpaper> {

    @Autowired
    private TestpaperService testpaperService;
    @Autowired
    private TestpaperMapper testpaperMapper;




    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryById(@PathVariable("id")String id) {
        return super.queryById(id, testpaperService,testpaperMapper);
    }

    @RequestMapping(value = "/{page}/{count}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryAllByPage(@PathVariable("page") int page, @PathVariable("count") int count) {
        return super.queryAllByPage(page, count, testpaperService,testpaperMapper);
    }

    @RequestMapping(value = "/",method = RequestMethod.POST)
    @ResponseBody
    public MsgBean instertById(@ModelAttribute Testpaper testpaper) {
        testpaper.setId(new UUIDgenarater().getUUID());
        return super.instertById(testpaper, testpaperService,testpaperMapper);
    }

    @RequestMapping(value = "/",method = RequestMethod.PUT)
    @ResponseBody
    public MsgBean updateByKey(@ModelAttribute Testpaper testpaper) {
        return super.updateByKey(testpaper, testpaperService,testpaperMapper);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public MsgBean deleteById(@PathVariable("id") String id) {
        return super.deleteById(id, testpaperService,testpaperMapper);
    }
}
