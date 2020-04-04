package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.lib.service.ReserveService;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	

	@RequestMapping(value = "/reserve.do", method = RequestMethod.GET)
	public String getinsertReserve(Model model, String data) {

		/* model.addAttribute("insert", reserveService.reserveList()); */

		return "insert";
	}

	@RequestMapping(value = "/reserveList.do")
	public String getReserveList(Model model, String id) {
		id = "hyun123";
		model.addAttribute("rentst", reserveService.getReserveList(id));
		System.out.println(reserveService.getReserveList(id));

		return "mypage/reserve/reserveList";
	}

}
