package org.gdpi.neusoft.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.bean.User;

public interface GoodsDao {
	/**
	 *  添加商品
	 * @param good
	 */
	public void insert(Good good);
	/**
	 *  删除商品,id
	 * @param id
	 */
	public void delete(Integer id);
	/** 
	 * 查找商品,所有,分页
	 * @param start 起始记录的位置,0开始.
	 * @param count 每次查询的总数量
	 * @return
	 */
	public List<Good> selectAll(@Param("start")Integer start,@Param("count")Integer count);
	/**
	 *  查找商品,id
	 * @param id
	 * @return
	 */
	public Good selectById(Integer id);
	/**
	 *  查找商品,模糊搜索,分页
	 * @param content 模糊查询内容
	 * @param start 起始记录的位置,0开始.
	 * @param count 每次查询的总数量
	 * @return
	 */
	public List<Good> selectLike(@Param("name")String name,@Param("start")Integer start,@Param("count")Integer count);
	/**
	 *  查找商品,分类id
	 * @param category
	 * @return
	 */
	public List<Good> selectByCategoryId(@Param("categoryId")Integer category,@Param("start")Integer start,@Param("count")Integer count);
	/**
	 * 查询上商品,订单号
	 * @param orderId
	 * @return
	 */
	public List<Good> selectByOrderId(String orderId);
	/** 
	 * 修改商品,id
	 * @param good
	 */
	public void update(@Param("id")Integer id,@Param("categoryId")Integer category_id,@Param("name")String name,
			@Param("details")String details,
			@Param("price")Double price,@Param("vipPrice")Double vip_price,
			@Param("image")String image,@Param("count")Integer count,
			@Param("orders")Integer orders,@Param("state")int state,
			@Param("modifyUser")int modify_id,@Param("modifyTime")Date modify_date );
	/**
	 * 模糊查询得商品的总量
	 * @param content
	 * @return
	 */
	public Integer selectCount(@Param("name")String name);
	

	/**
	 * 查找所有用户类型，分页
	 * 
	 * @param start
	 *            起始记录的位置,0开始.
	 * @param count
	 *            每次查询的总数量
	 * @param state
	 *            状态
	 * @param type
	 * @return
	 */
	public List<Good> selectByState(@Param("start") Integer start, @Param("count") Integer count,
			 @Param("state")List<Integer> state);
	
	public Integer stateCount( @Param("state")List<Integer> state);
	
	public void updateBatchState(@Param("ids") List<Integer> ids, @Param("state") Integer state,
			@Param("modifyUser") Integer modifyUser, @Param("modifyTime") Date modifyTime);
	
	public void deleteBatch(@Param("ids")List<Integer> ids);
	public Good selectByName(String name);
}
