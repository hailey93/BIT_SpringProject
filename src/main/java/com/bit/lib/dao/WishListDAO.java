package com.bit.lib.dao;

import java.util.List;

import org.springframework.web.bind.annotation.SessionAttribute;

import com.bit.lib.dto.WishListDTO;

public interface WishListDAO {
	List<WishListDTO> selectWishList(@SessionAttribute("id") String id);
	void addWishList(WishListDTO wishListDTO);
}
