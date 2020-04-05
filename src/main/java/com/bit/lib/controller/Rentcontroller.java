package com.bit.lib.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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

	@RequestMapping(value = "renew.do")
	public String renew(@ModelAttribute RentDTO rentDTO, HttpSession session) {
		// String id=(String)session.getAttribute("id");
		rentService.renew(rentDTO);
		return "mypage/rentNow/renew";
	}

	/*
	 * // 도서 대여
	 * 
	 * @RequestMapping(value = "/searchRent.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String searchRent(@RequestBody RentDTO rentDTO,
	 * HttpSession session) { String id = (String) session.getAttribute("id");
	 * System.out.println(rentDTO.getBookNo() + "//////" + id +
	 * rentDTO.getRentStatus() + rentDTO.getReserveStatus());
	 * rentService.searchRent(rentDTO.getBookNo(), rentDTO.getRentStatus(),
	 * rentDTO.getReserveStatus(), id); System.out.println(rentDTO.getBookNo() +
	 * "///" + rentDTO.getRentStatus() + "/////" + rentDTO.getReserveStatus() +
	 * "/////" + id); System.out.println("Not Rent"); return "book/bookDetail"; }
	 */
	@PostMapping(value = "/rent.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String bookRent(@RequestParam List<String> chknos, String bookNo, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println(chknos);
		bookNo = chknos.get(0).toString();
		System.out.println(bookNo);
		rentService.bookRent(chknos, bookNo, id);
		System.out.println("업데이트");
		rentService.bookstUpdate(chknos,bookNo);
		System.out.println("Update Ok");
		return "/book/bookDetail";
	}

	/*
	 * @RequestMapping(value = "/bookRent.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String bookRent(@RequestBody RentDTO rentDTO,
	 * HttpSession session) { System.out.println(rentDTO); String id = (String)
	 * session.getAttribute("id"); rentService.bookRent(rentDTO.getBookNo(), id);
	 * rentService.bookstUpdate(rentDTO.getBookNo());
	 * 
	 * System.out.println("rentOk");
	 * 
	 * return "book/bookDetail"; }
	 */

}
