package com.bit.lib.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.lib.domain.User;

public interface UserService {
	boolean loginProc(User user);
	void logout(HttpSession session);
	void joinMember(User user);
	void joinIdCheck(String id, HttpServletResponse res) throws IOException;
	
	
}
