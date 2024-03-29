package com.ihelin.book.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.ihelin.book.db.entity.Account;
import com.ihelin.book.filed.AccountType;
import com.ihelin.book.utils.ResponseUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class LoginController extends BaseController {

    @RequestMapping("login")
    public String pageLogin(String from, Model model) {
        model.addAttribute("from", from);
        return "login";
    }

    @RequestMapping("login.do")
    public void doLogin(String email, String password, HttpServletResponse response, HttpSession session) {
        Account account = accountManager.selectAccountByEmail(email);
        if (account == null) {
            account = accountManager.selectAccountByAccountName(email);
        }
        if (account == null || account.getAccountType() != AccountType.GENERAL.getValue()) {
            ResponseUtil.writeFailedJSON(response, "empty");
            return;
        }
        if (!SecureUtil.sha1(password).equals(account.getPassword())) {
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
        if (StrUtil.isBlank(email) || StrUtil.isBlank(password)) {
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
        ac.setImg(DEFAULT_ACCOUNT_IMG);
        ac.setPassword(SecureUtil.sha1(password));
        ac.setAccountType(AccountType.GENERAL.getValue());
        ac.setRegisterDate(new Date());
        accountManager.insertAccount(ac);
        session.setAttribute("account", ac);
        ResponseUtil.writeSuccessJSON(response);
    }

    @RequestMapping(value = "logout")
    public void doLogout(HttpSession session, HttpServletResponse response) {
        session.removeAttribute("account");
        // session.invalidate();
        ResponseUtil.writeSuccessJSON(response);
    }

}
