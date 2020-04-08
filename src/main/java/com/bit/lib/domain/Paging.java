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
	private int startList; //해당 페이지 목록 시작 번호
	private double listCnt; // 검색한 목록 총 개수
	private int page; //현재 페이지
	private int range;
	private int pageCnt; // 전체 페이지 개수
	private boolean prev; // 이전 페이지 목록
	private boolean next; // 다음 페이지 목록	
	
	public void pageInfo(int page,int range, int listCnt) {
		
		this.page = page;
		
		this.range = range;		
		
		this.listCnt = listCnt; // 전체 게시물 갯수
		
		//전체 페이지수 
		this.pageCnt = (int)Math.ceil(this.listCnt/listSize);
		
		//페이지 목록 검색 번호
		this.startList = (page + range - 1) * listSize;
		
		//이전 버튼 상태
		this.prev = range == 0 ? false : true;
		
		//다음 버튼 상태
		this.next = range+5 > this.pageCnt ? false : true;
		 
	}
}
