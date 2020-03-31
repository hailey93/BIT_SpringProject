package com.bit.lib.controller;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.lib.domain.User;
import com.bit.lib.service.UserService;
import com.bit.lib.service.UserServiceImpl;



@Controller
public class UserController {
	private final static Logger logger = LoggerFactory.getLogger(UserController.class);
	UserService service = new UserServiceImpl();
	
	@Autowired
	UserService userService;
	
	@RequestMapping("login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value = "loginProc", method = RequestMethod.POST)
	public String loginProc(User user, HttpSession session) {
		
		session.setAttribute("id", user.getId());
		session.setAttribute("user", user);
		String nextPage = userService.loginProc(user)? "user/welcome":"user/login";
		
		return nextPage;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/welcome";
	}
	
	
	@RequestMapping("join.do")
	public String join() {
		return "user/join";
	}
	
	@RequestMapping(value="joinProc", method = RequestMethod.POST)
	public String joinProc(User user) throws Exception {
		userService.joinProc(user);
		return "user/join";
	}
	
}

