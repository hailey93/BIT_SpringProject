package com.bit.lib.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.AdminDAO;
import com.bit.lib.domain.User;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired(required=false)
	AdminDAO adminDAO;
	
	@Override
	public boolean loginProc(User user) {
		
		return adminDAO.loginProc(user)!=null;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

}
