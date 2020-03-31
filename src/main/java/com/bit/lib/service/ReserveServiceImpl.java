package com.bit.lib.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.bit.lib.dao.ReserveDAO;
import com.bit.lib.dao.UserDAO;
import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;
import com.bit.lib.domain.RentHistory;
import com.bit.lib.domain.Reserve;
import com.bit.lib.domain.User;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService {

	
	@Autowired(required=false)
	private ReserveDAO reserveDao;
	

	
	@Override
	public void insertReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		
	}



	public List<Reserve> reserveList( String bookTitle) {
		
		return reserveDao.getReservList(bookTitle);
	}



	public List<Reserve> reserveList() {
		// TODO Auto-generated method stub
		return null;
	}



}
