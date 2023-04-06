package com.joyous.festivalolle.member.service;

import com.joyous.festivalolle.member.model.MemberVO;

public interface IMemberService2 {
	
	//회원가입
	int joinMember(MemberVO memberVO);
	
	//회원가입 시 중복확인
	//1. 아이디 중복 체크
	//2. 핸드폰 번호 중복 체크
	int overlapChk(MemberVO memberVO);

}
