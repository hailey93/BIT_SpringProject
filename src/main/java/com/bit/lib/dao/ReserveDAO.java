package com.bit.lib.dao;

import java.util.List;

import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;
import com.bit.lib.domain.RentHistory;
import com.bit.lib.domain.Reserve;

public interface ReserveDAO {

		void insertReserve(Reserve reserve);
		List<Reserve> getReserveList(String bookNo);
		
}
