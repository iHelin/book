package com.ihelin.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.db.entity.Book;
import com.ihelin.book.manager.BookManager;
import com.ihelin.book.utils.ResponseUtil;
import com.ihelin.book.view.Pagination;

@Controller
public class BooksController {
	@Resource
	private BookManager bookManager;

	protected static final int PAGE_LENGTH = 12;

	@RequestMapping("books")
	public String handleBook(Model model, Integer pageNum) {
		if (pageNum == null)
			pageNum = 1;
		List<Book> books = bookManager.listBook(null,null, (pageNum - 1) * PAGE_LENGTH, PAGE_LENGTH);
		int totalCount = bookManager.listBookCount(null,null);
		model.addAttribute("books", books);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		return "books";
	}

	@RequestMapping("/book/{id}")
	public String bookDetail(@PathVariable("id") Integer id, Model model) {
		Book book = bookManager.selectBookById(id);
		model.addAttribute("book", book);
		return "book_detail";
	}
	
	@RequestMapping("select_book_by_id")
	public void getBookById(Integer id,HttpServletResponse response){
		Book book = bookManager.selectBookById(id);
		Map<String,Object> res = new HashMap<String,Object>();
		res.put("book", book);
		ResponseUtil.writeSuccessJSON(response, res);
	}

}
