package com.joyous.festivalolle.member.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.admin.controller.AdminController;
import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.member.service.IMemberService;

@Controller
// 회원정보 서비스 컨트롤러 클래스

public class MemberController {
	private final Logger logger = LoggerFactory.getLogger(AdminController.class);
	   
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
	
	@PostMapping(value="/login")
	@ResponseBody
	public String login(String id, String password, HttpSession session, Model model, Locale locale) {		
		logger.info(id, locale);
		
		MemberVO memberVO = new MemberVO();
		memberVO = memberService.memberLogin(id, password);
	
		if(memberVO != null) {
			int memberType = memberVO.getStatus();
			if(memberType == 0) {
				session.setAttribute("loginUser", memberVO);		//세션에 VO 담아줌	
				return "ok";			
			} else if(memberType == 1) {							
				return "fail";
			}
		} else {
			return "fail";
		}
		return "fail";
	}
	
	
	//마이페이지 화면
	@GetMapping(value="/mypage")
	public String mypage(HttpSession session, Locale locale) {
		return "member/mypage";
	}
	

	
	//회원가입
	@GetMapping(value="/join")
	public String join(HttpSession session) {
		return view_pos + "join";
	}


}

