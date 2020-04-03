package com.bit.lib.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.lib.dto.WishListDTO;
import com.bit.lib.service.WishListService;

@Controller
public class WishListController {

	@Autowired(required = false)
	private WishListService wishListService;

	@RequestMapping("wishList.do")
	public String getWishList(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		model.addAttribute("wishList", wishListService.selectWishList(id));

		return "mypage/wishList/wishList";
	}

	@RequestMapping("addWishList.do")
	public String getAddWishList(@ModelAttribute WishListDTO wishListDTO, HttpSession session) {
		//책상세페이지로부터 사용자가 선택한 bookNo가 넘어온다. @Param("bookNo") 
		String id = (String) session.getAttribute("id"); //세션에서 아이디 가져오기
		if (id == null) { //로그인안했을때
			return "redirect:/login.do";
		}

		wishListService.addWishList(wishListDTO); // db 위시리스트에 저장

		// 대여상세페이지에서 팝업창을 띄워 위시리스트에 저장되었습니다 보기? 계속 책보기 script로 처리해보자
		// 대여상세페이지 위시리스트 버튼에 script 추가해주어야한다. 잊지말기
		return "mypage/wishList/addSuccessPopup";
	}

	@RequestMapping(value = "/deleteWishList.do", method = RequestMethod.POST)
	@ResponseBody
	public void getDeleteWishList(@RequestBody List<String> chkItems) {
		//jsp에서 List로 받은 chkItems service단으로 넘기기
		System.out.println(chkItems);
		wishListService.deleteWishList(chkItems);
		
	}
	
	

}
