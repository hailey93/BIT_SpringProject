package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.lib.dao.MainDAO;
import com.bit.lib.domain.Paging;

@Controller
public class MainController {
	
	@Autowired
	MainDAO mainDAO;
	
	@Autowired
	Paging paging;
	
	@GetMapping("/main")
	public String main(Model model) {
		model.addAttribute("mainView", mainDAO.mainView());
		model.addAttribute("mainViewCount", mainDAO.getMainView());
		System.out.println(mainDAO.getSearchBook(""));
		return "main";
	}
	
	
	@GetMapping("/mainSearch")
	public String mainSearch(Model model, 
			@RequestParam("keyWord") String keyWord,
			@RequestParam(required = false, defaultValue = "1")int page,
			@RequestParam(required = false, defaultValue = "0")int range) {		
		
		int listCnt = mainDAO.getSearchBook(keyWord);		
		paging.pageInfo(page, range, listCnt);
		
		System.out.println(page + "====" + range);
		System.out.println(paging);
		
		model.addAttribute("searchBook", mainDAO.searchBook(keyWord, paging.getStartList(),paging.getListSize()));	//검색	
		model.addAttribute("paging", paging); // 페이지 값 넘기기
		model.addAttribute("keyWord", keyWord); 
		
		
		return "book/mainSearch";
		
	}
}
