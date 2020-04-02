package com.bit.lib.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;
import com.bit.lib.domain.RentHistory;
import com.bit.lib.dto.BookDetailDTO;

public interface BookDetailDAO {

	List<BookDetailDTO> bookDetail(String bookTitle);
	
	List<BookDetailDTO> bookPage(String bookTitle);
	
	void bookRent(@Param("bookNo") String bookNo, @Param("id") String id);
	void bookstUpdate(String bookNo);
}
