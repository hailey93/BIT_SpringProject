package com.bit.lib.dao;

import java.util.List;

import com.bit.lib.domain.Book;
import com.bit.lib.domain.Paging;

public interface MainDAO {
	
	int getSearchBook(String keyWord);
	List<Book> searchBook(Paging paging);
	List<Book> mainView();
	
}
