package com.bit.lib.service;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;
import com.bit.lib.domain.RentHistory;

import com.bit.lib.domain.Reserve;
import com.bit.lib.dto.ReserveListDTO;

public interface ReserveService {

	
	void insertReserve(String id, String bookNo);
	void insertReserveup(String bookNo);
	
	List<ReserveListDTO> getReserveList(String id);
	
	void reserveCancel(String bookNo);
	void reserveCancelup(String bookNo);
	
}
