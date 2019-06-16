package cn.duli.mapper;

import cn.duli.pojo.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {

    //显示所有新闻列表
    List<News> queryAll();

    //删除新闻
    void deleteOne(Integer id);

    //按新闻标题模糊查询
    List<News> queryLikeByTitle(@Param("title") String title);

    //发布新闻
    void insertOne(News news);

    //根据新闻Id回显内容
    News selectById(@Param("id") Integer id);

    //更新新闻信息
    void updateOne(News news);

    //批量删除
    void batchDelete(List<Integer> id);

}