package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.lib.service.BookDetailService;

@Controller
public class BookDetailController {

	@Autowired
	private BookDetailService bookDetailService;
	
	//도서 상세페이지
	@RequestMapping(value = "/bookDetail.do", method=RequestMethod.GET)
	public String bookPage(Model model, String bookTitle) {
		System.out.println(bookTitle);

		model.addAttribute("bookdtList", bookDetailService.bookPage(bookTitle));
		model.addAttribute("bookdt", bookDetailService.bookDetail(bookTitle));
		System.out.println(bookDetailService.bookDetail(bookTitle));
		System.out.println(bookDetailService.bookPage(bookTitle));

		return "book/bookDetail";
	}

}
