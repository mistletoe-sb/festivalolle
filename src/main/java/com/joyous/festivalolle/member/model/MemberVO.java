package com.joyous.festivalolle.member.model;

import lombok.Data;

@Data
public class MemberVO {
	private int memberCode;			// 회원번호
	private String id;		// ID
	private String password;	// 비밀번호
	private String name;		// 이름
	private String mobile;		// 휴대폰 번호
	private String birth;		// 생년월일
	private int gender;			// 성별
	private int status;		// 회원 상태
}
