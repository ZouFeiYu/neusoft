package org.gdpi.neusoft.test.dao;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.bean.Order;
import org.gdpi.neusoft.dao.GoodsDao;
import org.gdpi.neusoft.dao.OrderDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:application-dao.xml"})
public class Test_Orders {
	
	@Resource
	private OrderDao orderDao;
	@Resource
	private  GoodsDao goodsDao;
	
	@Test
	public void insert(){
		String id="9012345678";
				
	for (int i = 0; i < 10; i++) {
		Author author=new Author();
		Date date=new Date();
		author.setCreatedTime(date);
		author.setCreatedUser(1);
		List<Good>goods= goodsDao.selectAll(0, 11);
//		for (Good good : goods) {
//			System.out.println(good.getName());
//		}
		
		Order order=new Order();
		order.setId(id+String.valueOf(i));
		order.setUserId(36);
		order.setAuthor(author);
		order.setConsignee("a");
		order.setAddress("a");
		order.setPhone("123456");
		order.setGoods(goods);
		order.setState(0);
		orderDao.insert(order);
		}
	}
	
	@Test
	public void selectByuserId() {
		List<Order>list=orderDao.selectByUserId(19, null, null, "12345678900", 0, 20);
		for (Order order : list) {
			System.out.println(order.toString());
		}
	}
	
	@Test
	public void selectAll() {
		List<Order>list=orderDao.selectAll(0, 11);
		for (Order order : list) {
			System.out.println(order.toString());
		}
	}
	@Test
	public void selectCountByUserId() {
		Integer countInteger=orderDao.selectCountByUserId(19);
		System.out.println(countInteger);
	}
	@Test
	public void selectByOrderId() {
		Order order=orderDao.selectByOrderId("12345678900");
		System.out.println(order.getId());
		for (Good goods : order.getGoods()) {
			System.out.println(goods.toString());
		}
	}
}
