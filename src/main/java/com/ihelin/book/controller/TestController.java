package com.ihelin.book.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.manager.OrderManager;

@Controller
public class TestController {
	@Resource
	private OrderManager orderManager;

	@RequestMapping("test")
	public String testMy() {
		return "test";
	}

}
