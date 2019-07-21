package org.gdpi.neusoft.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.util.Power;

public class BaseAdminController {
	/**
	 * 返回当前登录的管理员
	 * @param session
	 * @return
	 */
	public User getAdmin(HttpSession session) {
		return (User) session.getAttribute("admin");
	}
	/**
	 * 返回作者
	 * @param session
	 * @return
	 */
	public Author getAuthor(HttpSession session) {
		Author author=new Author();
		author.setModifyUser(getAdmin(session).getId());
		author.setModifyTime(new Date());
		return author;
	}
	/**
	 * 返回当前管理员的权限
	 * @param session
	 * @return
	 */
	public List<Integer> getPower(HttpSession session){
		return new ArrayList((List<Integer>)session.getAttribute("power"));
	}
}
