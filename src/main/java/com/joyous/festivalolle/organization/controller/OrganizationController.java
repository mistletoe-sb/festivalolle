package com.joyous.festivalolle.organization.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.organization.service.IOrganizationService;

// 작성자 : 이수봉
// 기관 테이블 컨트롤러
@Controller
@RequestMapping("/organization")
public class OrganizationController {
	@Autowired
	IOrganizationService organizationService;	// 서비스 객체 주입
	
	@GetMapping("/namelist")
	@ResponseBody
	public List<String> selectOrganizationNameList(){
		return organizationService.selectOrganizationNameList();	// 기관 목록 조회
	}
}
