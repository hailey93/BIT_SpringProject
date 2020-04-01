package com.bit.lib.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.UserDAO;
import com.bit.lib.domain.User;

@Service("userService")
public class UserServiceImpl implements UserService {

		@Autowired
		UserDAO userDAO;

		@Override
		public boolean loginProc(User user) {
			// TODO Auto-generated method stub
			return userDAO.loginProc(user)!=null;
		}

		@Override
		public void logout(HttpSession session) {
			// TODO Auto-generated method stub
			session.invalidate();
		}

		@Override
		public void joinMember(User user) {
			// TODO Auto-generated method stub
		}

		@Override
		public void joinIdCheck(String id, HttpServletResponse res) throws IOException {
			User  user = new User();
			user = userDAO.joinIdCheck(id);
			
			if(user == null) {
				res.getWriter().print("1");
			} else {
				res.getWriter().print("0");
			}
			
		}

		

		
		
}
