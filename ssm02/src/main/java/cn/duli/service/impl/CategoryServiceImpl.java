package cn.duli.service.impl;


import cn.duli.mapper.CategoryMapper;
import cn.duli.pojo.Category;
import cn.duli.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public Category insertOne(Category category) {
        return categoryMapper.insertOne(category);
    }

    @Override
    public Boolean checkCategory(String name) {
        return categoryMapper.checkCategory(name);
    }

    @Override
    public List<Category> queryAll() {
        return categoryMapper.queryAll();
    }

    @Override
    public Category selectOne(Integer id) {
        return categoryMapper.selectOne(id);
    }

    @Override
    public void updateOne(Category category) {
        categoryMapper.updateOne(category);
    }

    @Override
    public Integer checkHasName(Category category) {
        return categoryMapper.checkHasName(category);
    }

    @Override
    public void deleteOne(Integer id) {
        categoryMapper.deleteOne(id);
    }

    @Override
    public void batchDelete(List<Integer> list) {
        categoryMapper.batchDelete(list);
    }



}
