package com.bit.lib.controller;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter.DEFAULT;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		session.setAttribute("user", user);  
		String nextPage = userService.loginProc(user)? "user/welcome":"user/login";
		return nextPage;
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/login";
	}
	
	@RequestMapping(value="/join.do", method = RequestMethod.GET)
	public String join(User user) {
		
		return "user/join";
	}	
	
	
	@RequestMapping(value = "/joinProcess")
	public String joinProcess(User user) {
		//System.out.println(user);
		userService.joinUser(user);
		
		
		return "user/login";
	}
	
	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value= "/idCheck.do", method = RequestMethod.GET)
	public String joinIdCheck(HttpServletRequest request)  {
		
		String id = request.getParameter("id");
		int result = userService.idCheck(id);
		
		 return Integer.toString(result);
	}
	
	

	
	//회원정보 상세 조회
	@RequestMapping("/viewUser.do")
	public String viewUser(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("user", userService.viewUser(id));
		return "mypage/userInfo/userInfo";
	}
	
	
	//회원정보 수정
	@RequestMapping("/updateUser.do")
	public String updateUser(@ModelAttribute User user) {
		userService.updateUser(user);
		return "mypage/userInfo/userUpdateView";
	}
	
	
	
}

