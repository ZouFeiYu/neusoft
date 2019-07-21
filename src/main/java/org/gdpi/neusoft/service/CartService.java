package org.gdpi.neusoft.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.neusoft.bean.Good;

public interface CartService {
	/**
	 * 添加商品,如果商品已经存在则修改数量
	 * 
	 * @param goodsID
	 *            商品id
	 * @param userID
	 *            用户id
	 * @param count
	 *            商品数量,如果count==null,默认数量为1
	 */
	public void insert(@Param("goodsID") Integer goodsID, @Param("userID") Integer userID,
			@Param("count") Integer count);

	/**
	 * 删除商品
	 * 
	 * @param goodsID
	 *            商品id
	 * @param userID
	 *            用户id
	 */
	public void delete(@Param("goodsID") Integer goodsID, @Param("userID") Integer userID);

	/**
	 * 查找商品,分页
	 * 
	 * @param userID
	 *            用户id
	 * @param start
	 *            分页开始下标
	 * @param count
	 *            每页数量
	 * @return 商品集合
	 */
	public List<Good> select(@Param("userID") Integer userID, @Param("start") Integer start,
			@Param("count") Integer count);

	/**
	 * 修改商品数量
	 * 
	 * @param userID
	 *            用户id
	 * @param goodsID
	 *            商品id
	 * @param count
	 *            商品数量
	 */
	public void update(@Param("userID") Integer userID, @Param("goodsID") Integer goodsID,
			@Param("count") Integer count);

	/**
	 * 统计总数
	 * 
	 * @param userID
	 *            用户id
	 * @return 商品总数
	 */
	public Integer count(@Param("userID") Integer userID);
	
	/**
	 * 查找单个商品数量
	 * @param userID
	 * @param goodsID
	 * @return
	 */
	public Integer selectByGoodsID(@Param("userID") Integer userID, @Param("goodsID") Integer goodsID);
	
	/**
	 * 根据用户id和商品id查找
	 * @param userID
	 * @param ids
	 * @return
	 */
	public List<Good> selectByUids( @Param("userID")Integer userID, @Param("ids") Integer[] ids);

}
