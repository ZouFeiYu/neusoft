package org.gdpi.neusoft.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.neusoft.bean.User;

public interface UserDao {
	/**
	 * 添加用户
	 * 
	 * @param user
	 */
	public void insert(User user);

	/**
	 * 刪除用户,id
	 * 
	 * @param id
	 */
	public void delete(Integer id);

	/**
	 * 查找用户,所有,分页
	 * 
	 * @param start
	 *            起始记录的位置,0开始.
	 * @param count
	 *            每次查询的总数量
	 * @return
	 */
	public List<User> selectAll(@Param("start") Integer start, @Param("count") Integer count);

	/**
	 * 查找用户,id
	 * 
	 * @param id
	 * @return
	 */
	public User selectById(Integer id);

	/**
	 * 查找用户,名字
	 * 
	 * @param nickName
	 * @return
	 */
	public User selectByName(String nickName);

	/**
	 * 查找所有用户类型，分页
	 * 
	 * @param start
	 *            起始记录的位置,0开始.
	 * @param count
	 *            每次查询的总数量
	 * @param type
	 * @return
	 */
	public List<User> selectByType(@Param("start") Integer start, @Param("count") Integer count,
			@Param("type") Integer type);

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
	public List<User> selectByTypeAndState(@Param("start") Integer start, @Param("count") Integer count,
			@Param("type") List<Integer> type, @Param("state") List<Integer> state);

	/**
	 * 查找用户,nickName或IDcard
	 * 
	 * @param content
	 * @return
	 */
	public User selectByNameOrIDcard(String content);

	/**
	 * 修改用户,id
	 * 
	 * @param user
	 */
	public void update(User user);

	/**
	 * 查找用户总数
	 * 
	 * @return
	 */
	public Integer UserCount();

	/**
	 * 查找用户类型总数
	 * 
	 * @param type
	 * @return
	 */
	public Integer TypeCount(Integer type);

	/**
	 * 统计数量
	 * 
	 * @param type
	 *            用户类型
	 * @param state
	 *            用户状态
	 * @return
	 */
	public Integer TypeAndStateCount(@Param("type") List<Integer> type, @Param("state") List<Integer> state);

	/**
	 * 批量更新状态
	 * 
	 * @param ids 
	 * @param state
	 * @param modifyUser
	 * @param modifyTime
	 */

	public void updateBatchState(@Param("ids") List<Integer> ids, @Param("state") Integer state,
			@Param("modifyUser") Integer modifyUser, @Param("modifyTime") Date modifyTime);
	/**
	 * 批量删除
	 * @param ids
	 */
	public void deleteBatch(@Param("ids")List<Integer> ids);
}
