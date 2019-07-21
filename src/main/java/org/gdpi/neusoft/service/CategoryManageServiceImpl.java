package org.gdpi.neusoft.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Category;
import org.gdpi.neusoft.dao.CategoryDao;
import org.springframework.stereotype.Controller;

@Controller
public class CategoryManageServiceImpl implements CategoryManageService {
@Resource
CategoryDao categoryDao;

@Override
public List<Category> selectAll(List<Integer> status) {

	return categoryDao.selectBySatus(status, null, null);
}

@Override
public Category selectById(Integer id) {
	return categoryDao.selectById(id);
}

@Override
public void add(Category category) {
	categoryDao.insert(category);
	
}

@Override
public void update(Category category) {
	categoryDao.update(category);
	
}
}
