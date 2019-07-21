package org.gdpi.neusoft.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.dao.UserDao;
import org.gdpi.neusoft.service.ex.PasswordNotMatchException;
import org.gdpi.neusoft.service.ex.UserNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AdminInfoServiceImpl implements AdminInfoService {
	@Resource
	UserDao userDao;
 
	@Override
	public User loginCheck(String name, String password) {
		User user = userDao.selectByName(name);
		if (user == null) {
			throw new UserNotFoundException("用户不存在");
		} else if (!user.getPassword().equals(password)) {
			throw new PasswordNotMatchException("密码不匹配");
		} else {
			return user;
		}
	}

	@Override
	public void updatePassword(User user) {
		userDao.update(user);
	}

	@Override
	public void addAdmin(User user) {
		userDao.insert(user);

	}

	@Override
	public List<User> selectAll(List<Integer> type,List<Integer> state) {
		return userDao.selectByTypeAndState(null, null, type, state);
	}

	@Override
	public Integer countAll(List<Integer> type,List<Integer> state) {
		return userDao.TypeAndStateCount(type, state);
	}
	
	@Override
	public void updateState(User user){
		userDao.update(user);
	}
	
	@Override
	public User selectById(Integer id) {
		return userDao.selectById(id);
	}
	@Override
	public void updatePower(User user) {
		userDao.update(user);
	}

	@Override
	public void updateInfo(User user) {
		userDao.update(user);
		
	}

	@Override
	public void updateState(List<Integer> ids,Integer state,Integer modifyUser) {
		userDao.updateBatchState(ids, state, modifyUser, new Date());
		
	}
	
	@Override
	public void delete(List<Integer> ids) {
		if(ids.size()==1) {
			userDao.delete(ids.get(0));
		}else {
			userDao.deleteBatch(ids);			
		}
	}

	@Override
	public User selectByNickName(String nickName) {
		
		return userDao.selectByName(nickName);
	}

}
