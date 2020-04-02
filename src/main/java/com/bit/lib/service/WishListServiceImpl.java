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

	@Override
	public void deleteWishList(List<String> chkItems) {
		//컨트롤러에서 전달한 List를 for문으로 돌려 고유값을 하나씩 꺼내어 delete문을 돌리기
		
		for(String delItems:chkItems) {
			int wishListCode=Integer.parseInt(delItems);
			System.out.println(wishListCode);
			wishListDAO.deleteWishList(wishListCode);
		}
	}
	

}
