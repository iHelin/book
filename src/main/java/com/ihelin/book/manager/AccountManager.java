package com.ihelin.book.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
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
	
	public Account selectAccountByAccountName(String accountName){
		return accountMapper.selectByAccountName(accountName);
	}
	
	public Account selectAccountById(Integer id){
		return accountMapper.selectByPrimaryKey(id);
	}
	
	public List<Account> listAccount(Integer accountType,int offset, int size){
		Map<String, Object> param = new HashMap<String, Object>();
		if(accountType!=null)
			param.put("accountType", accountType);
		return accountMapper.accountList(param,new RowBounds(offset, size));
	}
	
	public int listAccountCount(Integer accountType) {
		Map<String, Object> param = new HashMap<String, Object>();
		if(accountType!=null)
			param.put("accountType", accountType);
		int count = accountMapper.listAccountCount(param);
		return count;
	}
	
	public int deleteAccountById(Integer id){
		return accountMapper.deleteByPrimaryKey(id);
	}
	
	public int updateAccount(Account account){
		return accountMapper.updateByPrimaryKey(account);
	}

}
