package com.bit.lib.service;

import java.util.List;

import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;
import com.bit.lib.domain.RentHistory;
import com.bit.lib.domain.Reserve;

public interface ReserveService {

	
	void insertReserve(Reserve reserve);
	List<Reserve> reserveList(String bookTitle);
	
}
