package com.joyous.festivalolle.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.member.repository.IMemberRepository;
import com.joyous.festivalolle.member.repository.IMemberRepository2;

@Service
public class MemberService2 implements IMemberService2 {

	//작성자: 이기쁨
	
	@Autowired
	private IMemberRepository2 memberRepository2;
	//작성자: 이기쁨
	//회원가입
	public int joinMember(MemberVO memberVO) {
		return memberRepository2.joinMember(memberVO);
	}

	//회원가입 시 중복확인
	//1. 아이디 중복 체크
	//2. 핸드폰 번호 중복 체크
	@Override
	public int overlapChk(MemberVO memberVO) {
		return  memberRepository2.overlapChk(memberVO);
	}
	
}
