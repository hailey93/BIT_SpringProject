package com.bit.lib.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.WishListDAO;
import com.bit.lib.dto.WishListDTO;

@Service("wishListService")
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	private WishListDAO wishListDAO;

	@Override
	public List<WishListDTO> selectWishList(String id) {
		return wishListDAO.selectWishList(id);
	}

	@Override
	public void addWishList(WishListDTO wishListDTO) {
		wishListDAO.addWishList(wishListDTO);
	}
	

}
