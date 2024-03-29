package com.ihelin.book.controller.user;

import cn.hutool.core.date.DateUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONUtil;
import com.ihelin.book.controller.BaseController;
import com.ihelin.book.db.entity.Account;
import com.ihelin.book.db.entity.OrderItem;
import com.ihelin.book.db.entity.OrderPayGroup;
import com.ihelin.book.service.AccountManager;
import com.ihelin.book.service.OrderManager;
import com.ihelin.book.utils.ResponseUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    @Resource
    private AccountManager accountManager;
    @Resource
    private OrderManager orderManager;

    @RequestMapping("user_info")
    public String userInfo(Model model) {
        return UserFtl("user_info");
    }

    @RequestMapping("user_edit")
    public String userEdit() {
        return UserFtl("user_edit");
    }

    @RequestMapping("user_order")
    public String userOrder(Model model) {
        List<OrderPayGroup> opgs = orderManager.selectOpgByCondition(getAccount().getId(), null, 0, MAX_LENGTH);
        List<OrderItem> orderItems = new ArrayList<>();
        for (OrderPayGroup orderPayGroup : opgs) {
            String oids = orderPayGroup.getOrderIds();
            JSONArray oidList = JSONUtil.parseArray(oids);
            for (int i = 0; i < oidList.size(); i++) {
                orderItems.add(orderManager.selectOrderItemById(oidList.getInt(i)));
            }
        }
        model.addAttribute("orderItems", orderItems);
        model.addAttribute("opgs", opgs);
        return UserFtl("user_order");
    }

    @RequestMapping("password_edit")
    public String passwordEdit() {
        return UserFtl("password_edit");
    }

    @RequestMapping("change_account_info")
    public void changeAccountInfo(Integer id, String accountName, String realName, Boolean gender, String birthday,
                                  String phone, String email, String QQ, HttpServletResponse response, HttpSession session) {
        Account oldAccount = accountManager.selectAccountByAccountName(accountName);
        if (oldAccount != null) {
            ResponseUtil.writeFailedJSON(response, "account_name_repeat");
            return;
        }
        if (id == null) {
            ResponseUtil.writeFailedJSON(response, "account_id_null");
            return;
        } else {
            Account ac = accountManager.selectAccountById(id);
            if (ac.getAccountName() == null)
                ac.setAccountName(accountName);
            ac.setRealName(realName);
            ac.setGender(gender);
            ac.setBirthday(DateUtil.parseDate(birthday));
            ac.setMobile(phone);
            ac.setEmail(email);
            ac.setQQ(QQ);
            accountManager.updateAccount(ac);
            session.setAttribute("account", ac);
            ResponseUtil.writeSuccessJSON(response);
        }
    }

    @RequestMapping("change_password")
    public void changePsw(HttpServletResponse response, String oldPsw, String newPsw, Integer id) {
        if (id == null) {
            ResponseUtil.writeFailedJSON(response, "account_id_null");
            return;
        }
        if (newPsw.equals(oldPsw)) {
            ResponseUtil.writeFailedJSON(response, "same_psw");
            return;
        }
        Account account = accountManager.selectAccountById(id);
        if (!account.getPassword().equals(SecureUtil.sha1(oldPsw))) {
            ResponseUtil.writeFailedJSON(response, "old_psw_error");
            return;
        }
        account.setPassword(SecureUtil.sha1(newPsw));
        accountManager.updateAccount(account);
        ResponseUtil.writeSuccessJSON(response);
    }

}
