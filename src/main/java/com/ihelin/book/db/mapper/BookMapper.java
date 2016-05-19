package com.ihelin.book.db.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.ihelin.book.db.entity.Book;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);
    
    List<Book> bookList(Map<String, Object> param, RowBounds rowBounds);
    
    int listBookCount(Map<String, Object> param);
}