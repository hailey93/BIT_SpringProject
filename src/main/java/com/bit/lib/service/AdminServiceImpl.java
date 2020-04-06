package com.bit.lib.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.AdminDAO;
import com.bit.lib.domain.User;
import com.bit.lib.dto.NewBookDTO;
import com.bit.lib.dto.NewBookStatusDTO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired(required=false)
	AdminDAO adminDAO;
	
	@Autowired(required=false)
	NewBookDTO newBookDTO;
	
	@Override
	public boolean loginProc(User user) {
		
		return adminDAO.loginProc(user)!=null;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void addBook(NewBookDTO newBookDTO) {

		adminDAO.addBookProc(newBookDTO); //book테이블에 도서등록
	}

	@Override
	public void addBookStatus(NewBookStatusDTO newBookStatusDTO) {
		
		adminDAO.selectBookInfo(newBookDTO); //등록한 book테이블에서 bookstatus에 넣어주기위한 bookcode,qty 빼오기
		System.out.println(adminDAO.selectBookInfo(newBookDTO));
		System.out.println(newBookDTO.getBookQty());
		
		for(int i=0;i<newBookDTO.getBookQty();i++) {//bookstatus테이블에 book테이블의 qty만큼 반복해서 넣어주기
			String bookNo="BC"+newBookDTO.getBookCode()+"BIT"+i;
			newBookStatusDTO.setBookNo(bookNo); //bookNo는 어떻게 넣어주지? bookNo를 셋해보자
			adminDAO.addBookProc2(newBookStatusDTO);  
		}
		
	}

}
