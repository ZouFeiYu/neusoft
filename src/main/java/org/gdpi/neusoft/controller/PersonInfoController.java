package org.gdpi.neusoft.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.service.PersonInfoService;
import org.gdpi.neusoft.bean.Address;
import org.gdpi.neusoft.bean.AskResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author montreal
 * 个人信息管理controller
 */
@Controller
@RequestMapping("/main")
public class PersonInfoController extends BaseController {
	@Resource
	private PersonInfoService personInfoService;
	
	/**
	 * 个人信息主页
	 * @param userId 用户id
	 * @param map 
	 * @return
	 */
	@RequestMapping("/welcomePage/{userId}")
	public String welcomePage(ModelMap map,HttpSession session) {
		try {
			Integer id= this.getId(session);
			if(id!=null) {
				User user=	personInfoService.showPersonInfo(id);
				map.addAttribute("user", user);
			}
		} catch (Exception e) {
			throw  e;
		}
		return "before/udai_welcome";
	}
	
	/**
	 * 个人信息修改页面
	 * @param userId
	 * @param map
	 * @return
	 */
	@RequestMapping("/personPage/{userId}")
	public String personPage(@PathVariable("userId")String userId,ModelMap map) {
		try {
			User user=	personInfoService.showPersonInfo(Integer.valueOf(userId));
			map.addAttribute("user", user);
			System.out.println(user.getIdCard());
		} catch (Exception e) {
			throw  e;
		}
		return "before/udai_setting";
	}
	
	/**
	 * 用户信息修改
	 * @param id 用户id
	 * @param username 用户名
	 * @param name 用户姓名
	 * @param phone 手机号码
	 * @param email 邮箱
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/person/{userId}")
	public AskResult<Void> person(HttpSession session,
			@RequestParam("id")Integer id,@RequestParam("username")String username,
			@RequestParam("name")String name,@RequestParam("phone")String phone,
			@RequestParam("email")String email) {
		AskResult<Void>ar=null;
		try {
			personInfoService.updatePersonInfo(id, username, name, phone, email);
			ar=new AskResult<Void>(1,"修改成功");
		} catch (Exception e) {
			ar=new AskResult<Void>(0,"修改失败");
		}
		return ar;
	}
	
	/**
	 * 跳转修改登录改码页面
	 * @return
	 */
	@RequestMapping("/passwordPage/{userId}")
	public String passwordPage() {
		return "before/udai_pwd_modify";
	}
	
	/**
	 * 跳转输入旧登录密码页面
	 * @return
	 */
	@RequestMapping("/oldPwdPage/{userId}")
	public String oldPwdPage(){
		return "before/udai_modifypwd_step1";
	}
	
	/**
	 * 校验旧密码
	 * @param id 用户id
	 * @param oldPwd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkOldPwd/{userId}")
	public AskResult<Void> checkOldPwd(
			@RequestParam("id")Integer id,@RequestParam("oldPwd")String oldPwd) {
		AskResult<Void>ar=null;
		Integer i= personInfoService.checkOldPwd(id, oldPwd);
		if(i==1) {
			ar=new AskResult<Void>(1, "密码输入正确");
		}else {
			ar=new AskResult<Void>(0, "密码输入错误");
		}
		return ar;
	}
	
	/**
	 * 跳转输入新密码页面
	 * @return
	 */
	@RequestMapping("/newPwdPage/{userId}")
	public String newPwdPage() {
		return "before/udai_modifypwd_step2";
	}
	
	/**
	 * 校验修改新密码
	 * @param id 用户id
	 * @param newPwd 新密码
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkNewPwd/{userId}")
	public AskResult<Void> checkNewPwd(
			@RequestParam("id")Integer id,@RequestParam("newPwd")String newPwd){
		AskResult<Void>ar=null;
		Integer i= personInfoService.checkNewPwd(id, newPwd);
		if(i==0) {
			ar=new AskResult<Void>(1, "密码输入正确");
		}else {
			ar=new AskResult<Void>(0, "密码输入错误");
		}
		return ar;
	}
	
	/**
	 * 跳转修改密码完成页面
	 * @param session
	 * @return
	 */
	@RequestMapping("/reLoginPage/{userId}")
	public String reLoginPage(HttpSession session){
		session.invalidate();
		return"before/udai_modifypwd_step3";
	}
	
