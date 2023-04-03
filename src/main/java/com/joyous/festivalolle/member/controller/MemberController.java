package com.joyous.festivalolle.member.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.joyous.festivalolle.member.service.IMemberService;

@Controller
// 회원정보 서비스 컨트롤러 클래스

public class MemberController {
	
	   
	@Autowired
	private IMemberService memberService;	// MemberService 객체
	
	private String view_pos = "member/";		// 뷰 저장 위치
	
	@GetMapping(value="/test/count")
	public String empCount(Model model) {
		model.addAttribute("count", memberService.countMember());
		return view_pos + "count";
	}
	
	//로그인 api
	@GetMapping(value="/member/loginapi")
	public String loginapi(HttpSession session) {
		return view_pos + "loginapi";
	}
	
	//로그인
	@GetMapping(value="/login")
	public String login(HttpSession session) {
		return view_pos + "login";
	}
	
	//마이페이지 화면
	@GetMapping(value="/mypage")
	public String mypage(HttpSession session, Locale locale) {
		return "member/mypage";
	}
	
	//회원정보 인증
	//@GetMapping(value="/mypage/confirm")
	//public String member(HttpSession session, Locale locale) {				
	//	return "member/confirm";
	//}
	
	//회원가입
	@GetMapping(value="/join")
	public String join(HttpSession session) {
		return view_pos + "join";
	}

	//id 찾기
	@GetMapping(value="/findId")
	public String findId(HttpSession session) {
		return view_pos + "findid";
	}

	//비밀번호 찾기
	@GetMapping(value="/findPw")
	public String findPw(HttpSession session) {
		return view_pos + "findpw";
	}
}

