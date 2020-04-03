package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.lib.dao.MainDAO;

@Controller
public class MainController {
	
	@Autowired
	MainDAO mainDAO;
	
	@GetMapping("/main")
	public String main(Model model) {
		model.addAttribute("mainView", mainDAO.mainView());
		return "main";
	}
	
<<<<<<< HEAD
=======
	@GetMapping("/mainSearch")
	public String mainSearch(Model model, @RequestParam("keyWord") String keyWord) {
		

		model.addAttribute("keyWord", keyWord);
		model.addAttribute("searchBook", mainDAO.searchBook(keyWord));
		System.out.println(mainDAO.searchBook(keyWord));
		
		return "book/mainSearch";
		
	}
	
>>>>>>> YouHJ
}
