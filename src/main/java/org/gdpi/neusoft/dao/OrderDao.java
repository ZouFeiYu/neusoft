package org.gdpi.neusoft.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.neusoft.bean.Category;
import org.gdpi.neusoft.bean.Order;

public interface OrderDao {
	/**
	 * 添加订单
	 * 
	 * @param order
	 */
	public void insert(Order order);

	/**
	 * 删除订单,id
	 * 
	 * @param id
	 */
	public void delete(Integer id);

	/**
	 * 查找订单,所有,分页
	 * 
	 * @param start
	 * @param count
	 * @return
	 */
	public List<Order> selectAll(@Param("start") Integer start, @Param("count") Integer count);

	/**
	 * 查找订单,用户id/时间段/订单号,分页
	 * 
	 * @param userId
	 * @param startDate
	 * @param stopDate
	 * @param orderId
	 * @param start
	 * @param count
	 * @return
	 */
	public List<Order> selectByUserId(@Param("userId") Integer userId, @Param("startDate") Date startDate,
			@Param("stopDate") Date stopDate, @Param("orderId") String orderId, @Param("start") Integer start,
			@Param("count") Integer count);

	/**
	 * 查找订单,订单状态
	 * 
	 * @param state
	 * @param start
	 * @param count
	 * @return
	 */
	public List<Order> selectByState(@Param("state") Integer state, @Param("start") Integer start,
			@Param("count") Integer count);

	/**
	 * 修改订单,id
	 * 
	 * @param order
	 */
	public void update(@Param("order")Order order);
	
	/**
	 * 查询该用户所有订单
	 * @param userId 用户id
	 * @param start 数据起点
	 * @param count 查询数目
	 * @return
	 */
	public List<Order> showAllByUserId(@Param("userId")Integer userId,@Param("start")Integer start,@Param("count")Integer count);
	
	/**
	 * 查找用户订单总数
	 * @return 用户订单总数
	 */
	public Integer selectCountByUserId(@Param("userId")Integer userId);
	
	/**
	 * 通过订单id查找订单
	 * @param orderId 订单id
	 * @return id
	 */
	public Order selectByOrderId(@Param("orderId")String  orderId) ;
}
