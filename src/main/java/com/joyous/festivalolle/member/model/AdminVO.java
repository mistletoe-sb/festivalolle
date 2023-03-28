package com.joyous.festivalolle.member.model;
import lombok.Data;

//관리자 VO
//작성자: 이혜성

@Data
public class AdminVO {
	
	private int adminCode;			//관리자 코드
	private int id;					//관리자 id
	private int password;			//관리자 비밀번호
	private int organizationCode;	//기관코드
	private String name;			//관리자 이름
	private String telephone;		//관리자 전화번호
	private String email;			//관리자 메일
	private String requestTime;	//요청일시
	private String approveTime;	//허가일시
	private int status;				//관리자 상태
}
