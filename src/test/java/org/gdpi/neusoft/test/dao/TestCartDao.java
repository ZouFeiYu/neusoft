package org.gdpi.neusoft.test.dao;

import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.dao.CartDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:application-dao.xml" })
public class TestCartDao {
	@Resource
	CartDao cartDao;
	@Test
	public void insert() {
		cartDao.insert(10001, 123, 999);
	}
	@Test
	public void delete() {
		cartDao.delete(321, 123);
	}
	@Test
	public void select() {
		System.out.println(cartDao.select(123, 0, 5));
	}
	@Test
	public void update() {
		cartDao.update(123, 10001, 888);
	}
	@Test
	public void count() {
		System.out.println(cartDao.count(123));
	}
	@Test
	public void selectByGoodsID() {
		System.out.println(cartDao.selectByGoodsID(123, 10001));
	}
}
