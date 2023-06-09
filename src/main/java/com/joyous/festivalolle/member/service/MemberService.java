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

	@Override
	public MemberVO findId(String name, String mobile) {

		return memberRepository.findId(name, mobile);
	}//아이디 찾기- 작성자: 이혜성

	@Override
	public MemberVO updatePassword(String password, String id) {
		return memberRepository.updatePassword(password, id);
	}// 비밀번호 변경- 작성자: 이혜성

	@Override
	public boolean findPw(String id, String name, String mobile) {
		
		int exist = memberRepository.findPw(id, name, mobile);
		if(exist == 1) {
			 return true;
		 }else {
			 return false;
		 }
	}//비밀번호 변경용 계정조회- 작성자: 이혜성

	@Override
	public boolean selectAcountInfo(String name, String mobile) {
		
		 int exist = memberRepository.selectAcountInfo(name, mobile);
		 
		 if(exist == 1) {
			 return true;
		 }else {
			 return false;
		 }
}//아이디 찾기용 계정조회- 작성자: 이혜성

	@Override
	public MemberVO unactiveMember(String password, int status) {
		
		return memberRepository.unactiveMember(password, status);
	}//회원탈퇴- 작성자: 이혜성

	@Override
	public boolean findMember(String password) {
		int exist = memberRepository.findMember(password);
		if(exist == 1) {
			 return true;
		 }else {
			 return false;
		 }
	}//회원탈퇴용 계정조회- 작성자: 이혜성
	
	
	
	//=========================================================================================
	@Override
	public int countMember(int memberCode, String password) {
		int countMember = memberRepository.countMember2(memberCode, password);
		return countMember;
	}

	@Override
	public MemberVO selectMember(int memberCode) {
		MemberVO selectMember = memberRepository.selectMember(memberCode);
		return selectMember;
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		memberRepository.updateMember(memberVO);
	}

	@Override
	public void updatePassword(int memberCode, String password) {
		memberRepository.updatePassword2(memberCode, password);
	}

	@Override
	public void updateStatus(int memberCode) {
		memberRepository.updateStatus(memberCode);
	}
	
	//작성자: 이기쁨
	//회원가입
	@Override
	public int joinMember(MemberVO memberVO) {
		return memberRepository.joinMember(memberVO);
	}

	//회원가입 시 중복확인
	//1. 아이디 중복 체크
	//2. 핸드폰 번호 중복 체크
	@Override
	public int overlapChk(MemberVO memberVO) {
		return  memberRepository.overlapChk(memberVO);
	}
}
