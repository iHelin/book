package com.ihelin.book.controller;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.manager.OrderManager;

@Controller
public class TestController {
	@Resource
	private OrderManager orderManager;

	@RequestMapping("test")
	public String testMy(HttpSession session) {
		ServletContext context = session.getServletContext();
		Integer count = (Integer) context.getAttribute("count");
		System.out.println(count);
		return "test";
	}

}
