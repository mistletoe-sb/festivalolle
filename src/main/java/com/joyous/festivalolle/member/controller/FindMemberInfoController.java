package com.joyous.festivalolle.member.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String checkAcount(String name, String mobile, Model model, RedirectAttributes redirectattribute) {
	    boolean findAcount = memberService.selectAcountInfo(name, mobile);
	    System.out.println("/checkacount"+ model.addAttribute("name", name));
	    System.out.println("/checkacount"+ model.addAttribute("mobile", mobile));
	    if(findAcount) {
	    	MemberVO resultId = memberService.findId(name, mobile);
	        model.addAttribute("resultId", resultId);
	        return view_pos + "findidinfo";
	    } else {
	    	String message = "입력하신 정보와 일치하는 아이디가 없습니다.";
			redirectattribute.addFlashAttribute("message" , message);
	        return "redirect:/findid";
	    }
	}// id 찾기 계정유무, 해당 계정 ID 확인	
	
	//비밀번호 찾기
	@GetMapping(value="/findpw")
	public String getFindPw(HttpSession session) {
		return view_pos + "findpw";
	}// 비밀번호 찾기 페이지
		
	@PostMapping(value="/findpw")
	public String postFindPw(String id,String name, String mobile, HttpSession session, Model model, RedirectAttributes redirectattribute) {
	    boolean findAcount = memberService.findPw (id, name, mobile);
	    session.setAttribute("id", id); // session에 id 값 저장
	    if(findAcount) {
	        return view_pos + "findpwinfo";
	    } else {
	    	String message = "입력하신 정보와 일치하는 계정이 없습니다.";
			redirectattribute.addFlashAttribute("message" , message);
	        return "redirect:/findpw";
	    }
	}// 비밀번호 찾기 계정조회
	
	@PostMapping(value="/updatepw")
	public String postUpdatePwInfo(@RequestParam("password") String password, HttpSession session, Model model) {
	    String id = (String)session.getAttribute("id"); // session에서 id 값 꺼냄
	    MemberVO resultPw = memberService.updatePassword(password, id);
	    model.addAttribute("resultPw", resultPw);
	    return "redirect:/login";
	}//비밀번호 변경
	
	@GetMapping(value="/secession")
	public String secessionMembership(HttpSession session) {
		return view_pos + "unactivemember";
	}//회원탈퇴 페이지
	
	@PostMapping(value="/secession")
	public String unactiveMember(String password, String status, HttpSession session, 
			Model model, RedirectAttributes redirectattribute) {
		boolean findAcount = memberService.findMember(password);
		if(findAcount) {
			MemberVO resultPassword = memberService.unactiveMember(password, status);
			model.addAttribute("resultPassword", resultPassword);
			return view_pos + "모달창";
		}else {
			String message = "입력하신 정보가 계정과 일치하지 않습니다.";
			redirectattribute.addFlashAttribute("message" , message);
			return "redirect:/secession";
		}		
	}//탈퇴계정 확인 및 회원탈퇴
}
