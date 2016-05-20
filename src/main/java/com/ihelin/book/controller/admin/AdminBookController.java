package com.ihelin.book.controller.admin;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ihelin.book.controller.BaseController;
import com.ihelin.book.db.entity.Book;
import com.ihelin.book.manager.BookManager;
import com.ihelin.book.utils.ResponseUtil;
import com.ihelin.book.view.Pagination;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminBookController extends BaseController {

	@Resource
	private BookManager bookManager;

	@RequestMapping("books")
	public String adminIndex(Model model, Integer pageNum, Integer type) {
		if (pageNum == null)
			pageNum = 1;
		List<Book> books = bookManager.listBook(type, (pageNum - 1) * PAGE_LENGTH, PAGE_LENGTH);
		int totalCount = bookManager.listBookCount(type);
		model.addAttribute("books", books);
		model.addAttribute("type", type);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		return "admin/books";
	}

	/**
	 * 添加图书
	 * 
	 */
	@RequestMapping("add_book_commit")
	public void addBook(HttpServletResponse response, String bookName, String author, String press, Integer bookType,
			Integer number, String isbn, BigDecimal price, BigDecimal promotionPrice, String promo, String detail,
			Boolean postage) {
		Book newBook = new Book();
		newBook.setBookName(bookName);
		newBook.setAuthor(author);
		newBook.setPress(press);
		newBook.setIsbn(isbn);
		newBook.setType(bookType);
		newBook.setNumber(number);
		newBook.setPrice(price);
		newBook.setPromotionPrice(promotionPrice);
		newBook.setCreateTime(new Date());
		newBook.setCreaterId(1);// 替换
		newBook.setPromo(promo);
		newBook.setDetail(detail);
		newBook.setIsFreePostage(postage);
		bookManager.insertBook(newBook);
		ResponseUtil.writeSuccessJSON(response);
	}

	/**
	 * 编辑图书
	 * 
	 */
	@RequestMapping("edit_book_commit")
	public void editBook(HttpServletResponse response, Integer id, String bookName, String author, String press,
			Integer bookType, Integer number, String isbn, BigDecimal price, BigDecimal promotionPrice, String promo,
			String detail, Boolean postage) {
		Book oldBook = bookManager.selectBookById(id);
		oldBook.setBookName(bookName);
		oldBook.setAuthor(author);
		oldBook.setPress(press);
		oldBook.setIsbn(isbn);
		oldBook.setType(bookType);
		oldBook.setNumber(number);
		// oldBook.setPrice(price);
		oldBook.setPromotionPrice(promotionPrice);
		oldBook.setPromo(promo);
		oldBook.setDetail(detail);
		oldBook.setIsFreePostage(postage);
		bookManager.updateBook(oldBook);
		ResponseUtil.writeSuccessJSON(response);
	}

	/**
	 * 删除图书
	 * 
	 * @param id
	 * @param response
	 */
	@RequestMapping("delete_book")
	public void deleteBook(Integer id, HttpServletResponse response) {
		if (id != null) {
			bookManager.deleteBookById(id);
			ResponseUtil.writeSuccessJSON(response);
		} else {
			ResponseUtil.writeFailedJSON(response, "id_is_null");
		}
	}

	/**
	 * 通过id查询图书
	 * 
	 * @param id
	 * @param response
	 */
	@RequestMapping("selete_book")
	public void selectBookByid(Integer id, HttpServletResponse response) {
		Map<String, Object> bookMap = new HashMap<String, Object>();
		Book book = bookManager.selectBookById(id);
		bookMap.put("book", book);
		ResponseUtil.writeSuccessJSON(response, bookMap);
	}
}
