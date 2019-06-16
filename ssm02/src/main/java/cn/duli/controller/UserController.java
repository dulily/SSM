package cn.duli.controller;

import cn.duli.pojo.User;
import cn.duli.service.NewsService;
import cn.duli.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping("/login")
    public String login(Model model) {
//        User user = userService.login(user);
        return null;
    }

//    查询用户所有信息
    @RequestMapping("/queryAll")
    public String queryAll(Model model){
        List<User> users = userService.queryAll();
        model.addAttribute("userList",users);
        return "userList";
    }

    //按用户名模糊查询
    @RequestMapping("/queryLike/username")
    public String queryLike(Model model, @RequestParam("username") String username){
        model.addAttribute("username",username);
        List<User> users = userService.queryLike(username);
        model.addAttribute("userList",users);
        return "userList";
    }

    //删除用户按id
    @RequestMapping("/deleteById")
    public String deleteById(Model model,Integer id){
        model.addAttribute("user",userService.deleteById(id));
        System.out.println(id);
        return "redirect:/user/queryAll";
    }
}
