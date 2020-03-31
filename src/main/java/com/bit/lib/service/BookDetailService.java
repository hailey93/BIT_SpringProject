package com.bit.lib.service;

import java.util.List;

import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;
import com.bit.lib.dto.ReserveListDto;

public interface BookDetailService {

	
	void bookPage(Book book, BookStatus bookstatus);

}
