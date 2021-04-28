package com.ihelin.book.controller.admin;

import com.ihelin.book.controller.BaseController;
import com.ihelin.book.db.entity.Account;
import com.ihelin.book.service.AccountManager;
import com.ihelin.book.utils.ResponseUtil;
import com.ihelin.book.view.Pagination;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminAccountController extends BaseController {

    @Resource
    private AccountManager accountManager;

    @RequestMapping("user_manage")
    public String userManage(Model model, Integer pageNum, Integer accountType, String accountName) {
        if (pageNum == null)
            pageNum = 1;
        List<Account> accounts = accountManager.listAccount(accountType, accountName, (pageNum - 1) * PAGE_LENGTH, PAGE_LENGTH);
        int totalCount = accountManager.listAccountCount(accountType, accountName);
        model.addAttribute("accounts", accounts);
        model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
        model.addAttribute("accountType", accountType);
        model.addAttribute("accountName", accountName);
        return AdminFtl("user_manage");
    }

    /**
     * 删除账户
     *
     * @param id
     * @param response
     */
    @RequestMapping("delete_account")
    public void deleteBook(Integer id, HttpServletResponse response) {
        if (id != null) {
            accountManager.deleteAccountById(id);
            ResponseUtil.writeSuccessJSON(response);
        } else {
            ResponseUtil.writeFailedJSON(response, "id_is_null");
        }
    }

    @RequestMapping("admin_edit")
    public String adminHandle() {
        return AdminFtl("admin_edit");
    }

}
