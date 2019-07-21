package org.gdpi.neusoft.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("admin") == null) {
			reDirect(request, response);
			return false;
		} else {
			return true;
		}
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

	private void reDirect(HttpServletRequest request, HttpServletResponse response) {
		// 获取当前请求的路径
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath();
		// 如果request.getHeader("X-Requested-With")返回的是XMLHttpRequest说明就是ajax请求，需要特殊处理
		if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
			// 告诉ajax我是重定向
			response.setHeader("REDIRECT", "REDIRECT");
			// 告诉ajax我重定向的路径
			response.setHeader("CONTENTPATH", basePath + "/web/admin/loginPage");
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
		} else {
			try {
				response.sendRedirect(basePath + "/web/admin/loginPage");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
