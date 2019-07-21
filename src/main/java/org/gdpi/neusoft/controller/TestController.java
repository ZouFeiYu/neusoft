package org.gdpi.neusoft.controller;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.gdpi.neusoft.bean.AskResult;
import org.gdpi.neusoft.bean.Category;
import org.gdpi.neusoft.dao.CategoryDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
@Controller
public class TestController {
	@Resource
	CategoryDao c;
	@RequestMapping("/test/{path}")
	public String toPath(@PathVariable("path")String path) throws Exception {

		return "admin/"+path;
	}
	@RequestMapping("/test/sub/form")
	@ResponseBody
	public AskResult<Void> form(int[] id,Integer state){
		System.out.println(Arrays.toString(id));
		System.out.println(state);
		AskResult< Void> result=new AskResult<>(1, "OK");
		return result;
	}
	@RequestMapping("/t/product-category")
	public String p(HttpServletRequest request) {
		request.setAttribute("c", JSONArray.fromObject(c.selectAll(0, 9999)));
		System.out.println(JSONArray.fromObject(c.selectAll(0, 9999)));
		return "admin/product-category";
	}
	
}
