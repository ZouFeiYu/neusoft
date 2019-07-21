package org.gdpi.neusoft.service;

import java.util.List;

import org.gdpi.neusoft.bean.Good;

public interface GoodsManageService {

	List<Good> selectAll(List<Integer> state);

	Integer countAll(List<Integer> state);

	Good selectById(Integer id);

	void addGoods(Good goods);

	void updateState(List<Integer> ids, Integer state, Integer id);

	void updateInfo(Good goods);

	void delete(List<Integer> ids);

	Good selectByName(String name);

}
