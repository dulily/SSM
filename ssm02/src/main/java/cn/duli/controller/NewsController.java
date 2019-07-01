package cn.duli.controller;

import cn.duli.pojo.Category;
import cn.duli.pojo.News;
import cn.duli.service.CategoryService;
import cn.duli.service.NewsService;
import cn.duli.service.UploadService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {


    @Autowired
    private NewsService newsService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private UploadService uploadService;

    /**
     * 后台部分
     */

    //分页显示所有新闻列表
    @RequestMapping("/queryAll")
    public String queryAll(@RequestParam(required = false, defaultValue = "1") Integer startPage, Model model){
        //分页查询
        PageHelper.startPage(startPage,4);
        List<News> news = newsService.queryAll();
        model.addAttribute("news",news);
        PageInfo<News> pi = new PageInfo<News>(news);
        model.addAttribute("page",pi);
        return "/news/newsList";
    }

    //根据新闻id删除新闻
    @RequestMapping("/deleteOne")
    public String deleteOne(@RequestParam("id") Integer id){
        newsService.deleteOne(id);
        System.out.println("正在删除一条新闻....");
        return "redirect:/news/queryAll";
    }

    //按新闻标题模糊查询
    @RequestMapping("/queryLikeByTitle/title")
    public String queryLikeByTitle(@RequestParam(required = false, defaultValue = "1") Integer startPage, Model model,@RequestParam("title") String title){
        //分页查询
        PageHelper.startPage(startPage,4);
        model.addAttribute("title",title);
        List<News> list = newsService.queryLikeByTitle(title);
        model.addAttribute("news",list);
        PageInfo<News> pi = new PageInfo<News>(list);
        model.addAttribute("page",pi);
        return "/news/newsList";

    }

    //发布新闻时，类别回显
    @RequestMapping("/category")
    public String queryCategory(Model model){
        System.out.println("正在查询类别....");
        //发布新闻时，使用categoryService里面的queryAll方法，让类别数据回显
        List<Category> categories = categoryService.queryAll();
        model.addAttribute("category",categories);
        return "/news/addNew";
    }


    //发布新闻
    @RequestMapping("/insertOne")
    public String insertOne(@RequestParam("img") MultipartFile multipartFile, HttpServletRequest request, News news) {

        String newFileName = uploadService.upload(multipartFile,request);
        //修改news的pictureUrl属性内容
        news.setPictureUrl(newFileName);
        System.out.println(newFileName);
        Date date = new Date();
        news.setCreatetime(date);
        System.out.println(news);
        newsService.insertOne(news);
        System.out.println("正在发布新闻...");
        return "redirect:/news/queryAll";
    }

    //更改新闻时，根据新闻id回显新闻内容
    @RequestMapping("/selectById")
    public String selectById(Model model,@RequestParam Integer id){
        News news = newsService.selectById(id);
        System.out.println(news);
        model.addAttribute("info",news);
        return "/news/updateNews";
    }

    //更改新闻时，获取新闻类别，让数据回显
    @RequestMapping("/updateCategory")
    @ResponseBody
    public List<Category> updateCategory(){
        System.out.println("正在查询所有类别....");
        List<Category> categories = categoryService.queryAll();
        return categories;
    }

    //更新新闻信息
    @RequestMapping("/updateOne")
    public String updateOne(@RequestParam("img") MultipartFile multipartFile, HttpServletRequest request, News news){
        if (multipartFile.getOriginalFilename()!= ""){
            String newFileName = uploadService.upload(multipartFile,request);
            //修改news的pictureUrl属性内容
            news.setPictureUrl(newFileName);
            System.out.println(newFileName);
        }
        Date date = new Date();
        news.setCreatetime(date);
        newsService.updateOne(news);
        System.out.println("正在更改中....");
        System.out.println(news);
        return "redirect:/news/queryAll";
    }

    //批量删除新闻
    @RequestMapping(value="/batchDelete", produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String batchDelete(String name){
        System.out.println(name);
        List<Integer> list = new ArrayList<>();
        for (int i=0;i<name.split(",").length;i++){
            list.add(Integer.parseInt(name.split(",")[i]));
        }
        newsService.batchDelete(list);
        return "删除成功";
    }

    /**
     * 前台部分
     */

    //查询最新发布的前7条新闻
    @RequestMapping("/queryLimit")
    @ResponseBody
    public List<News> queryLimit(){
        List<News> list = newsService.queryLimit();
        System.out.println("正在查询最新发布新闻...");
        return list;
    }

    //查询前7条国际新闻
    @RequestMapping("/queryCategoryName")
    @ResponseBody
    public List<News> queryCategoryName(){
        List<News> list = newsService.queryCategoryName();
        System.out.println("正在查询类别为国际的新闻...");
        return list;
    }

    //查询前7条娱乐新闻
    @RequestMapping("/queryYule")
    @ResponseBody
    public List<News> queryClickNum(){
        List<News> list = newsService.queryYule();
        System.out.println("正在查询查询前7条娱乐新闻...");
        return list;
    }

    //查询前4条国内新闻
    @RequestMapping("/queryOwnNews")
    @ResponseBody
    public List<News> queryOwnNews(){
        List<News> list = newsService.queryOwnNews();
        System.out.println("正在查询国内新闻前4的新闻...");
        return list;
    }

    //根据新闻id回显新闻详情
    @RequestMapping("/NewsInfo")
    public String NewsInfo(Model model,@RequestParam Integer id){
        News news = newsService.selectById(id);
        System.out.println("正在查询新闻详情");
        model.addAttribute("info",news);
        return "/front/newsDetail";
    }

    //查询前5条军事新闻
    @RequestMapping("/queryMilitary")
    @ResponseBody
    public List<News> queryMilitary(){
        List<News> list = newsService.queryMilitary();
        System.out.println("正在查询军事新闻前5条记录....");
        return list;
    }

    /**
     * 导航部分
     */
    //根据类别id查询此类别下的新闻
    @RequestMapping("/queryCategoryById")
    public String queryCategoryById(@RequestParam(required = false, defaultValue = "1") Integer startPage, Model model,@RequestParam Integer categoryid){
        //分页查询
        PageHelper.startPage(startPage,4);
        List<News> news = newsService.queryCategoryById(categoryid);
        System.out.println(categoryid);
        System.out.println("正在查询新闻类别详情");
        model.addAttribute("info",news);
        PageInfo<News> pi = new PageInfo<News>(news);
        model.addAttribute("page",pi);
        return "/front/categoryDetail";
    }

    @RequestMapping("/queryCategoryid")
    @ResponseBody
    public List<News> queryCategoryid(){
        List<News> list = newsService.queryAll();
        System.out.println("所有................");
        return list;
    }

}

