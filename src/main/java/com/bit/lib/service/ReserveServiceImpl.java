package com.bit.lib.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.bit.lib.dao.ReserveDAO;
import com.bit.lib.dao.UserDAO;
import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;
import com.bit.lib.domain.RentHistory;
import com.bit.lib.domain.Reserve;
import com.bit.lib.domain.User;
import com.bit.lib.dto.ReserveListDTO;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService {

	
	@Autowired(required=false)
	private ReserveDAO reserveDao;
	

	
	
	public List<ReserveListDTO> getReserveList(String id) {
		
		/*
		 * String rentStat; int rentst = ReserveListDto dto = getReserveList(id).
		 */
		return reserveDao.getReserveList(id);
	}




	@Override
	public void insertReserve( String id, String bookNo) {
		// TODO Auto-generated method stub
		
		reserveDao.insertReserve(id, bookNo);
	}




	@Override
	public void insertReserveup(String bookNo) {
		// TODO Auto-generated method stub
		reserveDao.insertReserveup(bookNo);
	}




	@Override
	public void reserveCancel(List<String> chkItems) {
		// TODO Auto-generated method stub
		for(String bookNo:chkItems) {
	         System.out.println(bookNo);
	         reserveDao.reserveCancel(bookNo);
		}
		
	}




	@Override
	public void reserveCancelup(List<String> chkItems) {
		// TODO Auto-generated method stub
		for(String bookNo:chkItems) {
	         System.out.println(bookNo);
	         reserveDao.reserveCancel(bookNo);
		}
		
	}
	



	


}
