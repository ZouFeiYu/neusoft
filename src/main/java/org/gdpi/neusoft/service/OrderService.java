package org.gdpi.neusoft.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.neusoft.bean.Order;

public interface OrderService {
	/**
	 * 通过yonghuid查找用户订单
	 * @param userId 用户id
	 * @param start 开始订单位置
	 * @param count 每页订单数量
	 * @return 订单列表
	 */
	public List<Order> showOrdersByUserId(Integer userId,Integer start,Integer count);
	
	/** 
	 * 查询用户订单总数
	 * @param userId 用户id
	 * @return 订单数量
	 */
	public Integer selectCountByUserId(Integer userId);
	
	
	/**
	 * 通过订单id查找订单
	 * @param orderId 订单id
	 * @return 
	 */
	public Order selectByOrderId(String orderId);
}
