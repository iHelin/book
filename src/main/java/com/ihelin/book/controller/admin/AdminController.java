package com.ihelin.book.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.controller.BaseController;
import com.ihelin.book.db.entity.Account;
import com.ihelin.book.db.entity.OrderPayGroup;
import com.ihelin.book.filed.AccountType;
import com.ihelin.book.filed.OrderStatus;
import com.ihelin.book.manager.AccountManager;
import com.ihelin.book.manager.BookManager;
import com.ihelin.book.manager.OrderManager;
import com.ihelin.book.utils.CryptUtil;
import com.ihelin.book.utils.ResponseUtil;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController extends BaseController {

	@Resource
	private AccountManager accountManager;
	@Resource
	private BookManager bookManager;
	@Resource
	private OrderManager orderManager;

	@RequestMapping("index")
	public String adminIndex(HttpSession session, Model model) {
		ServletContext context = session.getServletContext();
		Integer olCount = (Integer) context.getAttribute("count");
		int bookCount = bookManager.listBookCount(null);
		List<OrderPayGroup> opgList = orderManager.selectOpgByCondition(null,OrderStatus.PAYED.getValue());
		model.addAttribute("opgList", opgList);
		model.addAttribute("bookCount", bookCount);
		model.addAttribute("olCount", olCount);
		return AdminFtl("index");
	}

	@RequestMapping("login")
	public String loginCon(String from, Model model) {
		model.addAttribute("from", from);
		return AdminFtl("login");
	}

	@RequestMapping("dologin")
	public void doLogin(String email, String password, HttpServletResponse response, HttpSession session) {
		Account account = accountManager.selectAccountByEmail(email);
		if (account == null) {
			account = accountManager.selectAccountByAccountName(email);
		}
		if (account == null || account.getAccountType() != AccountType.ADMIN.getValue()) {
			ResponseUtil.writeFailedJSON(response, "empty");
			return;
		}
		if (!CryptUtil.sha1(password).equals(account.getPassword())) {
			ResponseUtil.writeFailedJSON(response, "failed");
			return;
		}
		session.setAttribute("admin", account);
		ResponseUtil.writeSuccessJSON(response);
	}

	@RequestMapping(value = "logout")
	public void doLogout(HttpSession session, HttpServletResponse response) {
		session.removeAttribute("admin");
		ResponseUtil.writeSuccessJSON(response);
	}

	@RequestMapping("change_admin_info")
	public void changeAccountInfo(Integer id, String realName, String mobile, String email, String QQ,
			HttpServletResponse response, HttpSession session) {
		if (id == null) {
			ResponseUtil.writeFailedJSON(response, "account_id_null");
			return;
		} else {
			Account ac = accountManager.selectAccountById(id);
			ac.setRealName(realName);
			ac.setMobile(mobile);
			ac.setEmail(email);
			ac.setQQ(QQ);
			accountManager.updateAccount(ac);
			session.setAttribute("admin", ac);
			ResponseUtil.writeSuccessJSON(response);
		}
	}

}
