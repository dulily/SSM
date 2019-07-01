package cn.duli.mapper;

import cn.duli.pojo.Run;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RunMapper {

    //登录管理员
    Run loginRun(Run run);

    //根据用户名查看(回显)管理员个人信息
    Run selectRunInfo(@Param("username")String username);

    //管理员修改个人信息
    void updateRunInfo(Run run);

    //判断密码是否正确
    Run selectByPwd(@Param("username") String username);

    //管理员修改个人密码
    void updateRunPwd(Run run);
}
