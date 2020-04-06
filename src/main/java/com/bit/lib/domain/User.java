package com.bit.lib.domain;


<<<<<<< HEAD


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
=======
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
>>>>>>> 044d96718f7fdc653d28ebfb491b1d1da38bda58
public class User {
	
	private String id;
	private String name;
	private String pw;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String gender;
	private String phone;
	
}
