package com.ihelin.book.db.mapper;

import com.ihelin.book.db.entity.Account;

public interface AccountMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Integer id);
    
    Account selectByEmail(String email);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
}