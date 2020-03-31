package com.bit.lib.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Book {

	private int bookcode;
	private String bookTitle;
	private String author;
	private String type;
	private String publisher;
	private String imagePath;
	private int bookQty;
	
}
