package org.gdpi.neusoft.test.dao;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.Category;
import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.dao.CategoryDao;
import org.gdpi.neusoft.dao.GoodsDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:application-dao.xml"})
public class Test_category {
	@Resource
	private CategoryDao categoryDao;
	@Resource
	private GoodsDao goodsDao;
	
	//添加分类
	@Test
	public void insert() {
		Author author=new Author();
		Date date=new Date();
		System.out.println(date);
		author.setModifyUser(1);
		
		Category category=new Category();
		category.setName("a");
		category.setOrders(1);
		category.setParentId(1);
		category.setStatus(1);
		category.setAuthor(author);
		
		categoryDao.insert(category);
	}

	//删除分类
	@Test
	public void delete() {
		categoryDao.delete(2);
	}
	
	//按分页查找商品分类
	@Test
	public void findAll() {
		List<Category>categories=categoryDao.selectAll(0, 10);
		for (Category category : categories) {
			System.out.println(category.getName());
			}
		}
	
	
	//通过parentId查找商品分类
	@Test
	public void selectByparentId() {
		List<Category>categories=categoryDao.selectByParentId(1,0, 10);
		for (Category category : categories) {
			System.out.println(category.getName());
		}
		
	} 
	
	//更新商品分类
	@Test
	public void update() {
		Author author=new Author();
		Date date=new Date();
		author.setCreatedUser(1);
		author.setCreatedTime(date);
		author.setModifyUser(2);
		author.setModifyTime(date);
		Category category=categoryDao.selectById(1);
		System.out.println(category.getName());
		category.setName("mengli");
		category.setOrders(1);
		category.setParentId(1);
		category.setStatus(0);
		category.setAuthor(author);
		categoryDao.update(category);
		System.out.println(categoryDao.selectById(1).getName());
	}

	//查找商品分类总数
	@Test
	public void categroyCount() {
		Integer integer=categoryDao.categoryCount();
		System.out.println(integer);
	}
	
	
	@Test
	public void selectLike()	{
		List<Good> goods= goodsDao.selectLike("奇", 0, 10);
		for (Good good : goods) {
			System.out.println(good.getName());
		}
	}
	
	
	

}
