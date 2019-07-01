package cn.duli.service.impl;


import cn.duli.mapper.RunMapper;
import cn.duli.pojo.Run;
import cn.duli.service.RunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class RunServiceImpl implements RunService {

    @Autowired
    private RunMapper runMapper;

    @Override
    public Run loginRun(Run run) {
        return runMapper.loginRun(run);
    }

    @Override
    public Run selectRunInfo(String username) {
        return runMapper.selectRunInfo(username);
    }

    @Override
    public void updateRunInfo(Run run) {
        runMapper.updateRunInfo(run);
    }

    @Override
    public Run selectByPwd(String username) {
        return runMapper.selectByPwd(username);
    }

    @Override
    public void updateRunPwd(Run run) {
        runMapper.updateRunPwd(run);
    }
}
