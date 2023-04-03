package com.joyous.festivalolle.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.member.repository.IMemberRepository;

@Service
// 회원정보 관련 서비스 구현 클래스
// 작성자 : 정재웅
public class MemberService implements IMemberService {

	@Autowired
	private IMemberRepository memberRepository;	// MemberDAO 객체

	@Override
	public int countMember() {
		return memberRepository.countMember();
	}
	
	//회원 로그인
	@Override
	public MemberVO memberLogin(String id, String password) {
		return memberRepository.memberLogin(id, password);
	}
	
	

}
