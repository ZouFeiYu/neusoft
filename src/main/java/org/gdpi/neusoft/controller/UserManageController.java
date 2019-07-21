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
import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.service.UserManageService;
import org.gdpi.neusoft.util.Power;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("#{path.admin}")
public class UserManageController extends BaseAdminController {
	@Resource
	UserManageService userManageService;

	/**
	 * 后台用户列表页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.userListPage}")
	public String userLisrPage(HttpServletRequest request) {
		if (!Power.hasSelectUser(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		List<Integer> type = new ArrayList<>();
		type.add(3);
		List<Integer> state = new ArrayList<>();
		state.add(1);
		state.add(0);
		request.setAttribute("userList", userManageService.selectAll(type, state));
		request.setAttribute("userCount", userManageService.countAll(type, state));
		return "admin/user-list";
	}

	/**
	 * 后台用户信息详情页面
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.userShowPage}")
	public String userShowPage(@PathVariable("id") Integer id, HttpServletRequest request) {
		if (!Power.hasSelectUser(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		User thisUser = userManageService.selectById(id);
		User createdUser = userManageService.selectById(thisUser.getAuthor().getCreatedUser());
		User modifyUserime = userManageService.selectById(thisUser.getAuthor().getModifyUser());
		request.setAttribute("thisUser", thisUser);
		request.setAttribute("createdUser", createdUser);
		request.setAttribute("modifyUser", modifyUserime);
		return "admin/user-show";
	}

	/**
	 * 后台添加用户页面
	 * 
	 * @return
	 */
	@RequestMapping("/#{path.addUserPage}")
	public String addUserPage(HttpSession session) {
		if (Power.hasAddUser(super.getPower(session))) {
			return "admin/user-add";
		} else {
			return "admin/error-not-power";
		}
	}

	/**
	 * 后台添加用户事件
	 * 
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.addUser}")
	@ResponseBody
	public AskResult<Void> addUser(User user, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasAddUser(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限!");
			return result;
		}
		User dbUser = userManageService.selectByNickName(user.getNickName());
		if (dbUser != null && dbUser.getId() != user.getId()) {
			result = new AskResult<>(0, "该用户昵称已被占用");
			return result;
		}
		user.setType(3);
		Author author = super.getAuthor(session);
		author.setCreatedTime(new Date());
		author.setCreatedUser(super.getAdmin(session).getId());
		user.setAuthor(author);

		userManageService.addUser(user);
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
	@RequestMapping("#{path.updateUserState}")
	@ResponseBody
	public AskResult<Void> updateUserState(Integer[] id, Integer state, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasUpdateUser(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		@SuppressWarnings({ "rawtypes", "unchecked" })
		List<Integer> ids = new ArrayList(Arrays.asList(id));
		if (ids.contains(1)) {
			Integer i = 1;
			ids.remove(i);
			if (ids.size() > 0) {
				userManageService.updateState(ids, state, super.getAdmin(session).getId());
				result = new AskResult<>(1, "更新成功,超级管理员不可进行该操作");
			} else {
				result = new AskResult<>(0, "超级管理员不可进行该操作");
			}
		} else {
			userManageService.updateState(ids, state, super.getAdmin(session).getId());
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
	@RequestMapping("#{path.updateUserInfoPage}")
	public String updateUserInfoPage(@PathVariable("id") Integer id, HttpServletRequest request) {
		if (!Power.hasSelectUser(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		User user = userManageService.selectById(id);
		request.setAttribute("thisUser", user);
		return "admin/user-update";
	}

	/**
	 * 更新用户信息事件
	 * 
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.updateUserInfo}")
	@ResponseBody
	public AskResult<Void> updateUserInfo(User user, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasUpdateUser(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		User dbUser = userManageService.selectByNickName(user.getNickName());
		if (dbUser != null && dbUser.getId() != user.getId()) {
			result = new AskResult<>(0, "该用户昵称已被占用");
			return result;
		}
		user.setAuthor(super.getAuthor(session));
		userManageService.updateInfo(user);
		result = new AskResult<>(1, "更新成功");
		return result;
	}

	/**
	 * 更新用户密码页面
	 * 
	 * @param id
	 *            用户ID
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.updateUserPassPage}")
	public String upadteUserPassPage(@PathVariable("id") Integer id, HttpServletRequest request) {
		request.setAttribute("thisUser", userManageService.selectById(id));
		return "admin/user-pass-update";
	}

	/**
	 * 更新密码事件
	 * 
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.updateUserPass}")
	@ResponseBody
	public AskResult<Void> upadteUserPass(User user, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasUpdateUser(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		if (user.getPassword() == null || "".equals(user.getPassword())) {
			result = new AskResult<>(0, "密码为空,不做修改");
			return result;
		}
		user.setAuthor(super.getAuthor(session));
		userManageService.updateInfo(user);
		result = new AskResult<>(1, "修改成功");
		return result;
	}
	
	/**
	 * 后台已删除的用户页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.userDelPage}")
	public String userDelPage(HttpServletRequest request) {
		if (!Power.hasSelectUser(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		List<Integer> type = new ArrayList<>();
		type.add(3);
		List<Integer> state = new ArrayList<>();
		state.add(-1);
		request.setAttribute("userCount", userManageService.countAll(type, state));
		request.setAttribute("userList", userManageService.selectAll(type, state));
		return "admin/user-del-list";
	}
	
	/**
	 * 删除用户事件
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.deleteUser}")
	@ResponseBody
	public AskResult<Void> deleteUser(Integer[] id, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasDeleteUser(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		@SuppressWarnings({ "rawtypes", "unchecked" })
		List<Integer> ids = new ArrayList(Arrays.asList(id));
		if (ids.contains(1)) {
			Integer i = 1;
			ids.remove(i);
			if (ids.size() > 0) {
				userManageService.delete(ids);
				result = new AskResult<>(1, "删除成功,超级管理员无法删除");
			} else {
				result = new AskResult<>(0, "超级管理员不可删除");
			}
		} else {
			userManageService.delete(ids);
			result = new AskResult<>(1, "删除成功");
		}
		return result;
	}
}
