package com.bit.lib.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "mypage/rentHistory/rentHistory";
	}

	@RequestMapping(value = "rentNow.do", method = RequestMethod.GET)
	public String selectRentNow(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<RentDTO> rentDtos = rentService.selectRentNow(id);
		model.addAttribute("selectRentNow", rentDtos);
		System.out.println(rentDtos);
		return "mypage/rentNow/rentNow";
	}

	@RequestMapping(value = "renew.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public void renew(@RequestParam List<String> chkcodes) {
		rentService.renew(chkcodes);
		System.out.println(chkcodes);
	}
		/*
		 * User user = (User) session.getAttribute("id"); String id = user.getId();
		 * 
		 * int result = rentService.renew();
		 */

		// rentService.renew(rentDTO);;
		// 마이바티스가 실행한 업데이트쿼리문의 레코드(행) 개수를 반환해줌

		/*
		 * String uri = ""; if (result > 0) { System.out.println("연장성공" + result); uri =
		 * "mypage/rentNow/renew"; } else { System.out.println("연장실패"); uri =
		 * "mypage/rentNow/renewErr"; } return uri;
		 */

	
}