package com.joyous.festivalolle.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.admin.service.IAdminService;

@Controller
public class SystemController {
	
	@Autowired
	IAdminService adminService;
	
	//시스템 관리자 페이지로 이동: 관리자 목록 출력
	@GetMapping(value="/system/adminlist")
	public String login(Model model, HttpSession session) {
		List<AdminVO> adminList = adminService.getAdminList();
		model.addAttribute("adminList", adminList);
		return "system/adminlist";	
	}
	
	//시스템 관리자: 관리자 상세보기
	/*
	 * @GetMapping(value="/system/admindetail")
	 * 
	 * @ResponseBody public String adminDetail(@RequestBody String id, Model model,
	 * HttpSession session) {
	 * 
	 * AdminVO adminDetail = new AdminVO(); adminDetail =
	 * adminService.getAdminList(id); //model.addAttribute("adminDetail",
	 * adminDetail); System.out.println("됨");
	 * 
	 * //return (adminService.getAdminList(id) == 1)? "ok":"fail"; return
	 * "system/admindetail";
	 * 
	 * }
	 */
 

	

	
	
}
