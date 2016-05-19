package com.ihelin.book.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
	
	@RequestMapping("index")
	public String adminIndex(){
		return "admin/index";
	}

}
