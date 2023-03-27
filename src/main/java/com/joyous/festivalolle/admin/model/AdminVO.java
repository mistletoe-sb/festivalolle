package com.joyous.festivalolle.admin.model;

import lombok.Data;

@Data
public class AdminVO {

	private int adminCode;
	private String id;
	private String password;
	private int organizationCode;
	private String name;
	private String telephone;
	private String email;
	private String requestTime;
	private String approveTime;
	private int status;
	
	//organization 테이블
	private String organizationName;
	private String address;
		
	
	
}
