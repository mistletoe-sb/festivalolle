package com.joyous.festivalolle.member.repository;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.member.model.MemberVO;

public interface IMemberRepository {
	int countMember();
	
	MemberVO memberLogin(@Param("id") String id, @Param("password") String password);
	MemberVO findId(@Param("id") String id, @Param("mobile") String mobile); //id 조회- 작성자: 이혜성
	MemberVO findPw(@Param("password") String password, @Param("Wid") String id); //비밀번호 조회- 작성자: 이혜성
	void updatePassword(@Param("password") String password, @Param("id") String id); //비밀번호 변경- 작성자: 이혜성
}	
