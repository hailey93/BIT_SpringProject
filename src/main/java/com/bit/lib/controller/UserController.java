package com.bit.lib.controller;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.lib.domain.User;
import com.bit.lib.service.UserService;
import com.bit.lib.service.UserServiceImpl;
import com.mysql.cj.Session;

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
<<<<<<< HEAD
		session.setAttribute("user", user);  
		String nextPage = userService.loginProc(user)? "user/welcome":"user/login";
=======
		session.setAttribute("user", user);
		String nextPage = userService.loginProc(user)? "main":"user/login";
		
>>>>>>> d959cc0eb6d43d53ac5581c224491ed9cb256a7b
		return nextPage;
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/login";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "user/join";
	}	
	
	@RequestMapping("/joinIdCheck")
	public void joinIdCheck(HttpServletResponse res, @RequestParam("id") String id) throws IOException {
		userService.joinIdCheck(id, res);
	}
	
	@PostMapping("joinProcess")
	public String joinProcess(User user) {
		System.out.println(user);
		//userService.joinMember(user);
		return "/lib/user/login";
	}
	
	
	
}

