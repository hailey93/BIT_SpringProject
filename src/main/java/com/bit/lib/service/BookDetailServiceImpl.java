package com.bit.lib.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.BookDetailDAO;
import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;
import com.bit.lib.domain.RentHistory;
import com.bit.lib.dto.BookDetailDTO;
import com.bit.lib.dto.ReserveListDTO;



@Service("bookDetailService")
public class BookDetailServiceImpl implements BookDetailService {

	@Autowired
	private BookDetailDAO bookdetailDao;

	@Override
	public List<BookDetailDTO> bookPage(String bookTitle) {
		// TODO Auto-generated method stub
		return bookdetailDao.bookPage(bookTitle);
	}

	@Override
	public List<BookDetailDTO> bookDetail(String bookTitle) {
		// TODO Auto-generated method stub
		return bookdetailDao.bookDetail(bookTitle);
	}

	@Override
	public void bookRent(@Param("bookNo") String bookNo, @Param("id") String id) {
		// TODO Auto-generated method stub
		bookdetailDao.bookRent(bookNo, id);
	}

	@Override
	public void bookstUpdate(String bookNo) {
		// TODO Auto-generated method stub
		bookdetailDao.bookstUpdate(bookNo);
	} 
	

	


}
