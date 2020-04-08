package com.bit.lib.domain;

import org.springframework.context.annotation.Configuration;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Configuration
public class Paging {
	
	private int listSize = 6; // 검색 목록수 6개 지정
	private int pageSize = 5; // 페이지 범위 5쪽 지정
	private int startList; //페이지 목록 검색 번호
	private int page; //현재 페이지
	private int range;
	private int listCnt; // 검색한 목록 총 개수
	private int pageCnt; // 총 페이지수 저장
	private int startPage; //검색 게시물 시작 번호
	private int endPage; // 검색 게시물 마지막 번호
	private boolean prev; // 이전 페이지 목록
	private boolean next; // 다음 페이지 목록
	
	public void pageInfo(int page,int range, int listCnt) {
		
		this.page = page; //현재 페이지
		this.listCnt = listCnt; // 전체 게시물 갯수
		
		//전체 페이지수 
		this.pageCnt = (int) Math.ceil(listCnt/listSize); 

		//페이지 목록 검색 번호
		this.startList = (page - 1) * listSize;
		
		//시작 목록 번호
		this.startPage = (page - 1) * pageSize + 1 ;
		
		//마지막 목록 번호
		this.endPage = (page-1) * pageSize + 6;

		//이전 버튼 상태
		this.prev = pageSize == 1 ? false : true;
		
		//다음 버튼 상태
		this.next = endPage < listCnt ? true : false;
		 
	}
}
