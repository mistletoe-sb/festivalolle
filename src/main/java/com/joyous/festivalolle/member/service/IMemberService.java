package com.joyous.festivalolle.member.service;

import com.joyous.festivalolle.member.model.MemberVO;

public interface IMemberService {
	int countMember();
	
	//회원 로그인
	MemberVO memberLogin(String id, String password);
	MemberVO findId(String id, String mobile); //id 조회- 작성자: 이혜성
	MemberVO findPw(String password, String id); //비밀번호 조회- 작성자: 이혜성
	
	void updatePassword(String password, String id); //비밀번호 변경- 작성자: 이혜성
}
