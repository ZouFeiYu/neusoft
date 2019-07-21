package org.gdpi.neusoft.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.gdpi.neusoft.bean.AskResult;
import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.dao.UserDao;
import org.gdpi.neusoft.service.AdminInfoService;
import org.gdpi.neusoft.util.Power;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("#{path.admin}")
public class AdminInfoConteoller extends BaseAdminController {
	@Resource
	AdminInfoService adminInfoService;

	/**
	 * 后台登录页面
	 * 
	 * @return
	 */
	@RequestMapping("#{path.loginPage}")
	public String loginPage() {
		return "admin/login";
	}

	/**
	 * 后台登录事件
	 * 
	 * @param name
	 * @param password
	 * @return
	 */
	@RequestMapping("#{path.login}")
	@ResponseBody
	public AskResult<Void> login(String name, String password, HttpSession session) {
		AskResult<Void> result = null;
		if (name == null || "".equals(name)) {
			result = new AskResult<>(0, "用户名为空");
		} else if (password == null || "".equals(password)) {
			result = new AskResult<>(0, "密码为空");
		} else {
			try {
				User user = adminInfoService.loginCheck(name, password);
				if (user == null) {
					result = new AskResult<>(0, "用户不存在");
				} else if (user.getType() == 1 || user.getType() == 2) {
					if (user.getState() == -1) {
						result = new AskResult<>(0, "该用户已被删除");
					} else if (user.getState() == 0) {
						result = new AskResult<>(0, "该用户已被冻结");
					} else {
						session.removeAttribute("admin");
						session.setAttribute("admin", user);
						session.setAttribute("power", Power.format(user.getPower()));
						result = new AskResult<>(1, "登录成功");
					}
				} else {
					result = new AskResult<>(0, "你没有该权限");
				}
			} catch (RuntimeException e) {
				result = new AskResult<>(0, e.getMessage());
			}
		}
		return result;
	}

	/**
	 * 后台登出事件
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.logout}")
	public String logout(HttpSession session) {
		session.removeAttribute("admin");
		session.removeAttribute("power");
		return "redirect:/web/admin/loginPage";
	}

	/**
	 * 管理员密码修改页面
	 * 
	 * @return
	 */
	@RequestMapping("#{path.updatePasswordPage}")
	public String UpdatePasswordPage() {
		return "admin/admin-pass-update";
	}

	/**
	 * 检查密码事件
	 * 
	 * @param password
	 * @return
	 */
	@RequestMapping("#{path.checkPasword}")
	@ResponseBody
	public AskResult<Void> checkPassword(String password, HttpSession session) {
		AskResult<Void> result = null;
		User user = (User) session.getAttribute("admin");
		if (user.getPassword().equals(password)) {
			session.setAttribute("checkPassword", "true");
			result = new AskResult<>(1, "密码验证成功");
		} else {
			result = new AskResult<>(0, "密码验证失败");

		}
		return result;
	}

	/**
	 * 更新密码事件
	 * 
	 * @param password
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.updatePassword}")
	@ResponseBody
	public AskResult<Void> updatePassword(String password, HttpSession session) {
		AskResult<Void> result = null;
		String checkPassword = (String) session.getAttribute("checkPassword");
		if ("true".equals(checkPassword)) {
			User admin = (User) session.getAttribute("admin");
			User user = new User();
			user.setId(admin.getId());
			user.setPassword(password);
			user.setAuthor(super.getAuthor(session));
			adminInfoService.updatePassword(user);
			result = new AskResult<>(1, "修改密码成功");
			session.removeAttribute("admin");
			session.removeAttribute("checkPassword");
		} else {
			result = new AskResult<>(0, "非法操作");
		}
		return result;
	}

	/**
	 * 后台添加管理员页面
	 * 
	 * @return
	 */
	@RequestMapping("#{path.addAdminPage}")
	public String addAdminPage(HttpSession session) {
		if (Power.hasAddAdmin(super.getPower(session))) {
			return "admin/admin-add";
		} else {
			return "admin/error-not-power";
		}
	}

