package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.lib.service.BookDetailService;

@Controller
public class BookDetailController {

	@Autowired
	private BookDetailService bookDetailService;
	

	@RequestMapping(value = "/bookDetail.do")
	public String bookPage(Model model, String bookTitle) {
		bookTitle = "책제목1";
		model.addAttribute("bookdtList", bookDetailService.bookPage(bookTitle));
		model.addAttribute("bookdt", bookDetailService.bookDetail(bookTitle));
		System.out.println(bookDetailService.bookPage(bookTitle));

		return "book/bookDetail";
	}

	
}
