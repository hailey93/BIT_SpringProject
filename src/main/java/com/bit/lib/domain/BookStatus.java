package com.bit.lib.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookStatus {
	
	private String bookNo;
	private int bookCode;
	private int rentStatus;
	private String id;
}
