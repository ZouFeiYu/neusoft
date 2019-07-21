package org.gdpi.neusoft.service;

import java.util.List;

import org.gdpi.neusoft.bean.Category;

public interface CategoryManageService {
	public List<Category> selectAll(List<Integer> status);

	public Category selectById(Integer id);

	public void add(Category category);

	public void update(Category category);
}
