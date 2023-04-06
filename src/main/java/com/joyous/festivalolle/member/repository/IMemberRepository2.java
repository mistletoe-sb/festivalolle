package com.joyous.festivalolle.member.repository;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.member.model.MemberVO;

//작성자 이기쁨
public interface IMemberRepository2 {
	
	//MemberVO memberLogin(@Param("id") String id, @Param("password") String password);
	
	//회원가입
	int joinMember(MemberVO memberVO);
	
	//회원가입 시 중복확인
	//1. 아이디 중복 체크
	//2. 핸드폰 번호 중복 체크
	int overlapChk(MemberVO memberVO);
	
}	
