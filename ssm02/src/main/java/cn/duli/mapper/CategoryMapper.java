package cn.duli.mapper;

import cn.duli.pojo.Category;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryMapper {

    //插入新闻类别名
    Category insertOne(Category category);

    //判断类别名是否唯一
    Boolean checkCategory(String name);

    //查询新闻类别列表
    List<Category> queryAll();

    //根据Id查询类别:数据回显
    Category selectOne(@Param("id") Integer id);

    //修改新闻类别
    void updateOne(Category category);

    //判断除自身外其它类型同名的个数
    Integer checkHasName(Category category);

    //根据类别id删除新闻类别
    void deleteOne(@Param("id") Integer id);

    //批量删除新闻类别
    void batchDelete(List<Integer> list);
}