package com.joyous.festivalolle.admin.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.admin.service.AdminService;
import com.joyous.festivalolle.admin.service.IAdminService;

//작성자: 이기쁨
@Controller
public class AdminController {
	
	private final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	IAdminService adminService;
	
	//관리자 홈화면으로 이동
	@GetMapping(value="/admin/main")
	public String login() {
		return "adminindex";
	}
	
	//관리자 로그인화면으로 이동
	@GetMapping(value="/admin")
	public String login(Model model, HttpSession session) {
		return "admin/login";
	}
	
	//관리자 로그인
	/*
	@PostMapping(value="/admin")
	public String login(String id, String password, HttpSession session, Model model, Locale locale) {		
		AdminVO adminVO = new AdminVO();
		adminVO = adminService.adminLogin(id, password);
	
		if(adminVO != null) {
			int adminType = adminVO.getStatus();
			if(adminType == 0) {
				session.setAttribute("loginAdmin", adminVO);		//관리자타입 1번: 시스템 관리자
				return "redirect:/system/adminlist";			
			} else if(adminType == 2) {				
				session.setAttribute("loginAdmin", adminVO);		//관리자타입 2번: 일반관리자		
				return "redirect:/admin/festivallist";
			} else if(adminType == 3) {								//관리자타입 3번: 입장권 관리자
				session.setAttribute("loginAdmin", adminVO);					
				return "ticket/ticketvalidator";
			} else if(adminType == 4) {								//관리자타입 4번: 쿠폰 사용 관리자
				session.setAttribute("loginAdmin", adminVO);					
				return "ticket/couponvalidator";
			}
		} else {
			System.out.println("로그인 실패");
		}
		return "admin";
	}
	*/
	
	@PostMapping(value="/admin")
	@ResponseBody
	public String login(String id, String pw, HttpSession session, Model model, Locale locale) {		
		AdminVO adminVO = new AdminVO();
		adminVO = adminService.adminLogin(id, pw);
		logger.info(id);
	
		if(adminVO != null) {
			logger.info("vo 받아옴");
			int adminType = adminVO.getStatus();
			if(adminType == 0) {
				session.setAttribute("loginAdmin", adminVO);		//관리자타입 0번: 시스템 관리자
				return "admin0";			
			} else if(adminType == 2) {				
				session.setAttribute("loginAdmin", adminVO);		//관리자타입 2번: 일반관리자		
				return "admin2";
			} else if(adminType == 3) {								//관리자타입 3번: 입장권 관리자
				session.setAttribute("loginAdmin", adminVO);					
				return "admin3";
			} else if(adminType == 4) {								//관리자타입 4번: 쿠폰 사용 관리자
				session.setAttribute("loginAdmin", adminVO);					
				return "admin4";
			}
		} else {
			logger.info("로그인 실패");
			return "fail";
		}
		return "fail";
	}
	
	
	
	
	
	
	
	
	
	//로그아웃
	@GetMapping(value="/admin/logout")
	public String logout(HttpSession session, Model model, Locale locale) {
		logger.info("세션 파기 전", locale);
		session.invalidate();
		//logger.info("세션 파기 후", locale);
		return "redirect:/admin";
	}
	
	//아이디 찾기 페이지로 이동
	@GetMapping(value="/admin/findid")
	public String findId(Locale locale) {
		return "admin/findid";
	}
	
	//아이디 찾기 ajax
	@PostMapping(value="/admin/findid")
	@ResponseBody
	public String findId(String name, String telephone, AdminVO adminVO, Locale locale, Model model) {
		String matchId = adminService.findId(name, telephone);
		model.addAttribute("matchId", matchId);
		return (matchId == null)? "fail" : matchId;
	}
	
	//아이디 찾기 결과
	@GetMapping(value="/admin/idresult")
	public String idResult(Locale locale) {
		return "admin/idresult";
	}
	
	
	
	//비밀번호 변경 페이지로 이동
	@GetMapping(value="/admin/forgotpassword")
	public String password(Locale locale) {
		//logger.info("문자보내기");
		NaverSENS2 sens = new NaverSENS2();
		//sens.sendSMS();
		
		return "admin/forgotpassword";
	}
	
	
	//문자 보내기
	@PostMapping(value="/admin/message")
	@ResponseBody
	public String phoneAuth(String tel) {
		AdminService service = new AdminService();
		System.out.println("문자보내러왔다.");
		logger.info("문자보내기");

		service.sendRandomMessage(tel);
		logger.info("문자 보냈따!");
	    return "ok";
	}
	
	//문자보내기 실험
	@GetMapping(value="/send")
	public String sendMessage(Model model, HttpSession session) {
		return "admin/send";
	}
	
	
	
	
	
	
	
	
	
	//관리자 회원가입 페이지로 이동
	@GetMapping(value="/admin/toregister")
	public String register(Model model, HttpSession session) {
		return "admin/register";
	}
	
	//관리자 회원가입 실행
	@PostMapping(value="/admin/register")
	@ResponseBody
	public String register(@RequestBody AdminVO adminVO, Locale locale) {		
		logger.info("관리자 회원가입 실행", locale);
		return (adminService.registerAdmin(adminVO) == 1)? "ok":"fail";
	}
	
	//id 중복 체크
	@PostMapping(value="/admin/idchk")
	@ResponseBody
	public String idChk(String id, Locale locale) {
		//0이면 사용 가능, 1이면 사용 불가		
		AdminVO adminVO = new AdminVO();
		adminVO.setId(id);		
		return (adminService.overlapChk(adminVO) == 0)? "ok":"fail";
	}
	
	//이메일 중복체크
	@PostMapping(value="/admin/emailchk")
	@ResponseBody
	public String emailChk(String email, Locale locale) {
		//0이면 사용 가능, 1이면 사용 불가		
		AdminVO adminVO = new AdminVO();
		adminVO.setEmail(email);		
		return (adminService.overlapChk(adminVO) == 0)? "ok":"fail";
	}
	
	//회원가입 휴대폰번호 중복 체크
	@PostMapping(value="/admin/phonechk")
	@ResponseBody
	public String phoneChk(String telephone, Locale locale) {
		//0이면 사용 가능, 1이면 사용 불가		
		AdminVO adminVO = new AdminVO();
		adminVO.setTelephone(telephone);		
		return (adminService.overlapChk(adminVO) == 0)? "ok":"fail";
	}
	
	
	
	//관리자 등록: 기관 코드 가져오기
	@PostMapping(value="/admin/organizationcode")
	@ResponseBody
	public int phoneNumberChk(String organizationName, Locale locale) {
		//기관명 받아서 기관 코드 return					
		return adminService.organizationCode(organizationName);
	}
	


	//각 항목으로 이동
	
	// @GetMapping(value="/admin/festivallist") 
	 //public String festivalList(Model model, HttpSession session) { return "admin/adminhome"; }
	 

	

}
