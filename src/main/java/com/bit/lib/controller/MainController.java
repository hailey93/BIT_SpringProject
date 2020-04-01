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
	public String main() {
		return "main";
	}
	
	@GetMapping("/mainSearch")
	public String mainSearch(Model model, @RequestParam("query") String query) {
		
		model.addAttribute("searchBook", mainDAO.searchBook(query));
		System.out.println(mainDAO.searchBook(query));
		return "book/mainSearch";
		
	}
	
}
