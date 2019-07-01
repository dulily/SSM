package cn.duli.controller;


import cn.duli.mapper.CategoryMapper;
import cn.duli.pojo.Category;
import cn.duli.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    /**
     * 后台部分
     */

    //插入新闻类别名
    @RequestMapping(value="/insertOne", produces={"text/html;charset=UTF-8;","application/json;"})
    public String insertOne(Model model,Category category){
        //判断类别名是否唯一
        boolean category1 = categoryService.checkCategory(category.getName());
        System.out.println("正在插入......");
        if (category1){
            model.addAttribute("info","类别已存在");
        }else {
            categoryService.insertOne(category);
            model.addAttribute("info","插入成功");
        }
        return "/category/addCategory";
    }

    //查询新闻类别列表
    @RequestMapping("/queryAll")
    public String queryAll(Model model){
        List<Category> categories = categoryService.queryAll();
        model.addAttribute("all",categories);
        return "/category/categoryList";
    }

    //根据Id查询类别:数据回显
    @RequestMapping("/selectOne")
    public String selectOne(Model model,@RequestParam("id") Integer id){
        Category cat = categoryService.selectOne(id);
        model.addAttribute("cat",cat);
        return "/category/updateCategory";
    }

    //修改新闻类别
    @RequestMapping("/updateOne")
    public String updateOne(Model model, Category category){
        //判断除自身外其它类型同名的个数,如果不存在类别名一样的=类别名个数<1
        if (categoryService.checkHasName(category)<1){
            categoryService.updateOne(category);
            System.out.println("正在修改.....");
            return "redirect:/category/queryAll";
        }else{
            model.addAttribute("updateInfo","此类别已存在");
            return "/category/updateCategory";
        }
    }

    //根据类别id删除新闻类别
    @RequestMapping("/deleteOne")
    public String deleteOne(@RequestParam("id") Integer id){
        categoryService.deleteOne(id);
        System.out.println("正在删除.....");
        return "redirect:/category/queryAll";
    }

    //批量删除新闻类别
    @RequestMapping(value="/batchDelete", produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String batchDelete(String name){
        System.out.println(name);
        List<Integer> list = new ArrayList<>();
        for (int i=0;i<name.split(",").length;i++){
            list.add(Integer.parseInt(name.split(",")[i]));
        }
        categoryService.batchDelete(list);
        return "删除成功";
    }

    /**
     * 前台部分
     */

    //前台菜单栏查询所有类别
    @RequestMapping("/queryName")
    @ResponseBody
    public List<Category> queryName(){
        List<Category> categories = categoryService.queryAll();
        System.out.println("类别为："+categories);
        return categories;
    }
}
