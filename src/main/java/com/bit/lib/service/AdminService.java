package com.bit.lib.service;

import javax.servlet.http.HttpSession;

import com.bit.lib.domain.User;
import com.bit.lib.dto.NewBookDTO;
import com.bit.lib.dto.NewBookStatusDTO;

public interface AdminService {
	boolean loginProc(User user);
	void logout(HttpSession session);
	void addBook(NewBookDTO newBookDTO);
	void addBookStatus(NewBookStatusDTO newBookStatusDTO);
}
