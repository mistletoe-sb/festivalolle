package com.joyous.festivalolle.member.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.member.model.MemberVO;
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
	}//id 찾기 첫 페이지
	
	@PostMapping(value="/checkacount")
	public String checkAcount(String name, String mobile, Model model) {
	    boolean findAcount = memberService.selectAcountInfo(name, mobile);
	    System.out.println("/checkacount"+ model.addAttribute("name", name));
	    System.out.println("/checkacount"+ model.addAttribute("mobile", mobile));
	    if(findAcount) {
	    	MemberVO resultId = memberService.findId(name, mobile);
	        model.addAttribute("resultId", resultId);
	        return view_pos + "findidinfo";
	    } else {
	        return "redirect:/findid";
	    }
	}// id 찾기 계정유무, 해당 계정 ID 확인	
	
	//비밀번호 찾기
	@GetMapping(value="/findpw")
	public String getFindPw(HttpSession session) {
		return view_pos + "findpw";
	}// 비밀번호 찾기 페이지
		
	@PostMapping(value="/findpw")
	public String postFindPw(String id, Model model) {
		boolean findAcount = memberService.findPw (id);
		
		if(findAcount) {
		    model.addAttribute("id", id);
		    return view_pos + "findpwinfo";
		} else {
		    return view_pos + "findpw";
		}
	}// 비밀번호 찾기 계정조회
		
	//비밀번호 변경
	@GetMapping(value="/updatepw")
	public String updatePwInfo(HttpSession session) {
		return view_pos + "findpwinfo";
	}//비밀번호 변경 페이지
	
	@PostMapping(value="/updatepw")
		public MemberVO postUpdatePwInfo(String password, Model model) {
		 	
		String id = (String) model.getAttribute("id");
		 	
		MemberVO resultPw =memberService.updatePassword(password, id);
		model.addAttribute("resultPw", resultPw);
		model.addAttribute("resultPw", resultPw);
		    
			return resultPw;
	}//비밀번호 변경
}