	/**
	 * 后台添加管理员事件
	 * 
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.addAdmin}")
	@ResponseBody
	public AskResult<Void> addAdmin(User user, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasAddAdmin(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限!");
			return result;
		}
		User dbUser = adminInfoService.selectByNickName(user.getNickName());
		if (dbUser != null && dbUser.getId() != user.getId()) {
			result = new AskResult<>(0, "该用户昵称已被占用");
			return result;
		}
		user.setType(2);
		Author author = super.getAuthor(session);
		author.setCreatedTime(new Date());
		author.setCreatedUser(super.getAdmin(session).getId());
		user.setAuthor(author);

		adminInfoService.addAdmin(user);
		result = new AskResult<>(1, "添加成功");
		return result;
	}

	/**
	 * 管理员列表页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.adminListPage}")
	public String adminListPage(HttpServletRequest request) {
		if (!Power.hasSelectAdmin(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		List<Integer> type = new ArrayList<>();
		type.add(1);
		type.add(2);
		List<Integer> state = new ArrayList<>();
		state.add(1);
		state.add(0);
		request.setAttribute("adminCount", adminInfoService.countAll(type, state));
		request.setAttribute("admins", adminInfoService.selectAll(type, state));
		return "admin/admin-list";
	}

	/**
	 * 后台更新管理员状态事件
	 * 
	 * @param id
	 * @param state
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.updateAdminState}")
	@ResponseBody
	public AskResult<Void> updateAdminState(Integer[] id, Integer state, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasUpdateAdmin(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		@SuppressWarnings({ "rawtypes", "unchecked" })
		List<Integer> ids = new ArrayList(Arrays.asList(id));
		if (ids.contains(1)) {
			Integer i = 1;
			ids.remove(i);
			if (ids.size() > 0) {
				adminInfoService.updateState(ids, state, super.getAdmin(session).getId());
				result = new AskResult<>(1, "更新成功,超级管理员不可进行该操作");
			} else {
				result = new AskResult<>(0, "超级管理员不可进行该操作");
			}
		} else {
			adminInfoService.updateState(ids, state, super.getAdmin(session).getId());
			result = new AskResult<>(1, "更新成功");
		}
		return result;
	}

	/**
	 * 后台权限页面
	 * 
	 * @return
	 */
	@RequestMapping("#{path.adminPowerPage}")
	public String powerPage(@PathVariable("id") Integer id, HttpServletRequest request) {
		if (!Power.hasSelectAdmin(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		User user = adminInfoService.selectById(id);
		request.setAttribute("thisAdmin", user);
		request.setAttribute("thisPower", Power.format(user.getPower()));
		return "admin/admin-power";
	}

	/**
	 * 更新管理员权限事件
	 * 
	 * @param id
	 * @param power
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.updateAdminPower}")
	@ResponseBody
	public AskResult<Void> updatePower(Integer id, Integer[] power, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasUpdateAdmin(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		if (id == 1) {
			result = new AskResult<>(0, "超级管理员无法更新权限");
		} else {
			User user = new User();
			user.setId(id);
			user.setPower(Power.format(power));
			user.setAuthor(super.getAuthor(session));
			adminInfoService.updatePower(user);
			result = new AskResult<>(1, "系统管理员无法更新权限");
		}
		return result;
	}

	/**
	 * 更新管理员信息页面
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.updateAdminInfoPage}")
	public String updateAdminInfoPage(@PathVariable("id") Integer id, HttpServletRequest request) {
		if (!Power.hasSelectAdmin(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		User user = adminInfoService.selectById(id);
		request.setAttribute("thisAdmin", user);
		return "admin/admin-update";
	}

	/**
	 * 更新管理员信息事件
	 * 
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.updateAdminInfo}")
	@ResponseBody
	public AskResult<Void> updateAdminInfo(User user, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasUpdateAdmin(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		User dbUser = adminInfoService.selectByNickName(user.getNickName());
		if (dbUser != null && dbUser.getId() != user.getId()) {
			result = new AskResult<>(0, "该用户昵称已被占用");
			return result;
		}
		user.setAuthor(super.getAuthor(session));
		adminInfoService.updateInfo(user);
		result = new AskResult<>(1, "更新成功");
		return result;
	}

	/**
	 * 后台已删除的管理员页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.adminDelPage}")
	public String adminDelPage(HttpServletRequest request) {
		if (!Power.hasSelectAdmin(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		List<Integer> type = new ArrayList<>();
		type.add(1);
		type.add(2);
		List<Integer> state = new ArrayList<>();
		state.add(-1);
		request.setAttribute("adminCount", adminInfoService.countAll(type, state));
		request.setAttribute("adminList", adminInfoService.selectAll(type, state));
		return "admin/admin-del-list";
	}

	/**
	 * 管理员详细信息页面
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("#{path.adminShowPage}")
	public String adminShowPage(@PathVariable("id") Integer id, HttpServletRequest request) {
		if (!Power.hasSelectAdmin(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		User thisAdmin = adminInfoService.selectById(id);
		User createdUser = adminInfoService.selectById(thisAdmin.getAuthor().getCreatedUser());
		User modifyUserime = adminInfoService.selectById(thisAdmin.getAuthor().getModifyUser());
		request.setAttribute("thisAdmin", thisAdmin);
		request.setAttribute("createdUser", createdUser);
		request.setAttribute("modifyUser", modifyUserime);
		return "admin/admin-show";
	}

	/**
	 * 删除管理员事件
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("#{path.deleteAdmin}")
	@ResponseBody
	public AskResult<Void> deleteAdmin(Integer[] id, HttpSession session) {
		AskResult<Void> result = null;
		if (!Power.hasDeleteAdmin(super.getPower(session))) {
			result = new AskResult<>(0, "你没有该权限");
			return result;
		}
		List<Integer> ids = new ArrayList(Arrays.asList(id));
		if (ids.contains(1)) {
			Integer i = 1;
			ids.remove(i);
			if (ids.size() > 0) {
				adminInfoService.delete(ids);
				result = new AskResult<>(1, "删除成功,超级管理员无法删除");
			} else {
				result = new AskResult<>(0, "超级管理员不可删除");
			}
		} else {
			adminInfoService.delete(ids);
			result = new AskResult<>(1, "删除成功");
		}
		return result;
	}
}
