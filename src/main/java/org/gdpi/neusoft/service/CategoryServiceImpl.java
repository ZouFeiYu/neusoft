package org.gdpi.neusoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Category;
import org.gdpi.neusoft.dao.CategoryDao;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Resource
	CategoryDao categoryDao;
	@Override
	public List<Category> select(Integer parentId, Integer start, Integer count) {
		if(parentId==null){
			parentId=0;
		}
		return categoryDao.selectByParentId(parentId, start, count);
	}

}
