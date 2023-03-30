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
import com.joyous.festivalolle.admin.service.IAdminService;

//작성자: 이기쁨
@Controller
public class AdminController {
	
	private final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	IAdminService adminService;
	
	//관리자 로그인화면으로 이동
	@GetMapping(value="/admin")
	public String login(Model model, HttpSession session) {
		return "admin/login";
	}
	
	//관리자 로그인
	//@RequestMapping(value="/admin", method=RequestMethod.POST)	
	@PostMapping(value="/admin")
	public String login(String id, String password, HttpSession session, Model model, Locale locale) {		
		AdminVO adminVO = new AdminVO();
		adminVO = adminService.adminLogin(id, password);
	
		if(adminVO != null) {
			int adminType = adminVO.getStatus();
			if(adminType == 0) {
				return "admin/systemhome";			
			} else if(adminType == 2) {				
				session.setAttribute("loginUser", adminVO);		//세션에 VO 담아줌				
				return "adminindex";
			}
		} else {
			System.out.println("로그인 실패");
		}
		return null;
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
	
	//비밀번호 변경 페이지로 이동
	@GetMapping(value="/admin/forgotpassword")
	public String password(Locale locale) {
		return "admin/forgotpassword";
	}
	
	
	
	
	
	
	//관리자 회원가입 페이지로 이동
	@GetMapping(value="/admin/register")
	public String register(Model model, HttpSession session) {
		return "admin/register";
	}
	
	//관리자 회원가입 실행
	@PostMapping(value="/admin/register")
	@ResponseBody
	public String register(@RequestBody AdminVO adminVO, Locale locale) {		
		return (adminService.registerAdmin(adminVO) == 1)? "ok":"fail";
	}
	
	//관리자 등록: 기관 코드 가져오기
	@PostMapping(value="/admin/organizationcode")
	@ResponseBody
	public int phoneNumberChk(String organizationName, Locale locale) {
		//기관명 받아서 기관 코드 return					
		return adminService.organizationCode(organizationName);
	}
	


	//각 항목으로 이동
	/*
	 * @GetMapping(value="/admin/festivallist") public String festivalList(Model
	 * model, HttpSession session) { return "admin/adminhome"; }
	 */

	

}
