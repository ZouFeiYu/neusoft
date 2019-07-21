package org.gdpi.neusoft.service;

import java.util.List;

import org.gdpi.neusoft.bean.Address;
import org.gdpi.neusoft.bean.User;

/**
 * @author montreal
 * 个人信息管理接口
 */
public interface PersonInfoService {
	
	/**
	 * 查询个人信息
	 * @param userId 用户id
	 * @return user 用户
	 */
	public  User showPersonInfo(Integer userId);
	
	/**
	 * 修改用户信息
	 * @param id 用户id
	 * @param username 用户名
	 * @param name 用户真实姓名
	 * @param phone 电话号码
	 * @param email 邮箱地址
	 */
	public void updatePersonInfo(Integer id,String username,
			String name,String phone,String email);
	
	/**
	 * 校对旧密码
	 * @param userId 用户id
	 * @param oldPwd 旧密码
	 */
	public Integer checkOldPwd(Integer userId, String oldPwd) ;
		
	/**
	 * 校对新密码
	 * @param userId 用户id
	 * @param newPwd 旧密码
	 */
	public Integer checkNewPwd(Integer userId, String newPwd) ;
	
	/**
	 *  添加收货地址
	 * @param userid	用户id
	 * @param recName 收货人姓名
	 * @param detail 地址详情
	 * @param phone 收货人手机号码
	 * @param telphone 收获人电话号码
	 * @param recDefault 默认地址
	 */
	public void insertAddress(Integer userid,String recName,String detail,
			String phone,String telphone,Integer recDefault);

	/**
	 * 通过id删除地址
	 * @param id 地址id
	 */
	public void deleteAddress(Integer id);
	
	/**
	 * 展示用户所有地址
	 * @param userId 用户id
	 * @return 用户所有地址
	 */
	public List<Address> selectAddressByUserId(Integer userId);
	
	/**
	 *  修改收货地址
	 * @param id	地址id
	 * @param recName 收货人姓名
	 * @param detail 地址详情
	 * @param phone 收货人手机号码
	 * @param telphone 收获人电话号码
	 * @param recDefault 默认地址
	 */
	public void updateAddress(Integer id, Integer userId,String recName,String detail,
			String phone,String telphone,Integer recDefault);
	
	/**
	 * 设置为默认地址
	 * @param userId 用户地
	 * @param id  新默认地址id
	 */
	public void setDefaultAddress(Integer userId,Integer id);
	
	/**
	 * 通过id查找地址
	 * @param id 地址id
	 * @return 地址
	 */
	public Address selectAddressById(Integer id);
}
