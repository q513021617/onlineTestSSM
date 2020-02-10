package com.controller;

import com.UUID.UUIDgenarater;
import com.dao.TestingMapper;
import com.dao.TestpaperMapper;
import com.service.TestingService;
import com.model.MsgBean;
import com.model.Testing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/Mobile/Testing")
public class TestingConroller extends BaseController<Testing> {

    @Autowired
    private TestingService testingService;
    @Autowired
    private TestingMapper testingMapper;
    @Autowired
    private TestpaperMapper testpaperMapper;

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryById(@PathVariable("id")String id) {

        return super.queryById(id, testingService,testingMapper);
    }

    @RequestMapping(value = "/{page}/{count}",method = RequestMethod.GET)
    @ResponseBody
    public MsgBean queryAllByPage(@PathVariable("page") int page, @PathVariable("count") int count) {
        return super.queryAllByPage(page, count, testingService,testingMapper);
    }

    @RequestMapping(value = "/",method = RequestMethod.POST)
    @ResponseBody
    public MsgBean instertById(@ModelAttribute Testing testing) {
        testing.setId(new UUIDgenarater().getUUID());
        return super.instertById(testing, testingService,testingMapper);
    }

    @RequestMapping(value = "/",method = RequestMethod.PUT)
    @ResponseBody
    public MsgBean updateByKey(@ModelAttribute Testing testing) {
        return super.updateByKey(testing, testingService,testingMapper);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public MsgBean deleteById(@PathVariable("id") String id) {
        return super.deleteById(id, testingService,testingMapper);
    }
}
