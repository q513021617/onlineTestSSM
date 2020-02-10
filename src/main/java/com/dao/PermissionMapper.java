package com.dao;

import com.model.Permission;

public interface PermissionMapper extends BaseDao<Permission>{
    int deleteByPrimaryKey(String id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(String id);

    Permission selectByRoleId(String id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);
}