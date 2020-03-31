package com.bit.lib.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.BookDetailDAO;
import com.bit.lib.domain.Book;
import com.bit.lib.domain.BookStatus;



@Service("bookDetailService")
public class BookDetailServiceImpl implements BookDetailService {

	@Autowired
	private BookDetailDAO bookdetailDao;

	@Override
	public void bookPage(Book book, BookStatus bookstatus) {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
