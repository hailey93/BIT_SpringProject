package com.bit.lib.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WishListDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6469801003082570162L;
	private int wishListCode;
	private String bookNo;
	private String id;
	private String bookTitle;
	private String imagePath;
	private int rentStatus;
	
}
