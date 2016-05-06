package com.ihelin.book.manager;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ihelin.book.db.entity.Account;
import com.ihelin.book.db.mapper.AccountMapper;


@Service
public class AccountManager {
	@Resource
	AccountMapper accountMapper;
	
	public int insertAccount(Account ac){
		return accountMapper.insert(ac);
	}
	
	public Account selectAccountByEmail(String email){
		return accountMapper.selectByEmail(email);
	}

}
