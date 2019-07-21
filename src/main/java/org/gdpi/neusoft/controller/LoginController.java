package org.gdpi.neusoft.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.service.LoginService;
import org.gdpi.neusoft.bean.AskResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author montreal
 * 登录系统controller
 */
@Controller
@RequestMapping("/main")
public class LoginController {
	@Resource
	private LoginService loginService;
	
	/**
	 * 注册界面跳转
	 * @param map
	 * @return register  
	 */
	@RequestMapping("/registerPage")
	public String toRegister(ModelMap map ) {
		String register="register";
		map.addAttribute("pagetype", register);
		return "before/login";
	}
	
	/**
	 * 用户名检验
	 * @param username 用户名
	 * @return rr 
	 */
	@RequestMapping("/checkUserName")
	@ResponseBody
	public AskResult<Void>checkName(String username){
		AskResult<Void> rr=null;
		 User user= loginService.selectByName(username);
		 if (user!=null) {
			 rr=new AskResult<Void>(0, "用户名已经存在");
		 }else {
			 rr=new AskResult<Void>(1, "用户名可用");
		 }
		return rr;
	}
	
	/**
	 * 用户注册
	 * @param username 用户名
	 * @param phone 手机号
	 * @param password 密码
	 * @return                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
	 */
	@ResponseBody
	@RequestMapping("/register")
	public AskResult<Void>register(
			@RequestParam("username")String username,
			@RequestParam("phone")String phone,
			@RequestParam("password")String password){
		AskResult< Void>rr=null;
		User user= loginService.selectByName(username);
		if(user==null) {
			loginService.register(username, password, phone);
			rr=new AskResult<Void>(1, "注册成功");
		}else {
			rr=new AskResult<Void>(1, "注册失败");
		}
		return rr;
	}
	
	/**
	 * 登录界面跳转
	 * @return
	 */
	@RequestMapping("/loginPage")
	public String toLogin() {
		return "before/login";
	}
	
	/**
	 * 用户登录
	 * @param session
	 * @param username 用户名
	 * @param password 用户密码
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/login")
	public AskResult<Void> login(HttpSession session,
			@RequestParam("username")String username,
			@RequestParam("password") String password) {
		AskResult<Void>rr =null;
		try {
				User user= loginService.login(username, password);
				rr=new AskResult<Void>(1,"登录成功");	
				session.setAttribute("user", user);
		} catch (RuntimeException e) {
			rr =new AskResult<Void>(0, "登录失败");
		}
		return rr;
	}
	
	/**
	 * 退出登录
	 * @param session 用户session
	 * @return
	 */
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session) {
		session.invalidate();
		return "redirect:/web/main/index";
	}
}
