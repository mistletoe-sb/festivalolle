package com.joyous.festivalolle.member.service;

import com.joyous.festivalolle.member.model.MemberVO;

public interface IMemberService {
	int countMember();
	
	//회원 로그인
	MemberVO memberLogin(String id, String password);
	
}
