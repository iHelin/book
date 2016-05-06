package com.ihelin.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BooksController {
	
	@RequestMapping("books")
	public String handleBook(){
		return "books";
	}

}
