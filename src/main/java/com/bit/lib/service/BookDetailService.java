package com.bit.lib.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.lib.dto.BookDetailDTO;

public interface BookDetailService {

	List<BookDetailDTO> bookDetail(String bookTitle);
	
	List<BookDetailDTO> bookPage(String bookTitle);
	
	void bookRent(@Param("bookNo") String bookNo, @Param("id") String id);
	
	void bookstUpdate(String bookNo);

}
