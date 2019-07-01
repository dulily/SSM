package cn.duli.service;

import cn.duli.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface UserService {

    /**
     * 查询用户信息
     * @return
     */
    List<User> queryAll();

    /**
     * 根据用户名模糊查询
     * @param username
     * @return
     */
    List<User> queryLike(@Param("username") String username);

    /**
     * 删除用户
     * @param id
     * @return
     */
    void deleteById(Integer id);





    /**
     * 注册中验证用户是否存在
     * @param username
     * @return存在返回true,不存在返回false
     */
    boolean selectUserByUsername(String username);

    /**
     * 注册用户
     */
    void insertOne(User user);

    /**
     * 根据user信息去检查数据库是否存在该用户
     */
    User login(User user);

    /**
     * 根据用户Id回显用户信息
     */
    User selectByUsername(String username);

    /**
     * 更改用户信息
     */
    void updateUser(User user);

    /**
     * 更改用户上次登录时间
     */
    void updateLastLoginTime(User user);

    /**
     * 判断密码是否正确
     * @param username
     * @return
     */
    User selectByPwd(String username);

    /**
     * 修改密码
     */
    void updatePwd(User user);

}
