package cn.duli.mapper;

import cn.duli.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

//    int deleteByPrimaryKey(Integer id);
//    int insert(User record);
//
//    int insertSelective(User record);
//
//    User selectByPrimaryKey(Integer id);
//
//    int updateByPrimaryKeySelective(User record);
//
//    int updateByPrimaryKey(User record);


    User login(User user);

    List<User> queryAll();


    List<User> queryLike(@Param("username") String username);

    int deleteById(Integer id);
}