package org.gdpi.neusoft.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.dao.UserDao;
import org.gdpi.neusoft.service.ex.PasswordNotMatchException;
import org.gdpi.neusoft.service.ex.UserNotFoundException;
import org.springframework.stereotype.Service;

/**
 * @author montreal
 * 登录系统实现类
 */
@Service
public class LoginServiceImpl implements LoginService{

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
	public void register(String username, String password,String phone) {
		User user =new User ();
		Author author=new Author();
		author.setCreatedUser(1);
		author.setCreatedTime(new Date());
		user.setNickName(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setType(3);
		user.setAuthor(author);
		userDao.insert(user);
	}



}
