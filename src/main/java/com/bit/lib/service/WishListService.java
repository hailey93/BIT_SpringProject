package com.bit.lib.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.SessionAttribute;

import com.bit.lib.dto.WishListDTO;

public interface WishListService {
	List<WishListDTO> selectWishList(@SessionAttribute("id") String id);
	void addWishList(WishListDTO wishListDTO);
	void deleteWishList(ArrayList<String> deleteArray);
}
