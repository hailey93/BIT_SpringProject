package com.bit.lib.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.lib.domain.User;

public interface UserService {
	boolean loginProc(User user);
	void logout(HttpSession session);
	//회원가입
	void joinUser(User user);
	//아이디 중복 체크
	int idCheck(String id);
	
	//회원정보보기
	User viewUser(String id);
	
	//회원정보 수정
	void updateUser(User user);
	
}
