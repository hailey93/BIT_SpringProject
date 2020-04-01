package com.bit.lib.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bit.lib.domain.User;

public interface UserDAO {
	User loginProc(User user);
	void logout(HttpSession session);
	void joinMember(User user);	
	User joinIdCheck(String id);
	
}
