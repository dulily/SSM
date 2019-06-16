package cn.duli.service;

import cn.duli.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    /**
     * 根据user信息去检查数据库是否存在该用户
     */
    User login(User user);

    List<User> queryAll();

    List<User> queryLike(@Param("username") String username);

    int deleteById(Integer id);
}
