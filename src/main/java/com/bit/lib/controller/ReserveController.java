package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.lib.service.ReserveService;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	String rentmsg;
	
	@RequestMapping(value="reserve.do")
	public String getinsertReserve(Model model, String data) {
		
		/* model.addAttribute("insert", reserveService.reserveList()); */
		
		
		return "/reserve/insert";
	}
	
	@RequestMapping(value="/reserveList.do")
	public String getreservList(@RequestParam String bookTitle, int rentStatus, Model model) {
		
		model.addAttribute("rentst", reserveService.reserveList(bookTitle));
		
		switch (rentStatus) {
		case 2 :
			rentmsg = "대여가능";
			
			break;

		default:
			rentmsg = "대여불가능";
			break;
		}
		
		
		System.out.println(rentmsg);
		return "/reserveList";
	}
	
	
}
