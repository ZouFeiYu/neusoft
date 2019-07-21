package org.gdpi.neusoft.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.gdpi.neusoft.bean.AskResult;
import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.service.AdminInfoService;
import org.gdpi.neusoft.service.GoodsManageService;
import org.gdpi.neusoft.util.Power;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("#{path.admin}")
public class GoodsManageController extends BaseAdminController{
	@Resource
	GoodsManageService goodsManageService;

	/**
	 * 后台商品列表页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.goodsListPage}")
	public String GoodsLisrPage(HttpServletRequest request) {
		if (!Power.hasSelectGoods(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		List<Integer> state = new ArrayList<>();
		state.add(1);
		state.add(0);
		request.setAttribute("goodsList", goodsManageService.selectAll(state));
		request.setAttribute("goodsCount", goodsManageService.countAll(state));
		return "admin/goods-list";
	}

	/**
	 * 后台用户信息详情页面
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.goodsShowPage}")
	public String GoodsShowPage(@PathVariable("id") Integer id, HttpServletRequest request) {
		if (!Power.hasSelectGoods(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		Good thisGoods = goodsManageService.selectById(id);
		Good createdGoods = goodsManageService.selectById(thisGoods.getAuthor().getCreatedUser());
		Good modifyGoodsime = goodsManageService.selectById(thisGoods.getAuthor().getModifyUser());
		request.setAttribute("thisGoods", thisGoods);
		request.setAttribute("createdGoods", createdGoods);
		request.setAttribute("modifyGoods", modifyGoodsime);
		return "admin/goods-show";
	}

	/**
	 * 后台添加用户页面
	 * 
	 * @return
	 */
	@RequestMapping("/#{path.addGoodsPage}")
	public String addGoodsPage(HttpSession session) {
		if (Power.hasAddGoods(super.getPower(session))) {
			return "admin/goods-add";
		} else {
			return "admin/error-not-power";
		}
	}

	/**
	 * 后台添加用户事件
	 * 
	 * @param Goods
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.addGoods}")
	@ResponseBody
	public AskResult<Void> addGoods(Good Goods, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasAddGoods(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限!");
			return result;
		}
		Good dbGoods = goodsManageService.selectByName(Goods.getName());
		if (dbGoods != null && dbGoods.getId() != Goods.getId()) {
			result = new AskResult<>(0, "该用户昵称已被占用");
			return result;
		}
		Author author = super.getAuthor(session);
		author.setCreatedTime(new Date());
		author.setCreatedUser(super.getAdmin(session).getId());
		Goods.setAuthor(author);

		goodsManageService.addGoods(Goods);
		result = new AskResult<>(1, "添加成功");
		return result;
	}

	/**
	 * 后台更新用户状态事件
	 * 
	 * @param id
	 * @param state
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.updateGoodsState}")
	@ResponseBody
	public AskResult<Void> updateGoodsState(Integer[] id, Integer state, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasUpdateGoods(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		@SuppressWarnings({ "rawtypes", "unchecked" })
		List<Integer> ids = new ArrayList(Arrays.asList(id));
		if (ids.contains(1)) {
			Integer i = 1;
			ids.remove(i);
			if (ids.size() > 0) {
				goodsManageService.updateState(ids, state, super.getAdmin(session).getId());
				result = new AskResult<>(1, "更新成功,超级管理员不可进行该操作");
			} else {
				result = new AskResult<>(0, "超级管理员不可进行该操作");
			}
		} else {
			goodsManageService.updateState(ids, state, super.getAdmin(session).getId());
			result = new AskResult<>(1, "更新成功");
		}
		return result;
	}

	/**
	 * 更新用户信息页面
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.updateGoodsInfoPage}")
	public String updateGoodsInfoPage(@PathVariable("id") Integer id, HttpServletRequest request) {
		if (!Power.hasSelectGoods(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		Good Goods = goodsManageService.selectById(id);
		request.setAttribute("thisGoods", Goods);
		return "admin/Goods-update";
	}

	/**
	 * 更新用户信息事件
	 * 
	 * @param Goods
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.updateGoodsInfo}")
	@ResponseBody
	public AskResult<Void> updateGoodsInfo(Good Goods, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasUpdateGoods(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		Good dbGoods = goodsManageService.selectByName(Goods.getName());
		if (dbGoods != null && dbGoods.getId() != Goods.getId()) {
			result = new AskResult<>(0, "该用户昵称已被占用");
			return result;
		}
		Goods.setAuthor(super.getAuthor(session));
		goodsManageService.updateInfo(Goods);
		result = new AskResult<>(1, "更新成功");
		return result;
	}

	

	
	/**
	 * 后台已删除的用户页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.goodsDelPage}")
	public String GoodsDelPage(HttpServletRequest request) {
		if (!Power.hasSelectGoods(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		List<Integer> state = new ArrayList<>();
		state.add(-1);
		request.setAttribute("goodsCount", goodsManageService.countAll(state));
		request.setAttribute("goodsList", goodsManageService.selectAll(state));
		return "admin/goods-del-list";
	}
	
	/**
	 * 删除用户事件
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.deleteGoods}")
	@ResponseBody
	public AskResult<Void> deleteGoods(Integer[] id, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasDeleteGoods(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		@SuppressWarnings({ "rawtypes", "unchecked" })
		List<Integer> ids = new ArrayList(Arrays.asList(id));
		if (ids.contains(1)) {
			Integer i = 1;
			ids.remove(i);
			if (ids.size() > 0) {
				goodsManageService.delete(ids);
				result = new AskResult<>(1, "删除成功,超级管理员无法删除");
			} else {
				result = new AskResult<>(0, "超级管理员不可删除");
			}
		} else {
			goodsManageService.delete(ids);
			result = new AskResult<>(1, "删除成功");
		}
		return result;
	}
}
