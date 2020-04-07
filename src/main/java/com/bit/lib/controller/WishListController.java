package com.bit.lib.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.lib.service.WishListService;

@Controller
public class WishListController {

	@Autowired(required = false)
	private WishListService wishListService;

	//wishlist페이지에 목록 가져오기
	@RequestMapping("wishList.do")
	public String getWishList(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		model.addAttribute("wishList", wishListService.selectWishList(id));

		return "mypage/wishList/wishList";
	}

	//책상세페이지에서 위시리스트버튼 누르면 해당책이 위시리스트에 담긴다.
	@PostMapping(value = "/addWishList.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void getAddWishList(@RequestParam List<String> chknos, HttpSession session) {
		//책상세페이지로부터 사용자가 선택한 bookNo가 넘어온다. @Param("bookNo") 
		System.out.println(chknos);
		String id = (String) session.getAttribute("id");
		wishListService.addWishList(chknos, id); // db 위시리스트에 저장

	}

	//위시리스트페이지에서 선택한 책 삭제
	@PostMapping(value = "/deleteWishList.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void getDeleteWishList(@RequestParam List<String> chkcodes) {

        wishListService.deleteWishList(chkcodes);

	}
	
	//위시리스트페이지에서 선택한 책 대여
	@PostMapping(value = "/wishRent.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void getAddRent(@RequestParam List<String> chknos, @RequestParam List<String> chkcodes, HttpSession session) {
		String id = (String) session.getAttribute("id");
		wishListService.addRent(chknos, id);
		wishListService.deleteWishList(chkcodes);
	}
	

	//위시리스트페이지에서 선택한 책 예약하고 책의 예약상태도 바꿔주기
	@PostMapping(value = "/wishReserve.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void getAddReserve(@RequestParam List<String> chknos, @RequestParam List<String> chkcodes, HttpSession session) {
		String id = (String) session.getAttribute("id");
		wishListService.addReserve(id, chknos);
		wishListService.deleteWishList(chkcodes);
	}
	
	

}
