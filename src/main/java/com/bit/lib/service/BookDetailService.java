package com.bit.lib.service;

import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;

public interface BookDetailService {

	
	void bookPage(Book book, BookStatus bookstatus);
}
