package com.joyous.festivalolle.member.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.joyous.festivalolle.member.service.IMemberService;

@Controller
public class FindMemberInfoController {
	
	private String view_pos = "member/";		// 뷰 저장 위치
	   
	@Autowired
	private IMemberService memberService;

	//id 찾기
	@GetMapping(value="/findid")
	public String getfindId(HttpSession session) {
		return view_pos + "findid";
	}
			
	@PostMapping(value="/findid")
	public String postfindId(HttpSession session) {
		memberService.findId(view_pos, view_pos);
			return view_pos + "findidinfo";
	}

	//id 확인
	@GetMapping(value="/idinfo")
	public String findIdInfo(HttpSession session) {
		return view_pos + "findidinfo";
	}

	//비밀번호 찾기
	@GetMapping(value="/findpw")
	public String getFindPw(HttpSession session) {
		return view_pos + "findpw";
	}
		
	@PostMapping(value="/findpw")
	public String postFindPw(HttpSession session) {
		memberService.findPw(view_pos, view_pos);
		return view_pos + "findpw";
		}
		
	//비밀번호 변경
	@GetMapping(value="/pwinfo")
	public String findPwInfo(HttpSession session) {
		return view_pos + "findpwinfo";
	}
		
	@PostMapping(value="/pwinfo")
		public String postfindIdInfo(HttpSession session) {
			memberService.updatePassword(view_pos, view_pos);
			return view_pos + "findpwinfo";
	}
}
