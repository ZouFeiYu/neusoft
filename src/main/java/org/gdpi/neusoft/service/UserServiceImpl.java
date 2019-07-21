package org.gdpi.neusoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.dao.UserDao;
import org.gdpi.neusoft.service.ex.PasswordNotMatchException;
import org.gdpi.neusoft.service.ex.UserNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;
	@Override
	public void insert(User user) {
		userDao.insert(user);
	}

	@Override
	public void delete(Integer id) {
		userDao.delete(id);
	}

	@Override
	public List<User> selectAll(Integer start, Integer count) {
		return userDao.selectAll(start, count);
	}

	@Override
	public User selectById(Integer id) {
		return userDao.selectById(id);
	}

	@Override
	public User selectByName(String nickName) {
		return userDao.selectByName(nickName);
	}

	@Override
	public List<User> selectByType(Integer start, Integer count, Integer type) {
		return userDao.selectByType(start, count, type);
	}

	@Override
	public User selectByNameOrIDcard(String content) {
		return userDao.selectByNameOrIDcard(content);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public Integer UserCount() {
		return userDao.UserCount();
	}

	@Override
	public Integer TypeCount(Integer type) {
		return userDao.TypeCount(type);
	}


	@Override
	public User login(String username, String password) {
		User user=userDao.selectByName(username);
		if (user==null) {
			throw new UserNotFoundException();
		}else {
			if(user.getPassword().equals(password)) {
				return user;
			}else {
				throw new PasswordNotMatchException();
			}
		}
	}

	@Override
	public void register(User user) {
		userDao.insert(user);
	}



}
