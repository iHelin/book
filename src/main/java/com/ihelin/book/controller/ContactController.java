package com.ihelin.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContactController {

	@RequestMapping("contact")
	public String handleContact(){
		return "contact";
	}
}
