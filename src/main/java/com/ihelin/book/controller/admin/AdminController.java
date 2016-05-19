package com.ihelin.book.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.controller.BaseController;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController extends BaseController {

	@RequestMapping("index")
	public String adminIndex() {
		return "admin/index";
	}

}
