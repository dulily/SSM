package cn.duli.mapper;

import cn.duli.pojo.User;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    /**
     * 后台部分
     */

    //查询所有用户
    List<User> queryAll();

    //按用户名模糊查询
    List<User> queryLike(@Param("username") String username);

    //根据用户id删除用户
    void deleteById(@Param("id") Integer id);


    /**
     * 前台部分
     */
    //注册前，根据用户名判断用户名是否存在
    User selectUserByUsername(String username);

    //注册用户
    void insertOne(User user);

    //登录用户
    User login(User user);

    //根据用户名回显用户信息
    User selectByUsername(@Param("username") String username);

    //更改用户信息
    void updateUser(User user);

    //更改用户上次登录时间
    void updateLastLoginTime(User user);

    //用户修改密码时根据用户名查询原密码
    User selectByPwd(@Param("username") String username);

    //修改用户密码
    void updatePwd(User user);

}