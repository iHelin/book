package com.ihelin.book.controller;

import com.ihelin.book.db.entity.Account;
import com.ihelin.book.manager.AccountManager;
import com.ihelin.book.manager.BookManager;
import com.ihelin.book.manager.OrderManager;
import com.ihelin.book.utils.RequestUtil;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class BaseController {

    @Resource
    protected AccountManager accountManager;
    @Resource
    protected BookManager bookManager;
    @Resource
    protected OrderManager orderManager;

    protected static final int PAGE_LENGTH = 10;
    protected static final int MAX_LENGTH = 1000;
    protected static final String DEFAULT_BOOK_IMG = "/images/default/default_book.jpg";
    protected static final String DEFAULT_ACCOUNT_IMG = "/images/default/default_icon.jpg";


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
