package com.ihelin.book.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.db.entity.Book;
import com.ihelin.book.manager.BookManager;
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
		List<Book> books = bookManager.listBook(null, (pageNum - 1) * PAGE_LENGTH, PAGE_LENGTH);
		int totalCount = bookManager.listBookCount(null);
		model.addAttribute("books", books);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		return "books";
	}

	@RequestMapping("book_detail")
	public String bookDetail(Integer id, Model model) {
		Book book = bookManager.selectBookById(id);
		model.addAttribute("book", book);
		return "book_detail";
	}

}
