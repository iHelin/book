package com.ihelin.book.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.ihelin.book.db.entity.Book;
import com.ihelin.book.db.mapper.BookMapper;

@Service
public class BookManager {
	@Resource
	BookMapper bookMapper;

	public int insertBook(Book book) {
		return bookMapper.insert(book);
	}

	public List<Book> listBook(Integer type, int offset, int size) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (type != null)
			param.put("type", type);
		return bookMapper.bookList(param, new RowBounds(offset, size));
	}
	
	public int listBookCount(Integer type) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (type != null)
			param.put("type", type);
		int count = bookMapper.listBookCount(param);
		return count;
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
