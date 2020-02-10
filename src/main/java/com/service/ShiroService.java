package com.service;

import com.model.Permission;
import com.model.User;

import java.util.List;

public interface ShiroService {

    public User getUserByUserName(String username);
    public List<Permission> getPermissionsByUser(User user);

}
