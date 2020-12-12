package com.xu.service;

import com.xu.pojo.User;

import java.util.List;

public interface UserService {
    //查询全部用户
    List<User> getUserList();

    //根据ID查询用户
    User getUserById(int userId);

    //根据userName查询用户
    User getUserByName(String userName);

    List<User> getUserBySuffixName(String userName);

    List<User> getUserByPwd(String password);

    //插入用户
    int addUser(User user);

    //修改用户
    int updateUser(User user);

    //删除用户
    int deleteUser(int userId);

    //分页查询
    List<User> getUserByLimit(int startIdx, int pageSize);

    int updateBalance(User user);
}
