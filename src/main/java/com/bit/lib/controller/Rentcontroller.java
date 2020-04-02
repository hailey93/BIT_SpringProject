package com.bit.lib.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.lib.dto.RentDTO;
import com.bit.lib.service.RentService;

@Controller
public class Rentcontroller {
	@Autowired
	private RentService rentService;

	@RequestMapping(value = "rentHistory.do", method = RequestMethod.GET)
	public String getRentHistoryList(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("rentHistoryList", rentService.getRentHistoryList(id));
		System.out.println(rentService.getRentHistoryList(id));
		return "mypage/rentHistory/rentHistory";
	}

	@RequestMapping(value = "rentNow.do")
	public String selectRentNow(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("selectRentNow", rentService.selectRentNow(id));
		System.out.println(rentService.selectRentNow(id));
		return "mypage/rentNow/rentNow";
	}
	@RequestMapping(value="renew.do")
	public String renew(@ModelAttribute RentDTO rentDTO, HttpSession session) {
		//String id=(String)session.getAttribute("id");
		rentService.renew(rentDTO);
		return "mypage/rentNow/renew";
	}
	
	
}

