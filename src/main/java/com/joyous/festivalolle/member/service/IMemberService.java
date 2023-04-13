package com.joyous.festivalolle.member.service;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.member.model.MemberVO;

public interface IMemberService {
	int countMember();
	
	//회원 로그인
	MemberVO memberLogin(String id, String password);
	MemberVO findId(String name, String mobile); //id 조회- 작성자: 이혜성
	boolean findPw(String id, String name, String mobile); //비밀번호 조회- 작성자: 이혜성
	boolean selectAcountInfo(String name, String mobile); //계정정보 확인- 작성자: 이혜성
	MemberVO updatePassword(String password, String id); //비밀번호 변경- 작성자: 이혜성
	MemberVO unactiveMember(String password, int status); //회원탈퇴- 작성자: 이혜성
	boolean findMember(String password); //회원탈퇴용 계정정보 조회- 작성자: 이혜성

	//=========================================================================================
	int countMember(int memberCode, String password);
	MemberVO selectMember(int memberCode);
	void updateMember(MemberVO memberVO);
	void updatePassword(int memberCode, String password);
	void updateStatus(int memberCode);
}
