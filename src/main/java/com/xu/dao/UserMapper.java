package com.xu.dao;

import com.xu.pojo.User;

import java.util.List;

public interface UserMapper {
    //查询全部用户
    List<User> getUserList();

    //根据ID查询用户
    User getUserById(int userId);

    //根据userName查询用户
    User getUserByName(String userName);

    //根据userName查询用户(模糊查询)
    List<User> getUserBySuffixName(String userName);

    List<User> getUserByPwd(String password);

    //插入用户
    int addUser(User user);

    //修改用户
    int updateUser(User user);

    int updateBalance(User user);

    //删除用户
    int deleteUser(int userId);

    //分页查询
    List<User> getUserByLimit(int startIdx, int pageSize);
}
