package com.ihelin.book.db.mapper;

import com.ihelin.book.db.entity.book;

public interface bookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(book record);

    int insertSelective(book record);

    book selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(book record);

    int updateByPrimaryKey(book record);
}