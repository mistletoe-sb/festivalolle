package com.joyous.festivalolle.ticket.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		//festivalReviewVO.setMemberCode(Integer.parseInt(session.getAttribute("").toString()));	// 세션에서 회원 코드 참조
		ticketVO.setMemberCode(10);	// 세션에서 회원 코드 참조
		try {
			ticketInsertService.insertTicket(ticketVO);	// insert 실행
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/ticket/list";
	}
}
