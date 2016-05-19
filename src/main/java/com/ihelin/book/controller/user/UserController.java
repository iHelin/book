package com.ihelin.book.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.controller.BaseController;
import com.ihelin.book.db.entity.Account;
import com.ihelin.book.manager.AccountManager;
import com.ihelin.book.utils.DateTimeUtil;
import com.ihelin.book.utils.ResponseUtil;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

	@Resource
	private AccountManager accountManager;

	@RequestMapping("user_info")
	public String userInfo(Model model) {
		// Account account = accountManager.selectAccountById(id);
		// model.addAttribute("account", account);
		return UserFtl("user_info");
	}

	@RequestMapping("user_edit")
	public String userEdit() {
		return UserFtl("user_edit");
	}

	@RequestMapping("change_account_info")
	public void changeAccountInfo(Integer id, String accountName, String realName, Boolean gender, String birthday,
			String phone, String email, HttpServletResponse response, HttpSession session) {
		Account oldAccount = accountManager.selectAccountByAccountName(accountName);
		if (oldAccount != null) {
			ResponseUtil.writeFailedJSON(response, "account_name_repeat");
			return;
		}
		if (id == null) {
			ResponseUtil.writeFailedJSON(response, "account_id_null");
			return;
		}else{
			Account ac = accountManager.selectAccountById(id);
			ac.setAccountName(accountName);
			ac.setRealName(realName);
			ac.setGender(gender);
			ac.setBirthday(DateTimeUtil.parseDate(birthday));
			ac.setMobile(phone);
			ac.setEmail(email);
			accountManager.updateAccount(ac);
			session.setAttribute("account", ac);
			ResponseUtil.writeSuccessJSON(response);
		}
	}

}
