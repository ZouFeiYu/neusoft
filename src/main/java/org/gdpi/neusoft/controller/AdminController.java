package org.gdpi.neusoft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("#{path.admin}")
public class AdminController {
	/**
	 * 后台默认页面
	 * 
	 * @return
	 */
	@RequestMapping("#{path.default}")
	public String defaultPage() {
		return "admin/login";
	}

	/**
	 * 后台主页
	 * 
	 * @return
	 */
	@RequestMapping("#{path.indexPage}")
	public String indexPage() {
		return "admin/index";
	}

	/**
	 * 待开发页面
	 * 
	 * @return
	 */
	@RequestMapping("#{path.nonePage}")
	public String none() {
		return "admin/error-none";
	}
}
