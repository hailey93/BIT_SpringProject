package com.bit.lib.dao;

import java.util.List;

import org.springframework.web.bind.annotation.SessionAttribute;

import com.bit.lib.dto.WishListDTO;

public interface WishListDAO {
	List<WishListDTO> selectWishList(@SessionAttribute("id") String id);
	void addWishList(WishListDTO wishListDTO);
	void deleteWishList(int wishListCode); //체크박스에 연결된 위시리스트코드를 파라미터값으로 넘기고 그 파라미터값을 deletewishlist()가 받는다.
}
