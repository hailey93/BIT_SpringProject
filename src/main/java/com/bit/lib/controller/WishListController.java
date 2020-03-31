package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.lib.service.WishListService;

@Controller
public class WishListController {

	@Autowired(required = false)
	private WishListService wishListService;
	
	@RequestMapping("wishList.do")
	public String getWishList() {
		
		return "wishList/wishList";
	}
	
	/*
	 * public String addWishList() { return "wishList/wishList"; }
	 * 
	 * public String deleteWishList() { return "wishList/wishList"; }
	 */
}
