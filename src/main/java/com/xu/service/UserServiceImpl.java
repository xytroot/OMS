package com.xu.service;

import com.xu.dao.UserMapper;
import com.xu.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<User> getUserList() {
        return userMapper.getUserList();
    }

    @Override
    public User getUserById(int userId) {
        return userMapper.getUserById(userId);
    }

    @Override
    public User getUserByName(String userName) {
        return userMapper.getUserByName(userName);
    }

    @Override
    public List<User> getUserBySuffixName(String userName) {
        return userMapper.getUserBySuffixName(userName);
    }

    @Override
    public List<User> getUserByPwd(String password) {
        return userMapper.getUserByPwd(password);
    }


    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int deleteUser(int userId) {
        return userMapper.deleteUser(userId);
    }

    @Override
    public List<User> getUserByLimit(int startIdx, int pageSize) {
        return userMapper.getUserByLimit(startIdx, pageSize);
    }

    @Override
    public int updateBalance(User user) {
        return userMapper.updateBalance(user);
    }
}
