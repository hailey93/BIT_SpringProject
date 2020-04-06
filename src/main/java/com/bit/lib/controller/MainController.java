package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.lib.dao.MainDAO;
import com.bit.lib.domain.Paging;

import lombok.extern.java.Log;

@Controller
@Log
public class MainController {
	
	@Autowired
	MainDAO mainDAO;
	
	@GetMapping("/main")
	public String main(Model model) {
		model.addAttribute("mainView", mainDAO.mainView());
		return "main";
	}
	
	
	@GetMapping("/mainSearch")
	public String mainSearch(Model model, 
			@RequestParam("keyWord") String keyWord,
			@RequestParam(required = false, defaultValue = "1")int page,
			@RequestParam(required = false, defaultValue = "1")int range) {
		
		int listCnt = mainDAO.getSearchBook(keyWord);
		
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		paging.setKeyWord(keyWord);
		
		model.addAttribute("searchBook", mainDAO.searchBook(paging));		
		model.addAttribute("paging", paging);
		
		
		return "book/mainSearch";
		
	}
}
