package com.joyous.festivalolle.member.repository;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.member.model.MemberVO;

public interface IMemberRepository {
	int countMember();
	
	MemberVO memberLogin(@Param("id") String id, @Param("password") String password);
	MemberVO findId(@Param("name") String name, @Param("mobile") String mobile); //id 조회- 작성자: 이혜성
	int findPw(@Param("id") String id, @Param("name") String name, @Param("mobile") String mobile); //비밀번호 찾기용 계정정보 조회- 작성자: 이혜성
	int selectAcountInfo(@Param("name") String name, @Param("mobile") String mobile); //아이디 찾기용 계정정보 조회- 작성자: 이혜성
	MemberVO updatePassword(@Param("password") String password, @Param("id") String id); //비밀번호 변경- 작성자: 이혜성
	MemberVO unactiveMember(@Param("password") String password, @Param("status") int status); //회원탈퇴- 작성자: 이혜성
	int findMember(@Param("password") String password); //회원탈퇴용 계정정보 조회- 작성자: 이혜성
	
	//=========================================================================================
	int countMember2(@Param("memberCode") int memberCode, @Param("password") String password);
	MemberVO selectMember(int memberCode);
	void updateMember(MemberVO memberVO);
	void updatePassword2(@Param("memberCode") int memberCode, @Param("password") String password);
	void updateStatus(int memberCode);
	
	//=========================================================================================
	//회원가입
	int joinMember(MemberVO memberVO);
	
	//회원가입 시 중복확인
	//1. 아이디 중복 체크
	//2. 핸드폰 번호 중복 체크
	int overlapChk(MemberVO memberVO);
}	
