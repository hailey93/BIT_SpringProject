package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.lib.domain.User;
import com.bit.lib.dto.NewBookDTO;
import com.bit.lib.dto.NewBookStatusDTO;
import com.bit.lib.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired(required=false)
	AdminService adminService;

	@Autowired(required=false)
	NewBookStatusDTO newBookStatusDTO;
	
	@RequestMapping("admLogin.do")
	public String login() {
		
		return "admin/login";
	}
	
	@PostMapping(value = "admLoginProc.do")
	public String getLogin(User user) {
		
		return adminService.loginProc(user)? "admin/adminMain":"admin/login";
	}
	
	@RequestMapping("newBook.do")
	public String getNewBook() {
		return "admin/newBook";
	}
	
	@PostMapping(value="addBook.do")
	public String getaddbook(NewBookDTO book) {
		adminService.addBook(book);
		
		return "admin/adminMain";
	}
}
