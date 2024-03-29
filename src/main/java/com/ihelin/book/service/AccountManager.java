package com.ihelin.book.service;

import cn.hutool.core.util.StrUtil;
import com.ihelin.book.db.entity.Account;
import com.ihelin.book.db.mapper.AccountMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class AccountManager {
    @Resource
    AccountMapper accountMapper;

    public int insertAccount(Account ac) {
        return accountMapper.insert(ac);
    }

    public Account selectAccountByEmail(String email) {
        return accountMapper.selectByEmail(email);
    }

    public Account selectAccountByAccountName(String accountName) {
        return accountMapper.selectByAccountName(accountName);
    }

    public Account selectAccountById(Integer id) {
        return accountMapper.selectByPrimaryKey(id);
    }

    public List<Account> listAccount(Integer accountType, String accountName, int offset, int size) {
        Map<String, Object> param = new HashMap<>();
        if (accountType != null)
            param.put("accountType", accountType);
        if (StrUtil.isNotEmpty(accountName))
            param.put("accountName", "%" + accountName + "%");
        return accountMapper.accountList(param, new RowBounds(offset, size));
    }

    public int listAccountCount(Integer accountType, String accountName) {
        Map<String, Object> param = new HashMap<>();
        if (accountType != null)
            param.put("accountType", accountType);
        if (StrUtil.isNotEmpty(accountName))
            param.put("accountName", "%" + accountName + "%");
        return accountMapper.listAccountCount(param);
    }

    public int deleteAccountById(Integer id) {
        return accountMapper.deleteByPrimaryKey(id);
    }

    public int updateAccount(Account account) {
        return accountMapper.updateByPrimaryKey(account);
    }

}
