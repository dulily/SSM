package cn.duli.controller;


import cn.duli.pojo.Run;
import cn.duli.pojo.User;
import cn.duli.service.RunService;
import cn.duli.service.UploadService;
import cn.duli.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UploadService uploadService;

    @Autowired
    private RunService runService;


    //查询用户所有信息
    @RequestMapping("/queryAll")
    public String queryAll(Model model){
        List<User> users = userService.queryAll();
        model.addAttribute("userList",users);
        return "/user/userList";
    }

    //按用户名模糊查询
    @RequestMapping("/queryLike/username")
    public String queryLike(Model model, @RequestParam("username") String username){
        model.addAttribute("username",username);
        List<User> users = userService.queryLike(username);
        model.addAttribute("userList",users);
        return "/user/userList";
    }

    //根据用户id删除用户
    @RequestMapping("/deleteById")
    public String deleteById(@RequestParam("id") Integer id){
        userService.deleteById(id);
        System.out.println("正在删除用户");
        return "redirect:/user/queryAll";
    }

    /**
     * 前台部分
     */

    //根据用户名判断用户名是否存在
    @RequestMapping("/registUsername")
    @ResponseBody
    public boolean registUsername(String username){
        boolean result = userService.selectUserByUsername(username);
        return result;
    }

    //注册用户
    @RequestMapping("/insertOne")
    public String insertOne(Model model, User user){
        user.setRegistTime(new Date());
        user.setLastLoginTime(new Date());
        userService.insertOne(user);
        System.out.println("正在注册中.....");
        model.addAttribute("signUser","注册成功");
        return "/register";
    }

    /**
     * 用户/管理员登录
     * @param model
     * @param user
     * @param run
     * @param request
     * @param option
     * @return
     */
    @RequestMapping("/login")
    public String login(Model model, User user, Run run, HttpServletRequest request, String option){
        System.out.println(option);
        //选中option1表示进入用户登录
        if (option.equals("option1")){
            System.out.println("普通用户登录");
            HttpSession httpSession = request.getSession();
            User user1 = userService.selectByUsername(user.getUsername());
            httpSession.setAttribute("userSession1",user1);
            User userLogin = userService.login(user);
            if (userLogin!=null){
                httpSession.setAttribute("userSession",userLogin);
                Date date = new Date();
                userLogin.setLastLoginTime(date);
                //更改用户上次登录时间
                userService.updateLastLoginTime(userLogin);
                model.addAttribute("userLogin",userLogin);
                System.out.println(userLogin);
                return "redirect:/";
            }else{
                model.addAttribute("msg","用户名或密码错误");
                model.addAttribute("user",user);
                return "/register";
            }
        }else{
            //选中option2表示进入管理员登录
            System.out.println("管理员登录");
            HttpSession httpSession = request.getSession();
            Run runLogin = runService.loginRun(run);
            if (runLogin!=null){
                httpSession.setAttribute("runSession",runLogin);
                model.addAttribute("run",runLogin);
                return "/index";
            }else{
                model.addAttribute("msg","用户名或密码错误");
                model.addAttribute("user",run);
                return "/register";
            }
        }
    }


    //用户退了
    @RequestMapping("/logOut")
    public String logOut(HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        httpSession.removeAttribute("userSession");
        return "redirect:/";
    }

    //根据用户名回显用户信息
    @RequestMapping("/selectByUsername")
    public String selectByUsername(@RequestParam("username") String username, Model model){
        User user = userService.selectByUsername(username);
        model.addAttribute("user",user);
        return "/front/userSetting";
    }

    //更改用户信息
    @RequestMapping("/updateUser")
    public String updateUser(@RequestParam("img") MultipartFile multipartFile, HttpServletRequest request, User user, Model model){
        if (multipartFile.getOriginalFilename()!= ""){
            String newFileName = uploadService.upload(multipartFile,request);
            //修改news的pictureUrl属性内容
            user.setPicture(newFileName);
            System.out.println(newFileName);
        }
        HttpSession httpSession = request.getSession();
        userService.updateUser(user);
        httpSession.removeAttribute("userSession");
        User user1 = userService.selectByUsername(user.getUsername());
        System.out.println("======"+user1);
        httpSession.setAttribute("userSession",user1);
        System.out.println("正在更改用户信息....");
        System.out.println(user);
        model.addAttribute("user",user);
        return "/front/userSetting";
    }

    //用户修改密码时根据用户名查询原密码
    @RequestMapping("/selectByPwd")
    @ResponseBody
    public String selectByPwd(String username){
       User user = userService.selectByPwd(username);
        System.out.println("=========="+username+","+user);
        return user.getPassword();
    }

    //修改用户密码
    @RequestMapping("/updatePwd")
    public String updatePwd(User user, Model model, String newPwd){
        User user1 = userService.selectByUsername(user.getUsername());
        user1.setPassword(newPwd);
        System.out.println("=============="+newPwd);
        userService.updatePwd(user1);
        System.out.println("正在修改用户密码....");
        model.addAttribute("msg","恭喜您，密码设置成功！");
        return "/front/rePassword";
    }

}
