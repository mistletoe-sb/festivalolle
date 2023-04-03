package com.joyous.festivalolle.member.repository;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.member.model.MemberVO;

public interface IMemberRepository {
	int countMember();
	
	MemberVO memberLogin(@Param("id") String id, @Param("password") String password);
	
}	
