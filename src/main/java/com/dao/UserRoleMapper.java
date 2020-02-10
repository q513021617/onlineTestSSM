package com.dao;

import com.model.UserRole;

import java.util.List;

public interface UserRoleMapper extends BaseDao<UserRole>{

    int deleteByPrimaryKey(String id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(String id);

    List<UserRole> selectByPrimaryUserid(String userid);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}