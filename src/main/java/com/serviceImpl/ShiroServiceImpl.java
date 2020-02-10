package com.serviceImpl;

import com.dao.PermissionMapper;
import com.dao.RoleMapper;
import com.dao.UserMapper;
import com.model.Permission;
import com.model.User;
import com.dao.UserRoleMapper;
import com.model.UserRole;
import com.service.ShiroService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class ShiroServiceImpl implements ShiroService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private UserMapper userMapper;

    public User getUserByUserName(String username) {
        //根据账号获取账号密码
        User user = userMapper.selectByUsername(username);
        return user;
    }

    public List<Permission> getPermissionsByUser(User user) {
        //获取到用户角色userRole

        List<UserRole> roleIds = userRoleMapper.selectByPrimaryUserid(user.getId());

        List<Permission> perArrary = new ArrayList<>();

        if (roleIds!=null&&roleIds.size()!=0) {
            //根据roleid获取peimission
            for (UserRole userRole : roleIds) {

                perArrary.add(permissionMapper.selectByPrimaryKey(userRole.getRoleid()) );

            }
        }

        System.out.println(perArrary);
        return perArrary;
    }

}
