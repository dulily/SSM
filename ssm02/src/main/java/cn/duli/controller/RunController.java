package cn.duli.controller;


import cn.duli.pojo.Run;
import cn.duli.service.RunService;
import cn.duli.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/run")
public class RunController {

    @Autowired
    private RunService runService;
    @Autowired
    private UploadService uploadService;


    //管理员退出登录状态
    @RequestMapping("/logOut")
    public String loginOut(HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        httpSession.removeAttribute("runSession");
        return "redirect:/";
    }

    //根据用户名查看(回显)管理员个人信息
    @RequestMapping("/selectRunInfo")
    public String selectRunInfo(@RequestParam("username")String username, HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        Run run = runService.selectRunInfo(username);
        httpSession.setAttribute("runSession",run);
        return "/run/runInfo";
    }

    //管理员修改个人信息
    @RequestMapping("/updateRunInfo")
    public String updateRunInfo(@RequestParam("img") MultipartFile multipartFile, HttpServletRequest request, Run run){
        if (multipartFile.getOriginalFilename()!= ""){
            String newFileName = uploadService.upload(multipartFile,request);
            //修改news的pictureUrl属性内容
            run.setPicture(newFileName);
            System.out.println(newFileName);
        }
        HttpSession httpSession = request.getSession();
        runService.updateRunInfo(run);
        httpSession.removeAttribute("runSession");
        Run run1 = runService.selectRunInfo(run.getUsername());
        System.out.println("======"+run1);
        httpSession.setAttribute("runSession",run1);
        System.out.println("正在更改管理员信息....");
        return "/run/runInfo";
    }

    //判断密码是否正确
    @RequestMapping("/selectByPwd")
    @ResponseBody
    public String selectByPwd(String username){
        Run run = runService.selectByPwd(username);
        System.out.println("=========="+username+","+run);
        return run.getPassword();
    }

    //管理员修改个人密码
    @RequestMapping("/updateRunPwd")
    public String updateRunPwd(Run run, Model model, String newPwd) {
        Run run1 = runService.selectRunInfo(run.getUsername());
        run1.setPassword(newPwd);
        System.out.println("==============" + newPwd);
        runService.updateRunPwd(run1);
        System.out.println("正在修改管理员密码....");
        model.addAttribute("msg", "恭喜您，密码设置成功！");
        return "/run/rePassword";
    }
}
