package org.gdpi.neusoft.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.gdpi.neusoft.bean.AskResult;
import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.Category;
import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.service.CategoryManageService;
import org.gdpi.neusoft.service.CategoryService;
import org.gdpi.neusoft.service.UserManageService;
import org.gdpi.neusoft.util.Power;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("#{path.admin}")
public class CategoryManageController extends BaseAdminController {
	@Resource
	CategoryManageService categoryManageService;
	@Resource
	UserManageService userManageService;

	@RequestMapping("#{path.categoryListPage}")
	public String categoryListPage(HttpServletRequest request) {
		if (!Power.hasSelectCategory(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		List<Integer> status =new ArrayList<>();
		status.add(1);
		status.add(0);
		request.setAttribute("categoryList", JSONArray.fromObject(categoryManageService.selectAll(status)));
		return "admin/category-list";
	}

	@RequestMapping("#{path.categoryShowPage}") 
	public String categoryShowPage(HttpServletRequest request, @PathVariable("id") Integer id) {
		if (!Power.hasSelectCategory(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		Category category=categoryManageService.selectById(id);
		request.setAttribute("thisCategory",category);
		User createdUser = userManageService.selectById(category.getAuthor().getCreatedUser());
		User modifyUserime = userManageService.selectById(category.getAuthor().getModifyUser());
		request.setAttribute("thisAdmin", category);
		request.setAttribute("createdUser", createdUser);
		request.setAttribute("modifyUser", modifyUserime);
		return "admin/category-show";
	}
	
	@RequestMapping("#{path.categoryAddPage}")
	public String categoryAddPage(Integer parentId,HttpServletRequest request){
		if (!Power.hasAddCategory(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		request.setAttribute("parentID", parentId);
		return "admin/category-add";
	}
	
	@RequestMapping("#{path.categoryAdd}")
	@ResponseBody
	public AskResult<Void> categoryAdd(Category category,HttpServletRequest request){
		AskResult<Void> result=null;
		if (!Power.hasAddCategory(super.getPower(request.getSession()))) {
			result=new AskResult<>(0, "你没有该权限");
			return result;
		}
		Author author=new Author();
		author.setCreatedTime(new Date());
		author.setCreatedUser(super.getAdmin(request.getSession()).getId());
		category.setAuthor(author);
		category.setStatus(1);
		categoryManageService.add(category);
		result=new AskResult<>(1, "添加成功");
		return result;
	}
	
	@RequestMapping("#{path.categoryUpdatePage}")
	public String categoryUpdatePage(Integer id,HttpServletRequest request){
		if (!Power.hasUpdateCategory(super.getPower(request.getSession()))) {
			return "admin/error-not-power";
		}
		request.setAttribute("thisCategory", categoryManageService.selectById(id));
		return "admin/category-update";
	}
	
	@RequestMapping("#{path.categoryUpdate}")
	@ResponseBody
	public AskResult<Void> categoryUpdate(Category category,HttpServletRequest request){
		AskResult<Void> result=null;
		if (!Power.hasUpdateCategory(super.getPower(request.getSession()))) {
			result=new AskResult<>(0, "你没有该权限");
			return result;
		}
		category.setAuthor(super.getAuthor(request.getSession()));
		categoryManageService.update(category);
		result=new AskResult<>(1, "更新成功");
		return result;
	}
	
	@RequestMapping("#{path.categoryUpdateState}")
	@ResponseBody
	public AskResult<Void> categoryUpdateState(Category category,HttpServletRequest request){
		AskResult<Void> result=null;
		if (!Power.hasUpdateCategory(super.getPower(request.getSession()))) {
			result=new AskResult<>(0, "你没有该权限");
			return result;
		}
		category.setAuthor(super.getAuthor(request.getSession()));
		categoryManageService.update(category);
		result=new AskResult<>(1, "更新成功");
		return result;
	}
	
}
