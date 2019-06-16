package cn.duli.mapper;

import cn.duli.pojo.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryMapper {

    //插入新闻类别
    Category insertOne(Category category);

    //判断类别名是否唯一
    Boolean checkCategory(String name);

    //显示新闻类别列表
    List<Category> queryAll();

    //根据Id查询类别
    Category selectOne(Integer id);

    //修改新闻类别
    void updateOne(Category category);

    //判断除自身外其它类型同名的个数
    Integer checkHasName(Category category);

    //删除新闻类别
    void deleteOne(Integer id);

    //批量删除新闻类别
    void batchDelete(List<Integer> list);
}