	/**
	 * 跳转地址页面
	 * @return
	 */
	@RequestMapping("/addressPage/{userId}")
	public String addressPage( ModelMap map,HttpSession session) {
		 Integer userId=getId(session);
		 List<Address> addresses= personInfoService.selectAddressByUserId(Integer.valueOf(userId));
		 map.addAttribute("addresses", addresses);
		return "before/udai_address";
	}
	
	/**
	 * 添加地址
	 * @param userId	用户id
	 * @param recName 收件人姓名
	 * @param detail 地址详情
	 * @param phone 手机号码
	 * @param telphone 电话号码
	 * @return ar
	 */
	@ResponseBody
	@RequestMapping("/insertAddress/{userId}")
	public AskResult<Void>insertAddress(
			@RequestParam("userId")Integer userId,@RequestParam("recName")String recName,
			@RequestParam("detail")String detail,@RequestParam("phone")String phone,
			@RequestParam("telphone")String telphone,@RequestParam("recDefault")Integer recDefault){
		AskResult<Void>ar=null;
		try {
			personInfoService.insertAddress(userId, recName, detail, phone, telphone,recDefault);
			ar=new AskResult<Void>(1, "添加地址成功");
		} catch (Exception e) {
			ar=new AskResult<Void>(0, "添加地址失败");
		}
		return ar;
	}
	
	/**
	 * 添加地址
	 * @param userId	用户id
	 * @param recName 收件人姓名
	 * @param detail 地址详情
	 * @param phone 手机号码
	 * @param telphone 电话号码
	 * @return ar 
	 */
	@ResponseBody
	@RequestMapping("/updateAddress/{userId}")
	public AskResult<Void>updateAddress(
			@RequestParam("id")Integer id,
			@RequestParam("userId")Integer userId,@RequestParam("recName")String recName,
			@RequestParam("detail")String detail,@RequestParam("phone")String phone,
			@RequestParam("telphone")String telphone,@RequestParam("recDefault")Integer recDefault){
		AskResult<Void>ar=null;
		try {
			personInfoService.updateAddress(id, userId, recName, detail, phone, telphone, recDefault);
			ar=new AskResult<Void>(1, "修改地址成功");
		} catch (Exception e) {
			ar=new AskResult<Void>(0, "修改地址失败");
		}
		return ar;
	}
	
	/**
	 * 设置默认地址
	 * @param userId 用户id
	 * @param id 地址id
	 * @return 重定向到addressPage
	 */
	@RequestMapping("/setDefaultAddress/{userId}")
	public String  setDefaultAddress(
			@RequestParam("userId")Integer userId,@RequestParam("id")Integer id){
		AskResult<Void>ar=null;
		try {
			personInfoService.setDefaultAddress(userId, id);
			ar=new AskResult<Void>(1, "设置成功");
			return "redirect:/web/main/addressPage/"+userId;
		} catch (Exception e) {
			ar=new AskResult<Void>(0, "设置失败");
			return "redirect:/web/main/addressPage/"+userId;
		}
	}
	
	@RequestMapping("/deleteAddress/{userId}")
	public String deleteAddress(
			@RequestParam("userId")Integer userId,@RequestParam("id")Integer id){
		try {
			personInfoService.deleteAddress( id);
			return "redirect:/web/main/addressPage/"+userId;
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/web/main/addressPage/"+userId;
		}
	}
	
	@RequestMapping("/updateAddressPage/{userId}")
	public String updateAddressPage(ModelMap map,
			@RequestParam("id")Integer id,@RequestParam("userId")Integer userId) {
		Address address= personInfoService.selectAddressById(id);
		List<Address> addresses= personInfoService.selectAddressByUserId(userId);
		map.addAttribute("addresses", addresses);
		map.addAttribute("address", address);
		return "before/udai_address_edit";
	}
//	
//	@ResponseBody
//	@RequestMapping("/updateAddress/{userId}")
//	public AskResult<Void> updateAddress(){
//	    AskResult<Void> ar=null;
//		
//		return ar;
//	}
}
