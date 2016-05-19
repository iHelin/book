package com.ihelin.book.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.db.entity.Account;
import com.ihelin.book.filed.AccountType;
import com.ihelin.book.manager.AccountManager;
import com.ihelin.book.utils.CryptUtil;
import com.ihelin.book.utils.ResponseUtil;

@Controller
public class LoginController {

	@Resource
	private AccountManager accountManager;

	@RequestMapping("login")
	public String pageLogin(String from,Model model) {
		model.addAttribute("from", from);
		return "login";
	}

	@RequestMapping("login.do")
	public void doLogin(String email, String password, HttpServletResponse response, HttpSession session) {
		Account account = accountManager.selectAccountByEmail(email);
		if (account == null) {
			ResponseUtil.writeFailedJSON(response, "empty");
			return;
		}
		if (!CryptUtil.sha1(password).equals(account.getPassword())) {
			ResponseUtil.writeFailedJSON(response, "failed");
			return;
		}
		session.setAttribute("account", account);
		ResponseUtil.writeSuccessJSON(response);
	}

	@RequestMapping("register")
	public String pageRegister() {
		return "register";
	}

	@RequestMapping(value = "general_register")
	public void doRegister(String email, String password, HttpServletResponse response, HttpSession session) {
		if (StringUtils.isBlank(email) || StringUtils.isBlank(password)) {
			ResponseUtil.writeFailedJSON(response, "blank");
			return;
		}
		Account oldAccount = accountManager.selectAccountByEmail(email);
		if (oldAccount != null) {
			ResponseUtil.writeFailedJSON(response, "exist");
			return;
		}
		Account ac = new Account();
		ac.setEmail(email);
		ac.setPassword(CryptUtil.sha1(password));
		ac.setAccountType(AccountType.GENERAL.getValue());
		ac.setRegisterDate(new Date());
		accountManager.insertAccount(ac);
		session.setAttribute("account", ac);
		ResponseUtil.writeSuccessJSON(response);
	}

	@RequestMapping(value = "logout")
	public void doLogout(HttpSession session, HttpServletResponse response) {
		session.removeAttribute("account");
		ResponseUtil.writeSuccessJSON(response);
	}

}
