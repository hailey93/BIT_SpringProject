package com.bit.lib.service;

import javax.servlet.http.HttpSession;

import com.bit.lib.domain.User;

public interface AdminService {
	boolean loginProc(User user);
	void logout(HttpSession session);
}
