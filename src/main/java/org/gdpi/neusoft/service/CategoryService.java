package org.gdpi.neusoft.service;

import java.util.ArrayList;
import java.util.List;

import org.gdpi.neusoft.bean.Category;

public interface CategoryService {
	/**
	 * 查询所有分类
	 * @param parentId 父类id
	 * @param start 分页下标
	 * @param count 分页数
	 * @return
	 */

	public List<Category> select(Integer parentId, Integer start, Integer count);

}
