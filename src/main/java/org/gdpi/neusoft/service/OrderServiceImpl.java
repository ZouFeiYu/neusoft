package org.gdpi.neusoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Order;
import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.dao.OrderDao;
import org.gdpi.neusoft.dao.UserDao;
import org.gdpi.neusoft.service.ex.UserNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService{
	@Resource
	private OrderDao orderDao;
	@Resource
	private UserDao userDao;
	
	@Override
	public List<Order> showOrdersByUserId(Integer userId, Integer start, Integer count) {
		User  user=userDao.selectById(userId);
		if(user!=null) {
			return orderDao.showAllByUserId(userId, start, count);
		}else {
			throw new UserNotFoundException("用户不存在");
		}
	}

	@Override
	public Integer selectCountByUserId(Integer userId) {
		return orderDao.selectCountByUserId(userId);
	}

	@Override
	public Order selectByOrderId(String orderId) {
		return orderDao.selectByOrderId(orderId);
	}


}
