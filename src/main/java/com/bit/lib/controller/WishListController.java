package com.bit.lib.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.lib.dto.WishListDTO;
import com.bit.lib.service.WishListService;
import com.mysql.cj.xdevapi.JsonArray;

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
		String id=(String)session.getAttribute("id");
		if(id==null) {
			return "redirect:/login.do";
		}
		
		wishListService.addWishList(wishListDTO); //db 위시리스트에 저장
		
		//대여상세페이지에서 팝업창을 띄워 위시리스트에 저장되었습니다 보기? 계속 책보기 script로 처리해보자
		//대여상세페이지 위시리스트 버튼에 script 추가해주어야한다. 잊지말기
		return "mypage/wishList/addSuccessPopup"; 
	}

	@RequestMapping(value="/deleteWishList.do", method = RequestMethod.POST)
	@ResponseBody
	public void getDeleteWishList(HttpServletRequest request, @RequestBody String delItems) {
		//ajax를 통해 array로 받은 deleteList를 하나씩 빼서 ArrayList에 넣는다.


		/*List<Map<String, Object>> resultMap=new ArrayList<Map<String,Object>>();
		resultMap=JSONArray.fromObject(delItems);
		for (Map<String, Object> map : resultMap) {
	        System.out.println(map.get("user_nm") + " : " + map.get("user_password"));
	     */
	    }

		
		/*
		 * ArrayList<String> deleteArray=new ArrayList<String>();
		 * 
		 * for(int i=0 ; i<deleteList.size();i++) { deleteArray.add(deleteList.get(i));
		 * } System.out.println(deleteList);
		 * wishListService.deleteWishList(deleteArray);
		 */
		 
	  }
	 
	 

