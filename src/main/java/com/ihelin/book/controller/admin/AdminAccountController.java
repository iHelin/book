package com.ihelin.book.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.controller.BaseController;
import com.ihelin.book.db.entity.Account;
import com.ihelin.book.manager.AccountManager;
import com.ihelin.book.utils.ResponseUtil;
import com.ihelin.book.view.Pagination;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminAccountController extends BaseController{
	@Resource
	private AccountManager accountManager;

	@RequestMapping("user_manage")
	public String userManage(Model model,Integer pageNum,Integer accountType){
		if (pageNum == null)
			pageNum = 1;
		List<Account> accounts = accountManager.listAccount(accountType,(pageNum - 1) * PAGE_LENGTH, PAGE_LENGTH);
		int totalCount = accountManager.listAccountCount(accountType);
		model.addAttribute("accounts", accounts);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		return AdminFtl("user_manage");
	}
	
	/**
	 * 删除图书
	 * 
	 * @param id
	 * @param response
	 */
	@RequestMapping("delete_account")
	public void deleteBook(Integer id, HttpServletResponse response) {
		if (id != null) {
			accountManager.deleteAccountById(id);
			ResponseUtil.writeSuccessJSON(response);
		}else{
			ResponseUtil.writeFailedJSON(response, "id_is_null");
		}
	}
	
	@RequestMapping("order_manage")
	public String orderManage(){
		return AdminFtl("order");
	}
	
	@RequestMapping("admin_edit")
	public String adminHandle(){
		return AdminFtl("admin_edit");
	}

}
