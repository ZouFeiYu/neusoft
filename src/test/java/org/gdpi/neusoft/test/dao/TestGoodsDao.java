package org.gdpi.neusoft.test.dao;

import java.util.Date;
import java.util.List;

import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.dao.GoodsDao;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestGoodsDao {
	@Test
	public void testinsert() {
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml");
		GoodsDao dao = ac.getBean("goodsDao", GoodsDao.class);
		Good good = new Good();
		Author author = new Author();
		good.setCategoryId(5);
		good.setName("hhjjk");
		good.setPrice(33.5);
		good.setState(1);
		author.setCreatedUser(1);
		Date string = new Date();
		author.setCreatedTime(string);
		good.setAuthor(author);
		dao.insert(good);
	}
	
	@Test
	public void testDelete() {
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml");
		GoodsDao dao = ac.getBean("goodsDao", GoodsDao.class);
		dao.delete(2);
	}

	@Test
	public void testselectAll() {
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml");
		GoodsDao dao = ac.getBean("goodsDao", GoodsDao.class);
		for(Good c:dao.selectAll(0, 5)){
			System.out.println(c.getId()+","+c.getCategoryId()+","+c.getName()+","+c.getDetails()+","+c.getPrice()+","+c.getState()+","+c.getAuthor().getCreatedUser()+","+c.getAuthor().getCreatedTime());
		}
	}
	@Test
	public void testselectById() {
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml");
		GoodsDao dao = ac.getBean("goodsDao", GoodsDao.class);
		Good c = dao.selectById(3);
		System.out.println(c.getId()+","+c.getCategoryId()+","+c.getName()+","+c.getDetails()+","+c.getPrice()+","+c.getState()+","+c.getAuthor().getCreatedUser()+","+c.getAuthor().getCreatedTime());
	}
	@Test
	public void testseletctLike() {
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml");
		GoodsDao dao = ac.getBean("goodsDao", GoodsDao.class);
	System.out.println(dao.selectLike("%濂�%", 0, 2));
		for(Good c:dao.selectLike("%h%", 0, 2)) {
		System.out.println("a");
		}
	}
	@Test
	public void testselectByCategoryId() {
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml");
		GoodsDao dao = ac.getBean("goodsDao", GoodsDao.class);
		for(Good c:dao.selectByCategoryId(0,0,5)) {
		System.out.println(c.getId()+","+c.getName()+","+c.getDetails()+","+c.getPrice()+","+c.getState()+","+c.getAuthor().getCreatedUser()+","+c.getAuthor().getCreatedTime());
		}
	}
	@Test
	public void testupdate() {
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml");
		GoodsDao dao = ac.getBean("goodsDao", GoodsDao.class);
		Date date = new Date();
		dao.update(2,2, "yang", "jkfdsjf",222.00, 199.00, "", 20, 0, 1, 1,date);
	}
	@Test
	public void selectByOrderId(){
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml");
		GoodsDao dao = ac.getBean("goodsDao", GoodsDao.class);
		System.out.println(dao.selectByOrderId("1945534833"));
	}
}
