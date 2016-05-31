package com.ihelin.book.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminAuthInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		if (isIgnoredUri(uri)) {
			return true;
		}
		Object obj = null;
		if (session.getAttribute("admin") != null) {
			obj = session.getAttribute("admin");
		}
		if (obj == null) {
			String path = request.getContextPath();
			String from = request.getServletPath();
			String queryStr = request.getQueryString();
			if (from.endsWith("/login")) {
				return true;
			}
			if (!StringUtils.isEmpty(queryStr)) {
				from = from + "?" + URLEncoder.encode(queryStr, "UTF-8");
			}
			if (from.endsWith("/login"))
				from = "";
			response.sendRedirect(path + "/admin/login?from=" + from);
			return false;
		}
		return true;
	}

	protected boolean isIgnoredUri(String uri) {
		return uri.matches(".+(?i)(login|logout|400|403|404|500)+");
	}
}
