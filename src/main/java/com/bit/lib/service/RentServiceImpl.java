package com.bit.lib.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.RentDAO;
import com.bit.lib.dto.RentDTO;


@Service("rentService")
public class RentServiceImpl implements RentService {
	
//	@Autowired
	private RentDAO rentDAO;
	private RentDTO rentDTO;

	/*
	 * @Autowired public RentServiceImpl(RentDAO rentDAO,RentDTO rentDTO,
	 * RentService rentService) {
	 * 
	 * }
	 */
	

	@Override
	public List<RentDTO> getRentHistoryList(String id) {
		// TODO Auto-generated method stub
		return rentDAO.getRentHistoryList(id);
	}

	@Override
	public List<RentDTO> selectRentNow(String id) {
		// TODO Auto-generated method stub
		return rentDAO.selectRentNow(id);
	}

	@Override
	public void renew(RentDTO rentDTO) {
		rentDAO.renew(rentDTO);
	}

	@Override
	public void searchRent(String bookNo, int rentStatus, int reserveStatus, String id) {
		/*
		 * System.out.println("////////////////"); int bs = rentDTO.getRentStatus(); int
		 * rs = rentDTO.getReserveStatus(); System.out.println(bs + "///////" + rs);
		 * 
		 * String msg; if(bs == 2) { if(rs == 0) { msg = ("대여 되었습니다.");
		 * System.out.println(msg);
		 * 
		 * }else { msg = ("대여가 불가능한 책입니다."); System.out.println(msg);
		 * 
		 * } }else { msg = ("대여가 불가능한 책입니다."); System.out.println(msg);
		 * 
		 * }
		 */
		 rentDAO.searchRent(bookNo, rentStatus, reserveStatus, id); 
	}

	@Override
	public void bookRent(List<String> chknos, String bookNo, String id) {
		// TODO Auto-generated method stub
		System.out.println(bookNo);
		rentDAO.bookRent(chknos, bookNo, id);
		System.out.println(chknos);
	}

	@Override
	public void bookstUpdate(List<String> chknos, String bookNo) {
		// TODO Auto-generated method stub
		System.out.println("업데이트문");
		rentDAO.bookstUpdate(chknos, bookNo);
	}

	
}
