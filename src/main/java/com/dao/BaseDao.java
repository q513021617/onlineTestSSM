package com.dao;

import java.util.List;

public interface BaseDao<T> {
    public abstract T selectByPrimaryKey(String id);
    public abstract int insertSelective(T t);
    public abstract int deleteByPrimaryKey(String id);
    public abstract int updateByPrimaryKeySelective(T t);

    List<T> selectByAllBypage();
}
