package org.gdpi.neusoft.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.neusoft.bean.Address;

/**
 * @author montreal
 *	地址接口
 */
public interface AddressDao {
	
	/**
	 * 添加地址
	 * @param address 地址对象
	 */
	public void insertAddress(Address address);
	/**
	 * 通过id删除
	 * @param id
	 */
	public void deleteById(Integer id);
	/**
	 * 通过用户id删除
	 * @param userId
	 */
	public void deleteByUserId(@Param("userId")Integer userId);
	/**
	 * 通过地址id查找
	 * @param id 地址id
	 * @return address 地址
	 */
	public Address selectById(Integer id);
	/**
	 * 查找所有地址
	 * @return 地址列表
	 */
	public List<Address> selectAll();
	/**
	 * 通过用户id查找地址
	 * @param userId
	 * @return 用户所有地址
	 */
	public List<Address> selectByUserId(@Param("userId")Integer userId);
	/**
	 * 查找地址总数
	 * @return 地址总数
	 */
	public Integer countAddress();
	/**
	 * 通过用户id查找地址总数
	 * @param userId 用户id
	 * @return 用户地址总数
	 */
	public Integer countAddressByUserId(@Param("userId") Integer userId);
	/**
	 * 更新地址
	 * @param address 需要更新地址
	 */
	public void updateAddress(Address address) ;
	/**
	 * 查找用户默认地址
	 * @param userId 
	 * @return address 用户默认地址
	 */
	public Address selectDefaultAddress(@Param("userId") Integer userId);
	/**
	 * 更新默认地址
	 * @param oldDefault 旧默认地址id
	 * @param newDefault 新默认地址id
	 */
	public void updateRecDefault(@Param("oldDefault")Integer oldDefault,@Param("newDefault")Integer newDefault);
	/**
	 * 取消旧默认地址
	 * @param userId 用户id
	 */
	public void unDefaultAddress(@Param("userId")Integer userId);
}
