package com.bit.lib.dao;

import java.util.List;

import com.bit.lib.dto.BookDetailDTO;

public interface BookDetailDAO {

	List<BookDetailDTO> bookDetail(int bookCode);
	
	List<BookDetailDTO> bookPage(int bookCode);
	

}
