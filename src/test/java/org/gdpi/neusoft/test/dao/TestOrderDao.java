package org.gdpi.neusoft.test.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

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
@ContextConfiguration({ "classpath:application-dao.xml" })
public class TestOrderDao {
	@Resource
	private OrderDao orderDao;

	@Test
	public void insert() {
		Order order=new Order();
		Author author=new Author();
		author.setCreatedUser(1);
		author.setCreatedTime(new Date());
		order.setId(new Random().nextInt()+"");
		order.setAddress("广东理工职业学院");
		order.setAuthor(author);
		order.setConsignee("污污污漫画");
		order.setPhone("666-6666666");
		order.setState(1);
		order.setUserId(36);
		List<Good> goods=new ArrayList<>(); 
		for(int i=0;i<10;i++){
			Good good=new Good();
			good.setId(i);
			good.setCount(9*i);
			good.setPrice(10.00*i);
			good.setCategoryId(1);
			good.setName("34"+i);
			goods.add(good);
		}
		order.setGoods(goods);
		orderDao.insert(order);
	}

	@Test
	public void delete() {
		orderDao.delete(1);
	}

	@Test
	public void selectAll() {
		List<Order> orders=orderDao.selectAll(0, 5);
		System.out.println(orders);
	}

	@Test
	public void selectByUserId() {
		List<Order>list= orderDao.showAllByUserId(19, null, null);
		for (Order order : list) {
			System.out.println(order.toString());
		}
	}

	@Test
	public void selectByState() {
		System.out.println(orderDao.selectByState(1, 0, 5));
	}

	@Test
	public void update() {
		Order order=new Order();
		order.setId("1945534833");
		Author author=new Author();
		author.setModifyTime(new Date());
		order.setAuthor(author);
		orderDao.update(order);
	}
}
