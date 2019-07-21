package org.gdpi.neusoft.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Address;
import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.dao.AddressDao;
import org.gdpi.neusoft.dao.UserDao;
import org.gdpi.neusoft.service.ex.AddressNotFoundException;
import org.gdpi.neusoft.service.ex.UserNotFoundException;
import org.gdpi.neusoft.service.ex.UsernameAlreadyExitException;
import org.springframework.stereotype.Service;

/**
 * @author montreal
 *	个人信息管理实现类
 */
@Service
public class PersonInfoServiceImpl implements PersonInfoService {
	@Resource
	private UserDao userDao;
	
	@Resource
	private AddressDao addressDao;
	
	@Override
	public User showPersonInfo(Integer userId) {
		User user =userDao.selectById(userId);
		if (user!=null) {
			return user;	
		}else {
			throw new UserNotFoundException();
		}
	}

	@Override
	public void updatePersonInfo(Integer id, String username,
			String name, String phone, String email) {
		User user=userDao.selectById(id);
		if (user!=null) {
			if(username!=null) {
					Author author=new Author();
					author.setModifyUser(id);
					author.setModifyTime(new Date());
					user.setNickName(username);
					user.setName(name);
					user.setPhone(phone);
					user.setEmail(email);
					userDao.update(user);
			}
		}else {
			throw new  UserNotFoundException();
		}
		
	}

	@Override
	public Integer checkOldPwd(Integer userId, String oldPwd) {
		User user=userDao.selectById(userId);
		if (user!=null) {
			 if(oldPwd.equals(user.getPassword())) {
				 return 1;
			 }else {
				 return 0;
			 }
		}else {
			throw new UserNotFoundException("用户不存在");
		}
	}

	@Override
	public Integer checkNewPwd(Integer userId, String newPwd) {
		User user=userDao.selectById(userId);
		if (user!=null) {
			 if(!newPwd.equals(user.getPassword())) {
				 user.setPassword(newPwd);
				 userDao.update(user);
				 return 0;
			 }else {
				 return 1;
			 }
		}else {
			throw new UserNotFoundException("用户不存在");
		}
	}

	@Override
	public void insertAddress(Integer userId, String recName, 
			String detail,  String phone, String telphone,Integer recDefault) {
		 User user =	userDao.selectById(userId);
		 if (user!=null) {
			 //查询用户默认地址
			 Address addressDefault= addressDao.selectDefaultAddress(userId);
			 Address address =new Address();
			 Author author=new Author();
			 author.setCreatedUser(userId);
			 author.setCreatedTime(new Date());
			 author.setModifyUser(userId);
			 author.setModifyTime(new Date());
			 address.setUserId(userId);
			 address.setRecName(recName);
			 address.setDetail(detail);
			 address.setPhone(phone);
			 address.setTelphone(telphone);
			 //当用户默认地址存在且新地址设为默认地址，改变旧默认地址
			 if(addressDefault!=null&&recDefault==1) {
				 addressDao.unDefaultAddress(userId);
				 address.setRecDefault(1);
			 }else if(addressDefault==null) {
				 address.setRecDefault(1);
			 }else {
				 address.setRecDefault(0);
			 }
			 address.setRecAddress(detail);
			 address.setAuthor(author);
			 addressDao.insertAddress(address);                   
		 }else {
			throw new UserNotFoundException("用户不存在");
		}
	}

	@Override
	public void deleteAddress(Integer id) {
		Address address=addressDao.selectById(id);
		if(address!=null) {
			addressDao.deleteById(id);
		}else {
			throw new UserNotFoundException("地址不存在");
		}
	}

	@Override
	public List<Address> selectAddressByUserId(Integer userId) {
		User user= userDao.selectById(userId);
		if (user!=null) {
			return addressDao.selectByUserId(userId);	
		}else {
			throw new UserNotFoundException("用户不存在");
		}
	}

	@Override
	public void updateAddress(Integer id, Integer userId, String recName,
			String detail, String phone, String telphone,Integer recDefault) {
		User user= userDao.selectById(userId);
		if(user!=null) {
			Address address= addressDao.selectById(id);
			System.out.println(address.getId());
			if(address!=null) {
				 //查询用户默认地址
				Address addressDefault= addressDao.selectDefaultAddress(userId);
				 //当用户默认地址存在且新地址设为默认地址，改变旧默认地址
				 if(addressDefault!=null&&recDefault==1) {
					 addressDao.unDefaultAddress(userId);
					 address.setRecDefault(1);
				 }else if(addressDefault==null&&recDefault==1) {
					 address.setRecDefault(1);
				 }else {
					 address.setRecDefault(0);
				 }
				Author author=new Author();
				author.setModifyTime(new Date());
				author.setModifyUser(userId);
				address.setRecName(recName);
				address.setDetail(detail);
				address.setPhone(phone);
				address.setTelphone(telphone);
				addressDao.updateAddress(address);
			}
		}else{
			throw new UserNotFoundException("用户不存在");
		}
	}

	@Override
	public void setDefaultAddress(Integer userId, Integer id) {
		Author author=new Author();
		author.setModifyUser(userId);
		author.setModifyTime(new Date());
		Address address=addressDao.selectById(id);
		if (address!=null) {
			//查询用户默认地址
			 Address addressDefault= addressDao.selectDefaultAddress(userId);
			//当用户默认地址存在且新地址设为默认地址，改变旧默认地址
			 if(addressDefault!=null&&address.getRecDefault()==0) {
				 addressDao.unDefaultAddress(userId);
				 address.setRecDefault(1);
			 }else if(addressDefault==null&&address.getRecDefault()==0) {
				 address.setRecDefault(1);
			 }else {
				 address.setRecDefault(0);
			 }
			 addressDao.updateAddress(address);
		}else {
			throw new AddressNotFoundException("地址不存在");
		}
	}

	@Override
	public Address selectAddressById(Integer id) {
		return addressDao.selectById(id);
	}	
	
}
