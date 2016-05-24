package com.ihelin.book.controller;

import org.springframework.stereotype.Controller;

import com.ihelin.book.db.entity.Account;
import com.ihelin.book.utils.RequestUtil;

@Controller
public class BaseController {

	protected static final int PAGE_LENGTH = 10;

	protected String AdminFtl(String url) {
		return "admin/" + url;
	}

	protected String UserFtl(String url) {
		return "user/" + url;
	}

	protected Account getAccount() {
		return (Account) RequestUtil.getSession().getAttribute("account");
	}
}
