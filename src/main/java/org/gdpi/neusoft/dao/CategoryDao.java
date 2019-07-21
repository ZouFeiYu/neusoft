package org.gdpi.neusoft.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.neusoft.bean.Category;

public interface CategoryDao {
	/**
	 *  添加分类
	 * @param category
	 */
	public void insert(Category category);
	/**
	 *  删除分类,id
	 * @param id
	 */
	public void delete(Integer id);
	/** 
	 * 查找分类,所有,分页
	 * @param start 起始记录的位置,0开始.
	 * @param count 每次查询的总数量
	 * @return
	 */
	public List<Category> selectAll(@Param("start")Integer start,@Param("count")Integer count);
	public List<Category> selectBySatus(@Param("status")List<Integer> status,@Param("start")Integer start,@Param("count")Integer count);
	/**
	 *  查找分类,parentID,分页
	 * @param parentId
	 * @return
	 */
	public List<Category> selectByParentId(@Param("parentId")Integer parentId,@Param("start")Integer start,@Param("count")Integer count);
	/**
	 *  修改分类,id
	 * @param category
	 */
	public void update(Category category);
	/**
	 * 通过商品分类id查找
	 * @param id 商品分类id 
	 * @return
	 */
	public Category selectById(Integer id) ;
	/**
	 * 查找商品分类数
	 * @return
	 */
	public Integer categoryCount();	

	
	
}
