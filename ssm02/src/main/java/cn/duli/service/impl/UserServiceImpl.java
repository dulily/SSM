package cn.duli.service.impl;

import cn.duli.mapper.UserMapper;
import cn.duli.pojo.User;
import cn.duli.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    //注入mapper
    @Autowired
    private UserMapper userMapper;


    @Override
    public List<User> queryAll() {
        return userMapper.queryAll();
    }

    @Override
    public List<User> queryLike(String username) {
        return userMapper.queryLike(username);
    }

    @Override
    public void deleteById(Integer id) {
        userMapper.deleteById(id);
    }




    @Override
    public boolean selectUserByUsername(String username) {
        User user = userMapper.selectUserByUsername(username);
        return user == null?false:true;
    }

    @Override
    public void insertOne(User user) {
        userMapper.insertOne(user);
    }

    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    @Override
    public User selectByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public void updateLastLoginTime(User user) {
        userMapper.updateLastLoginTime(user);
    }

    @Override
    public User selectByPwd(String username) {
        return userMapper.selectByPwd(username);
    }

    @Override
    public void updatePwd(User user) {
        userMapper.updatePwd(user);
    }
}
