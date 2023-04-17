package com.joyous.festivalolle.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.member.service.IMemberService;

@Controller
public class FindMemberInfoController {
	
	private String view_pos = "member/";		// 뷰 저장 위치
	private String mypage_view_pos = "mypage/";		// 뷰 저장 위치
	   
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
	
	@GetMapping(value="/withdrawal")
	public String secessionMembership(HttpSession session) {
		return view_pos + "withdrawal";
	}//회원탈퇴 페이지
	
	@GetMapping(value="/withdrawalmodal")
	public String withdrawal(HttpSession session){
		return  view_pos + "withdrawalalert";
	}
	
	@PostMapping(value="/withdrawal")
	public String withdrawal(HttpSession session, String password,
			Model model, RedirectAttributes redirectattribute) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		int status = memberVO.getStatus();
		boolean findAcount = memberService.findMember(password);
		if(findAcount) {
			MemberVO resultPassword = memberService.unactiveMember(password, status);
			model.addAttribute("resultPassword", resultPassword);
			return "redirect:/withdrawalmodal";
		}else {
			String message = "입력하신 정보가 계정과 일치하지 않습니다.";
			redirectattribute.addFlashAttribute("message" , message);
			return "redirect:/withdrawal";
		}	
	}//탈퇴계정 확인 및 회원탈퇴 modal
	
	//비밀번호 수정- 마이페이지
	@GetMapping(value="/changepw")
	public String getChangePw(HttpSession session) {
		return view_pos + "changepw";
	}// 비밀번호 수정 페이지
		
	@PostMapping(value="/changepw")
	public String postChangePw(@RequestParam("password") String password, HttpSession session, Model model) {
		String id = (String)session.getAttribute("id"); // session에서 id 값 꺼냄
		MemberVO resultPw = memberService.updatePassword(password, id);
		model.addAttribute("resultPw", resultPw);
		return "redirect:/login";
	}//비밀번호 변경
	

	//=============================================================================================
		@GetMapping(value="/memberauthentication")
		public String memberAuthentication(HttpSession session) {
			return mypage_view_pos + "memberauthentication";
		}
		//=============================================================================================
		@GetMapping("/countmember")
		@ResponseBody
		public int countMember(HttpSession session, @RequestParam("password") String password) {				

			MemberVO memberVO = (MemberVO) session.getAttribute("loginUser"); 
			int memberCode = memberVO.getMemberCode();
			int countMember = memberService.countMember(memberCode,password);
			
			return countMember;	
		}
		//=============================================================================================
		@GetMapping(value="/profilemenu")
		public String profileMenu(HttpSession session) {
			return mypage_view_pos + "profilemenu";
		}
		//=============================================================================================		
		@GetMapping(value="/memberupdateform")
		public String memberUpdateForm(HttpSession session, Model model) {
			MemberVO memberVO = (MemberVO) session.getAttribute("loginUser"); 
			int memberCode = memberVO.getMemberCode();
			model.addAttribute("memberVO", memberVO);
			
			return mypage_view_pos + "memberupdate";
		}
		//=============================================================================================		
		@PostMapping(value="/memberupdate")
		public String memberUpdate(HttpSession session, Model model, MemberVO vo) {
			MemberVO memberVO = (MemberVO) session.getAttribute("loginUser"); 
			int memberCode = memberVO.getMemberCode();
			vo.setMemberCode(memberCode);
			memberService.updateMember(vo);
			return view_pos+"mypage";
		}
		
		//=============================================================================================	
		@GetMapping("/passwordupdateform")
		public String passwordUpdateForm(HttpSession session) {
			return mypage_view_pos + "passwordupdate";
		}
		
		//=============================================================================================		
		@PostMapping(value="/passwordupdate")
		public String passwordUpdate(HttpSession session, Model model, MemberVO vo) {
			MemberVO memberVO = (MemberVO) session.getAttribute("loginUser"); 
			int memberCode = memberVO.getMemberCode();
			String password = vo.getPassword();
			memberService.updatePassword(memberCode,password);
			session.invalidate();
			return "redirect:/login";
		}
		
		//=============================================================================================	
		@GetMapping("/secessionmemberform")
		public String secessionMemberform(HttpSession session) {
			return mypage_view_pos + "secessionmember";
		}
		
		//=============================================================================================	
		@GetMapping("/updateStatus")
		public String updateStatus(HttpSession session) {
			MemberVO memberVO = (MemberVO) session.getAttribute("loginUser"); 
			int memberCode = memberVO.getMemberCode();
			memberService.updateStatus(memberCode);
			session.invalidate();
			return "redirect:/login";
		}
	
}
