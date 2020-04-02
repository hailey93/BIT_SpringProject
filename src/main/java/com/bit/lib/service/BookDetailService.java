package com.bit.lib.service;

import java.util.List;

import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;
import com.bit.lib.dto.BookDetailDTO;
import com.bit.lib.dto.ReserveListDTO;

public interface BookDetailService {

	List<BookDetailDTO> bookDetail(String bookTitle);
	
	List<BookDetailDTO> bookPage(String bookTitle);

}
