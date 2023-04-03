package com.joyous.festivalolle.ticket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joyous.festivalolle.ticket.service.IMypageTicketService;

@Controller
@RequestMapping (value = "/mypage")
public class MypageTicketController {
	@Autowired
	private IMypageTicketService mypageTicketService;
	
	private String view_pos = "mypage/";		// 뷰 저장 위치
	
	/* =====================================================festivallist====================================================== */	
	@GetMapping("/ticketlist")

	public String ticketlist(Model model, HttpSession session) throws Exception {
		/*
		 AdminVO adminVO = (AdminVO) session.getAttribute("loginUser"); int
		 organizationCode = adminVO.getOrganizationCode();
		 
		List<FestivalVO> selectFestivalList = festivalService.selectFestivalList(organizationCode);
		model.addAttribute("selectFestivalList", selectFestivalList);
*/
		return view_pos + "ticketlist";
	}
}
