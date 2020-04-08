package com.bit.lib.service;

import java.util.List;

import com.bit.lib.dto.BookDetailDTO;

public interface BookDetailService {

	List<BookDetailDTO> bookDetail(String bookTitle);
	
	List<BookDetailDTO> bookPage(String bookTitle);
	
	int rentCount(String id);


}
