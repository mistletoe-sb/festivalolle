package com.joyous.festivalolle.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joyous.festivalolle.member.service.IMemberService;

@Controller
// 회원정보 서비스 컨트롤러 클래스
// 작성자 : 정재웅
public class AdminController {
	
	   
	@Autowired
	private IMemberService memberService;	// MemberService 객체
	
	private String view_pos = "admin/";		// 뷰 저장 위치
	
	
	@RequestMapping(value="/index")
	public String index() {
		return view_pos + "index";
	}
	
	@RequestMapping(value="/loginform")
	public String loginform() {
		return  view_pos + "loginform";
	}
	


}

