package com.bit.lib.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class User {
	
	private String id;
	private String name;
	private String pw;
	private Date birth;
	private String gender;
	private String phone;
}
