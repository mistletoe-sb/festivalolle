package com.joyous.festivalolle.admin.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.admin.service.IAdminService;

//작성자: 이기쁨
@Controller
public class AdminController {
	
	@Autowired
	IAdminService adminService;
	
	
	
	//관리자 로그인화면으로 이동
	//@RequestMapping(value="/admin", method=RequestMethod.GET)
	
	@GetMapping(value="/admin")
	public String login(Model model, HttpSession session) {
		return "admin/adminlogin";
	}//관리자 로그인화면으로 이동
	
	//관리자 로그인
	//@RequestMapping(value="/admin", method=RequestMethod.POST)
	
	@PostMapping(value="/admin")
	@ResponseBody
	public String login(String id, String password, HttpSession session, Model model, Locale locale) {		
		AdminVO adminVO = new AdminVO();
		adminVO = adminService.adminLogin(id, password);
		
		if(adminVO != null) {
			int adminType = adminVO.getStatus();
			if(adminType == 0) {
				return "redirect:/systemhome";			
			} else if(adminType == 2) {
				return "redirect:/adminhome";
			}		
		} else {
			System.out.println("로그인 실패");				
		}
		return null;
	}
	

}
