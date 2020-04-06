package com.bit.lib.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NewBookStatusDTO {

	
	private String bookNo;
	private int bookCode;
	private int rentStatus;
}
