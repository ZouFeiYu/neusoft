package org.gdpi.neusoft.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.gdpi.neusoft.bean.Category;
import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.service.CartService;
import org.gdpi.neusoft.service.CategoryService;
import org.gdpi.neusoft.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class mainController extends BaseController{
	@Resource
	CategoryService categoryService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private CartService cartService;

	@RequestMapping("/index")
	public String index(HttpServletRequest request,ModelMap map,HttpSession session) {
		List<Category> categories=categoryService.select(null, 0, 5);
		request.setAttribute("topLevel", categories);
		Map<Integer, List<Category>> map1=new HashMap<>();
		for(Category c:categories){
			Integer id=c.getId();
			List<Category> categories2=categoryService.select(id, 0, 100);
			map1.put(id, categories2);
			for(Category c3:categories2){
				id=c3.getId();
				List<Category> categories3=categoryService.select(id, 0, 100);
				map1.put(id, categories3);
			}
		} 
		request.setAttribute("childrenLevel", map1);
		
		//商品展示
		List<Good> list1 = goodsService.selectByCategoryId(categories.get(0).getId(),0,8);
		List<Good> list2 = goodsService.selectByCategoryId(categories.get(1).getId(),0,8);
		List<Good> list3 = goodsService.selectByCategoryId(categories.get(2).getId(),0,8);
		List<Good> list4 = goodsService.selectByCategoryId(categories.get(3).getId(),0,8);
		List<Good> list5 = goodsService.selectByCategoryId(categories.get(4).getId(),0,8);
		//把热卖商品放入map
		map.addAttribute("list1", list1);
		map.addAttribute("list2", list2);
		map.addAttribute("list3", list3);
		map.addAttribute("list4", list4);
		map.addAttribute("list5", list5);
		
		Integer count = cartService.count(super.getId(session));
		map.addAttribute("count", count);
		
		return "before/index";
	}
	@RequestMapping("/nonePage")
	public String nonePage(){
		return "before/error-none";
	}
}
