package com.ihelin.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("register")
	public String pageRegister(){
		return "register";
	}

}
