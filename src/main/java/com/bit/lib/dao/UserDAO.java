package com.bit.lib.dao;

import javax.servlet.http.HttpSession;

import com.bit.lib.dto.User;

public interface UserDAO {
	
	User loginProc(User user);
	void logout(HttpSession session);
	User joinProc(User user);
	
}
