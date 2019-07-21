package org.gdpi.neusoft.controller;


import javax.servlet.http.HttpSession;

import org.gdpi.neusoft.bean.User;

public class BaseController {
	//从session中或得id值 
		public Integer getId(HttpSession session){
			User user=(User)session.getAttribute("user");
			Integer id=null;
			if(user!=null){
			  id=user.getId();
			}
			return id;
		}
}
