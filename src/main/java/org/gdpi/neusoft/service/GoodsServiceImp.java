package org.gdpi.neusoft.service;

import java.util.Date;

import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.dao.GoodsDao;
import org.springframework.stereotype.Service;

@Service
public class GoodsServiceImp implements GoodsService {
	@Resource
	private GoodsDao dao;

	public void insert(Good good) {
		dao.insert(good);

	}

	public void delete(Integer id) {
		dao.delete(id);

	}

	public List<Good> selectAll(Integer start, Integer count) {
		return dao.selectAll(start, count);
	}

	public Good selectById(Integer id) {
		return dao.selectById(id);
	}

	public List<Good> selectLike(String name, Integer start, Integer count) {
		return dao.selectLike(name, start, count);
	}

	public List<Good> selectByCategoryId(Integer category,Integer start,Integer count) {
		return dao.selectByCategoryId(category,start,count);
	}

	public List<Good> selectByOrderId(String orderId) {
		return dao.selectByOrderId(orderId);
	}

	public void update(Integer id, Integer category_id, String name, String details, Double price,
			Double vip_price, String image, Integer count, Integer orders, int state, int modify_id, Date modify_date) {
		dao.update(id, category_id, name, details, price, vip_price, image, count, orders, state, modify_id, modify_date);
	}

	public Integer selectCount(String name) {
		return dao.selectCount(name);
	}

}
