package com.serviceImpl;

import com.dao.BaseDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.BaseService;
import com.model.MsgBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class BaseServiceImpl<T> implements BaseService {


    private BaseDao<Object> baseDao;

    @Override
    public  void setBaseDao(Object object){
        this.baseDao=(BaseDao) object;
    }


    @Override
    public MsgBean selectById(String id) {


        if(id == null ){

            return new MsgBean(false,"数据为空无法查询",false);
        }

        Object object=baseDao.selectByPrimaryKey(id);

        return new MsgBean(true,"查询数据成功",object);


    }

    @Override
    public MsgBean selectAllByPage(int page, int count) {

        if(page == 0 || count==0 ){

            return new MsgBean(false,"数据为空无法查询 page ="+page+" count="+count,false);
        }

        PageHelper.startPage(page,count);
        List<Object> objectList= baseDao.selectByAllBypage();
        PageInfo<Object> pageInfo = new  PageInfo<Object>(objectList);
        List<Map> mapList=new ArrayList<Map>();
        Map map=new HashMap();
        map.put("page",pageInfo.getPageNum());
        map.put("totalPage",pageInfo.getPages());
        map.put("data",objectList);
        mapList.add(map);


        return new MsgBean(true,"查询数据成功",mapList);

    }

    @Override
    public MsgBean instert(Object object) {

        if(object == null ){

            return new MsgBean(false,"数据为空无法创建",false);
        }

        if(baseDao.insertSelective(object)>0){
            return new MsgBean(true,"插入数据成功",true);
        }else {
            return new MsgBean(true,"插入数据失败",false);
        }

    }


    @Override
    public MsgBean deleteByPrimaryKey(String id) {

        if(id == null ){

            return new MsgBean(false,"数据为空无法删除",false);
        }

        if(baseDao.deleteByPrimaryKey(id)>0){
            return new MsgBean(true,"删除数据成功",true);
        }else {
            return new MsgBean(true,"删除数据失败",false);
        }

    }


    @Override
    public MsgBean updateByPrimaryKeySelective(Object object) {

        if(object == null ){

            return new MsgBean(false,"数据为空无法更新",false);
        }

        if(baseDao.updateByPrimaryKeySelective(object)>0){
            return new MsgBean(true,"更新数据成功",true);
        }else {
            return new MsgBean(true,"更新数据失败",false);
        }
    }
}
