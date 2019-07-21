package org.gdpi.neusoft.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.gdpi.neusoft.bean.AskResult;
import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/main")
public class CartController extends BaseController {
	@Resource
	private CartService cartService;

	//购物车详情
	@RequestMapping("/cartPage")
	public String cartPage(HttpSession session,ModelMap map) {
		List<Good> carts = cartService.select(super.getId(session), null, null);
		map.addAttribute("carts", carts);
		return "before/udai_shopcart";
	}
	
	//商品添加到购物车
	@RequestMapping("/addCart")
	@ResponseBody
	public AskResult<Void> addCart(HttpSession session,
		Integer goodsId,@RequestParam("count") Integer count){
		//获得AskResult<Void>对象
		AskResult<Void> rr=new AskResult<Void>(1, "添加成功");
		//得到购物车中该商品的数量
		Integer cart=cartService.selectByGoodsID(super.getId(session), goodsId);
		//判断购物车中该商品是否存在
		if(cart==null){
			//购物车中该商品不存在
			cartService.insert(goodsId, super.getId(session), count);
		}else{
			//购物车中该商品存在，则修改count的值
			cartService.update(super.getId(session), goodsId, cart+count);
		}
		return rr;		
	}
		
	//单行删除
	@RequestMapping("/deleteById")
	public String deleteById(Integer goodsId,HttpSession session){
		//1.调用业务层方法
		cartService.delete(goodsId, super.getId(session));
		//2.重定向到cartPage
		return "redirect:/web/main/cartPage";
	}
	
	@RequestMapping("/updateCart.do")
	@ResponseBody
	public AskResult<Void> updateCart(HttpSession session,
			Integer id,Integer num) {
		//获得ResponseResult<Void>对象
		AskResult<Void> rr=new AskResult<Void>(1, "添加成功");
		//得到uid
		Integer uid=super.getId(session);
		cartService.update(uid, id, num);
		return rr;
	}
	
	@RequestMapping("/cartToOrder")
	public String CartToOrder(HttpSession session,Integer[] ids,ModelMap map) {
		List<Good> cart = cartService.selectByUids(super.getId(session), ids);
		Date date = new Date();
		map.addAttribute("cart", cart);
		map.addAttribute("date", date);
		return "before/udai_shopcart_pay";
	}
}
