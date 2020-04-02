package com.bit.lib.service;

import java.util.ArrayList;
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
	public void deleteWishList(ArrayList<String> deleteArray) {
		//컨트롤러에서 전달한 ArrayList를 for문으로 돌려 고유값을 하나씩 꺼내어 delete문을 돌린다.
		System.out.println(deleteArray);
		for(int i=0;i<deleteArray.size();i++) {
			int wishListCode=Integer.parseInt(deleteArray.get(i));
			wishListDAO.deleteWishList(wishListCode);
		}
	}
	

}
