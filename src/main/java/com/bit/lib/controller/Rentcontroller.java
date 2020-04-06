package com.bit.lib.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.lib.dto.RentDTO;
import com.bit.lib.dto.ReserveListDTO;
import com.bit.lib.service.RentService;
import com.bit.lib.service.ReserveService;

@Controller
public class Rentcontroller {
	@Autowired
	private RentService rentService;
	private ReserveService reserveService;

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

	@RequestMapping(value = "renew.do")
	public String renew(@ModelAttribute RentDTO rentDTO, HttpSession session) {
		// String id=(String)session.getAttribute("id");
		rentService.renew(rentDTO);
		return "mypage/rentNow/renew";
	}

	@PostMapping(value = "/rent.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String bookRent(@RequestParam List<String> chknos, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println(chknos + "///" + id);

		rentService.bookRent(chknos, id);
		System.out.println("Rent Ok");
		rentService.bookstUpdate(chknos);
		System.out.println("up Ok");
		rentService.reserveCancel(chknos);
		System.out.println("delete Ok");
		return "/mypage/rentNow/rentNow";

	}

}
