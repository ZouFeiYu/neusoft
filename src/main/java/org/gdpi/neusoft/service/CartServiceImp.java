package org.gdpi.neusoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.dao.CartDao;
import org.springframework.stereotype.Service;

/**
 * 购物车实现类
 * 2018-12-20
 * @author 杨嘉为
 *
 */

@Service
public class CartServiceImp implements CartService {
	@Resource
	private CartDao cartDao;

	public void insert(Integer goodsID, Integer userID, Integer count) {
		cartDao.insert(goodsID, userID, count);
	}

	public void delete(Integer goodsID, Integer userID) {
		cartDao.delete(goodsID, userID);

	}

	public List<Good> select(Integer userID, Integer start, Integer count) {
		return cartDao.select(userID, start, count);
	}

	public void update(Integer userID, Integer goodsID, Integer count) {
		cartDao.update(userID, goodsID, count);
	}

	public Integer count(Integer userID) {
		return cartDao.count(userID);
	}

	public Integer selectByGoodsID(Integer userID, Integer goodsID) {
		return cartDao.selectByGoodsID(userID, goodsID);
	}

	@Override
	public List<Good> selectByUids(Integer userID, Integer[] ids) {
		return cartDao.selectByUids(userID, ids);
	}

}
