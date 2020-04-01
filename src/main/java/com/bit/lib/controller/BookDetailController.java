package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.lib.service.ReserveService;

@Controller
public class BookDetailController {

	@Autowired
	private ReserveService reserveService;
	String rentmsg;

	@RequestMapping(value = "/BookDetail.do")
	public String getReserveList(Model model, String bookNo) {
		bookNo = "BC1";
		model.addAttribute("rentst", reserveService.getReserveList(bookNo));
		System.out.println(reserveService.getReserveList(bookNo));

		return "mypage/reserve/BookDetail";
	}

}
