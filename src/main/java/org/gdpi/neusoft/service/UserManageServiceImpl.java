package org.gdpi.neusoft.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.dao.UserDao;
import org.springframework.stereotype.Service;

@Service
public class UserManageServiceImpl implements UserManageService {
	@Resource
	UserDao userDao;

	@Override
	public List<User> selectAll(List<Integer> type, List<Integer> state) {
		return userDao.selectByTypeAndState(null, null, type, state);
	}

	@Override
	public Integer countAll(List<Integer> type, List<Integer> state) {
		return userDao.TypeAndStateCount(type, state);
	}

	@Override
	public User selectById(Integer id) {

		return userDao.selectById(id);
	}

	@Override
	public void addUser(User user) {
		userDao.insert(user);
	}

	@Override
	public void updateState(List<Integer> ids, Integer state, Integer id) {
		userDao.updateBatchState(ids, state, id, new Date());
		
	}

	@Override
	public void updateInfo(User user) {
		userDao.update(user);
		
	}

	@Override
	public User selectByNickName(String nickName) {
		return userDao.selectByName(nickName);
		
	}

	@Override
	public void delete(List<Integer> ids) {
		userDao.deleteBatch(ids);
		
	}
	

}
