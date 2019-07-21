package org.gdpi.neusoft.service;

import java.util.List;

import org.gdpi.neusoft.bean.User;

public interface UserManageService {
	/**
	 * 查询所有用户
	 * @param type 用户类型
	 * @param state 用户状态
	 * @return
	 */
	public List<User> selectAll(List<Integer> type, List<Integer> state);
	/**
	 * 统计所有用户
	 * @param type 用户类型
	 * @param state 用户状态
	 * @return
	 */
	public Integer countAll(List<Integer> type, List<Integer> state);
	/**
	 * 查询用户 
	 * @param id 用户id
	 * @return
	 */
	public User selectById(Integer id);
	/**
	 * 添加用户
	 * @param user
	 */
	public void addUser(User user);
	/**
	 * 更新用户状态
	 * @param ids 用户id集合
	 * @param state 用户状态
	 * @param id 当前操作的用户id
	 */
	public void updateState(List<Integer> ids, Integer state, Integer id);
	/**
	 * 更新用户信息
	 * @param user
	 */
	public void updateInfo(User user);
	/**
	 * 查询用户,用户昵称
	 * @param nickName
	 */
	public User selectByNickName(String nickName);
	public void delete(List<Integer> ids);
}
