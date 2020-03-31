package com.bit.lib.dao;

import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;

public interface BookDetailDAO {

	
	void bookPage(Book book, BookStatus bookstatus);
}
