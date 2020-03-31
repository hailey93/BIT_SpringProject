package com.bit.lib.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WishListDTO {

	private String bookNo;
	private String id;
	private String bookTitle;
	private String imagePath;
	private int rentStatus;
	
}
