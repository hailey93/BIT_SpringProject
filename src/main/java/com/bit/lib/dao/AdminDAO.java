package com.bit.lib.dao;

import javax.servlet.http.HttpSession;

import com.bit.lib.domain.User;
import com.bit.lib.dto.NewBookDTO;

public interface AdminDAO {
	User loginProc(User user);
	void logout(HttpSession session);
	NewBookDTO newBookProc(NewBookDTO book); //book테이블에 도서등록
	NewBookDTO newBookInfo(NewBookDTO bookInfo); //등록한 db에서 bookcode,qty 빼오기
	NewBookDTO newBookProc2(NewBookDTO bs); //bookstatus테이블에 book테이블의 qty만큼 넣어주기
}
