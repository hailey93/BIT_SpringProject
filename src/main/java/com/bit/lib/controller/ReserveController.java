package com.bit.lib.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.lib.dto.BookDetailDTO;
import com.bit.lib.service.ReserveService;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	
	
	//도서 예약
	/*
	 * @RequestMapping(value = "/reserve.do", method = RequestMethod.GET) public
	 * String insertReserve( @Param("bookNo") String bookNo) { String id = (String)
	 * session.getAttribute("id");
	 * 
	 * reserveService.insertReserve(id, bookNo);
	 * reserveService.insertReserveup(bookNo);
	 * 
	 * System.out.println("reseveok");
	 * 
	 * return "reserveList.do"; }
	 */
	//도서 예약 목록
	@RequestMapping(value = "/reserveList.do")
	public String getReserveList(Model model, HttpSession session) {
		 String id=(String) session.getAttribute("id"); 
		
		model.addAttribute("rentst", reserveService.getReserveList(id));
		
		System.out.println(reserveService.getReserveList(id));

		return "mypage/reserve/reserveList2";
	}
	//도서 예약 취소
	@RequestMapping(value="/reserveCancel.do", method = RequestMethod.POST)
	@ResponseBody
	public String reserveCancel(@RequestBody List<String> chkItems) {
		System.out.println(chkItems);
		reserveService.reserveCancel(chkItems);
		reserveService.reserveCancelup(chkItems);
		
		System.out.println("reserveCancel Ok");
		return "mypage/reserve/reserveList";
	}
	@RequestMapping(value="/reserveCancel1.do", method = RequestMethod.POST)
	@ResponseBody
	public String reserveCancel1(@RequestBody BookDetailDTO bookDetailDTO) {
		System.out.println(bookDetailDTO);
		/*
		 * reserveService.reserveCancel(bookDetailDTO.getBookNo());
		 * reserveService.reserveCancelup(chkItems);
		 */
		
		System.out.println("reserveCancel Ok");
		return "mypage/reserve/reserveList";
	}

}
