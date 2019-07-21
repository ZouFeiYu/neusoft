package org.gdpi.neusoft.service;

import java.util.List;

import org.gdpi.neusoft.bean.User;

public interface AdminInfoService {
	/**
	 * 登录检查
	 * @param name 用户名
	 * @param password 登录密码
	 * @return
	 */
	public User loginCheck(String name,String password);
	/**
	 * 更新密码
	 * @param password
	 */
	public void updatePassword(User user);
	/**
	 * 添加管理员
	 * @param user
	 */
	public void addAdmin(User user);
	/**
	 *  查询所有管理员
	 * @param type 管理员类型
	 * @param state 管理员状态
	 * @return
	 */

	public List<User> selectAll(List<Integer> type,List<Integer> state);
	/**
	 * 统计所管理员有数量
	 * @return
	 */
	public Integer countAll(List<Integer> type,List<Integer> state);
	/**
	 * 更新状态
	 * @param user
	 */
	public void updateState(User user);
	/**
	 * 查询用户
	 * @param id 用户id
	 * @return
	 */
	public User selectById(Integer id);
	/**
	 * 更新权限
	 * @param user
	 */
	public void updatePower(User user);
	/**
	 * 更新信息
	 * @param user
	 */
	public void updateInfo(User user);
	/**
	 * 更新状态,批量
	 * @param user
	 */
	public void updateState(List<Integer> ids,Integer state,Integer modifyUser);
	/**
	 * 删除数据,批量
	 * @param ids
	 */
	public void delete(List<Integer> ids);
	/**
	 * 查询用户
	 * @param nickName 用户昵称
	 * @return
	 */
	public User selectByNickName(String nickName);
}
