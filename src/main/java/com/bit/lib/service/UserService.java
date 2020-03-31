package com.bit.lib.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.lib.dto.User;

public interface UserService {
	boolean loginProc(User user);
	void logout(HttpSession session);
	void joinProc(User user);
	
	
}
