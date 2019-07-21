package org.gdpi.neusoft.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.service.CartService;
import org.gdpi.neusoft.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/main")
public class GoodsController extends BaseController {
	@Resource
	private GoodsService goodsService;
	@Resource
	private CartService cartService;
	
	//显示商品详情
	@RequestMapping("/detailsPage")
	public String detailsPage(Integer id,ModelMap map,HttpSession session) {
		//调用业务方法，getById(id)返回Good对象
		Good good=goodsService.selectById(id);
		map.addAttribute("good", good);
		Integer count = cartService.count(super.getId(session));
		map.addAttribute("count", count);
		//把Good对象转发到item_show.jsp
		return "before/item_show";
	}
	
	//进入到根据关键字模糊查找商品页面
	@RequestMapping("/searchGoods")
	public String searchGoods(@RequestParam("name") String name,
			Integer page,ModelMap map,HttpSession session) throws Exception{
		//第一页显示
		if(page == null) {
			page = 1;
		}else {
			if(name.equals(new String(name .getBytes("iso8859-1"),"iso8859-1"))){
				name = new String(name .getBytes("iso8859-1"),"utf-8");				
			}
			/*System.out.println(name);
			System.out.println(name);*/
		}
		//offset每页第一条数据的下标
		Integer offset = (page - 1) * 8;
		//得到商品数量
		Integer counts = goodsService.selectCount(name);
		//得到总页数
		Integer pageSize = counts%8 == 0 ? counts/8:counts/8+1;
		List<Good> list = goodsService.selectLike(name, offset, 8);
		map.addAttribute("list", list);
		map.addAttribute("counts", counts);
		map.addAttribute("pageSize", pageSize);
		map.addAttribute("name", name);
		map.addAttribute("page", page);
		Integer count = cartService.count(super.getId(session));
		map.addAttribute("count", count);
		return "before/search_goods";
	}

}
