package cn.duli.service;

import cn.duli.pojo.Category;

import java.util.List;

public interface CategoryService {
    /**
     *
     * 插入类别名
     * @param category
     * @return
     */
    Category insertOne(Category category);
    /**
     * 判断类别名是否唯一
     * @param name
     * @return
     */
    Boolean checkCategory(String name);
    /**
     * 类别列表
     * @return
     */
    List<Category> queryAll();

    /**
     * 根据Id查询类别:数据回显
     * @param id
     * @return
     */
    Category selectOne(Integer id);

    /**
     * 更新类别名
     * @param category
     * @return
     */
    void updateOne(Category category);

    /**
     * 判断除自身外其它类型同名的个数
     * @param category
     * @return
     */
    Integer checkHasName(Category category);

    /**
     * 删除类别名
     * @param id
     * @return
     */
    void deleteOne(Integer id);

    /**
     * 批量删除类别名
     * @param list
     * @return
     */
    void batchDelete(List<Integer> list);
}
