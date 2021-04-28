package com.ihelin.book.service;

import com.ihelin.book.db.entity.Book;
import com.ihelin.book.db.mapper.BookMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BookManager {
	@Resource
	BookMapper bookMapper;

	public int insertBook(Book book) {
		return bookMapper.insert(book);
	}

	public List<Book> listBook(Integer type,String bookName, int offset, int size) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (type != null)
			param.put("type", type);
		if (bookName != null)
			param.put("bookName", "%"+bookName+"%");
		return bookMapper.bookList(param, new RowBounds(offset, size));
	}

    public int listBookCount(Integer type,String bookName) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (type != null)
			param.put("type", type);
		if (bookName != null)
			param.put("bookName", "%"+bookName+"%");
		return bookMapper.listBookCount(param);
	}

	public Book selectBookById(Integer id) {
		return bookMapper.selectByPrimaryKey(id);
	}

	public int deleteBookById(Integer id) {
		return bookMapper.deleteByPrimaryKey(id);
	}

	public int updateBook(Book book) {
		return bookMapper.updateByPrimaryKey(book);
	}
}
