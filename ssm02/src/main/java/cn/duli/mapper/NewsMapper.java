package cn.duli.mapper;

import cn.duli.pojo.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {

    /**
     * 后台部分
     */

    //显示所有新闻列表
    List<News> queryAll();

    //根据新闻id删除新闻
    void deleteOne(@Param("id") Integer id);

    //按新闻标题模糊查询
    List<News> queryLikeByTitle(@Param("title") String title);

    //发布新闻
    void insertOne(News news);

    //根据新闻Id回显内容
    News selectById(@Param("id") Integer id);

    //更新新闻信息
    void updateOne(News news);

    //批量删除新闻
    void batchDelete(List<Integer> id);


    /**
     * 前台部分
     */

    //查询最新发布的前7条新闻
    List<News> queryLimit();

    //查询前7条国际新闻
    List<News> queryCategoryName();

    //查询前7条娱乐新闻
    List<News> queryYule();

    //查询前4条国内新闻
    List<News> queryOwnNews();

    //查询前5条军事新闻
    List<News> queryMilitary();

    /**
     * 导航栏
     */
    //根据类别id查询此类别下的新闻
    List<News> queryCategoryById(@Param("categoryid") Integer categoryid);

}