package com.joyous.festivalolle.member.service;

import com.joyous.festivalolle.member.model.MemberVO;

public interface IMemberService {
	int countMember();
	
	//회원 로그인
	MemberVO memberLogin(String id, String password);
	MemberVO findId(String name, String mobile); //id 조회- 작성자: 이혜성
	boolean findPw(String id); //비밀번호 조회- 작성자: 이혜성
	boolean selectAcountInfo(String name, String mobile); //계정정보 확인- 작성자: 이혜성
	MemberVO updatePassword(String password, String id); //비밀번호 변경- 작성자: 이혜성
}
