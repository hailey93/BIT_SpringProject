package com.bit.lib.service;

import java.util.List;

import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;
import com.bit.lib.domain.RentHistory;
import com.bit.lib.domain.Reserve;
import com.bit.lib.dto.ReserveListDTO;

public interface ReserveService {

	
	void insertReserve(Reserve reserve);
	
	List<ReserveListDTO> getReserveList(String id);
	
	
}
