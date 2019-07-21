package org.gdpi.neusoft.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.dao.GoodsDao;
import org.springframework.stereotype.Service;

@Service
public class GoodsManageServiceImpl implements GoodsManageService {
	@Resource
	GoodsDao goodsDao;

	@Override
	public List<Good> selectAll(List<Integer> state) {
		// TODO Auto-generated method stub
		return goodsDao.selectByState(null, null, state);
	}

	@Override
	public Integer countAll(List<Integer> state) {

		return goodsDao.stateCount(state);
	}

	@Override
	public Good selectById(Integer id) {
		// TODO Auto-generated method stub
		return goodsDao.selectById(id);
	}

	@Override
	public void addGoods(Good goods) {
		// TODO Auto-generated method stub
		goodsDao.insert(goods);
	}

	@Override
	public void updateState(List<Integer> ids, Integer state, Integer id) {
		// TODO Auto-generated method stub
		goodsDao.updateBatchState(ids, state, id, new Date());
	}

	@Override
	public void updateInfo(Good goods) {
		// TODO Auto-generated method stub
		goodsDao.update(goods.getId(), goods.getCategoryId(), goods.getName(), goods.getDetails(), goods.getPrice(),
				goods.getVipPrice(), goods.getImage(), goods.getCount(), goods.getOrders(), goods.getState(),
				goods.getAuthor().getModifyUser(), goods.getAuthor().getModifyTime());
	}

	@Override
	public void delete(List<Integer> ids) {
		// TODO Auto-generated method stub
		goodsDao.deleteBatch(ids);
	}

	@Override
	public Good selectByName(String name) {
		// TODO Auto-generated method stub
		return goodsDao.selectByName(name);
	}

}
