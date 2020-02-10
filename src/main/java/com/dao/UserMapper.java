package com.dao;

import com.model.User;

public interface UserMapper extends BaseDao<User>{

    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    User selectByUsername(String name);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}