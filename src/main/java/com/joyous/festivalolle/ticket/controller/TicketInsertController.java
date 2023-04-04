package com.joyous.festivalolle.ticket.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.service.ITicketInsertService;

//입장권 구매 컨트롤러 클래스
@Controller
@RequestMapping("/ticket")
public class TicketInsertController {
	@Autowired
	ITicketInsertService ticketInsertService;	// 서비스 객체 주입
	
	private static Logger logger = LoggerFactory.getLogger(TicketInsertController.class);	// logger 객체
	
	// 리뷰 작성
	@PostMapping("/insert")
	public String insertFestivalReview(TicketVO ticketVO, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		
		// 세션 null 체크
		if(loginUser != null) {			
			ticketVO.setMemberCode(loginUser.getMemberCode());	// 회원 코드 참조
			try {
				ticketInsertService.insertTicket(ticketVO);		// insert 실행
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
			return "redirect:/home";
		} else {			
			return "redirect:/login";
		}
//		return "redirect:/ticket/list";
	}
}
