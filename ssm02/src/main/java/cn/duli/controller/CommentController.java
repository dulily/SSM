package cn.duli.controller;

import cn.duli.pojo.Comment;
import cn.duli.pojo.News;
import cn.duli.pojo.User;
import cn.duli.service.CommentService;
import cn.duli.service.NewsService;
import cn.duli.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private UserService userService;

    /**
     * 前台
     * 用户评论管理
     */

    //新增评论
    @RequestMapping("/insertComment")
    public String insertComment(Comment comment, Model model){
        comment.setCreatetime(new Date());
        commentService.insertComment(comment);
        System.out.println("正在添加评论......");
        //根据新闻id回显新闻内容
        News news = newsService.selectById(comment.getNewsid());
        model.addAttribute("info",news);
        return "/front/newsDetail";

    }

    //根据新闻id查看当前新闻下的评论
    @RequestMapping("/selectCommentByNewsId")
    @ResponseBody
    public List<Comment> selectCommentByNewsId(@RequestParam("newsid")Integer newsid){
        List<Comment> list = commentService.selectCommentByNewsId(newsid);
        System.out.println("正在查询当前新闻下的评论....");
        return list;
    }

    //根据用户id查询当前用户下的评论
    @RequestMapping("/selectCommentByUserId")
    @ResponseBody
    public List<Comment> selectCommentByUserId(@Param("userid")Integer userid){
        List<Comment> list2 = commentService.selectCommentByUserId(userid);
        System.out.println("正在查询当前用户下的评论......");
        return list2;
    }

    //用户根据评论id删除评论
    @RequestMapping("/deleteByCommentId")
    public String deleteByCommentId(@RequestParam("id") Integer id, String username, Model model){
        commentService.deleteByCommentId(id);
        System.out.println("用户正在删除新闻评论.....");
        //回显用户个人信息
        User user = userService.selectByUsername(username);
        model.addAttribute("user",user);
        return "/front/userSetting";
    }



    /**
     * 后台
     * 管理员评论管理
     */

    //管理员查看所有评论
    @RequestMapping("/selectComments")
    public String selectComments(@RequestParam(required = false, defaultValue = "1") Integer startPage, Model model){
        //分页查询
        PageHelper.startPage(startPage,4);
        List<Comment> comments = commentService.selectComments();
        model.addAttribute("comments",comments);
        PageInfo<Comment> pi = new PageInfo<Comment>(comments);
        model.addAttribute("page",pi);
        return "/comment/commentList";
    }

    //管理员删除评论
    @RequestMapping("/deleteComment")
    public String deleteComment(@RequestParam("id") Integer id){
        commentService.deleteByCommentId(id);
        System.out.println("管理员正在删除新闻评论.....");
        return "redirect:/comment/selectComments";
    }

}
