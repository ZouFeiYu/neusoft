package org.gdpi.neusoft.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.gdpi.neusoft.bean.Address;
import org.gdpi.neusoft.bean.Good;
import org.gdpi.neusoft.bean.Order;
import org.gdpi.neusoft.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/main")
public class OrderController extends BaseController{
	@Resource
	private OrderService orderService;
	
	@RequestMapping("/ordersPage/{userId}")
	public String showOrders(ModelMap map,HttpSession session,
			@RequestParam("page")Integer page) {
			if(page==null||page==0) {
		 		page=1;
		 	}
			Integer userId=getId(session);
			Integer count=10;
			Integer start=(page-1)*count;
			Integer allCount=orderService.selectCountByUserId(userId);	
			Integer pageSize=allCount%count==0?allCount/count:allCount/count+1;
			List<Order>orders=orderService.showOrdersByUserId(userId, start, count);
			map.addAttribute("orders", orders);
			map.addAttribute("page", page);
			map.addAttribute("pageSize", pageSize);
			map.addAttribute("counts", allCount);
			return "before/udai_order";
	}
	
	@RequestMapping("/orderDetailPage/{userId}")
	public String orderDetail(ModelMap map,HttpSession session,
			@RequestParam("orderId")String orderId) {
		Order order=orderService.selectByOrderId(orderId);
		List<Good>goodses=order.getGoods();
		map.addAttribute("order", order);
		map.addAttribute("goodses", goodses);
		return "before/udai_order_detail";
	}
}
