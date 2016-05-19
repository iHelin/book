package com.ihelin.book.controller;

import org.springframework.stereotype.Controller;

@Controller
public class BaseController {
	
	protected static final int PAGE_LENGTH = 10;
	
	protected String AdminFtl(String url){
		return "admin/"+url;
	}

	protected String UserFtl(String url){
		return "user/"+url;
	}
}
