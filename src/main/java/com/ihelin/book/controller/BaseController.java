package com.ihelin.book.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.ihelin.book.db.entity.Account;
import com.ihelin.book.manager.AccountManager;
import com.ihelin.book.manager.BookManager;
import com.ihelin.book.utils.RequestUtil;

@Controller
public class BaseController {
	
	@Resource
	protected AccountManager accountManager;
	@Resource
	protected BookManager bookManager;

	protected static final int PAGE_LENGTH = 10;

	protected String AdminFtl(String url) {
		return "admin/" + url;
	}

	protected String UserFtl(String url) {
		return "user/" + url;
	}
	
	protected Account getAdmin() {
		return (Account) RequestUtil.getSession().getAttribute("admin");
	}

	protected Account getAccount() {
		return (Account) RequestUtil.getSession().getAttribute("account");
	}
}
