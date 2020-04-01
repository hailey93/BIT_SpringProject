package com.bit.lib.dao;

import java.util.List;

import com.bit.lib.domain.Book;

public interface MainDAO {
	
	List<Book> searchBook(String qeury);

	
}
