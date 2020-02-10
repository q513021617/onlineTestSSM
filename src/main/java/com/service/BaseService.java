package com.service;

import com.model.MsgBean;

public interface BaseService<T> {

    public MsgBean selectById(String id);

    /**
     * 通过分页查询所有记录
     * @param page 当前页
     * @param count 记录条数
     * @return 返回值是MsgBean
     */
    MsgBean selectAllByPage(int page,int count);

    public MsgBean instert(T t);

    public  void setBaseDao(Object object);

    MsgBean deleteByPrimaryKey(String id);

    MsgBean updateByPrimaryKeySelective(T t);
}
