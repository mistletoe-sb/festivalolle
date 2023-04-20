package com.joyous.festivalolle.ticket.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@PostMapping("/insert/{festivalStatus}")
	public String insertFestivalReview(TicketVO ticketVO, @PathVariable("festivalStatus") int festivalStatus,
										HttpSession session, RedirectAttributes redirAttr) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		String redirUrl = "redirect:/home";
		// 세션 null 체크
		if(loginUser != null) {
			if(festivalStatus == 0) {
				redirAttr.addFlashAttribute("buyMsg", "비공개 처리된 축제입니다. 구매를 취소하고 홈화면으로 돌아갑니다.");
			} else if(festivalStatus == 1 || festivalStatus == 2) {
				ticketVO.setMemberCode(loginUser.getMemberCode());	// 회원 코드 참조
				try {
					ticketInsertService.insertTicket(ticketVO);		// insert 실행
				} catch (Exception e) {
					logger.info(e.getMessage());
					e.printStackTrace();
				}
				redirAttr.addFlashAttribute("buyMsg", "구매가 완료되었습니다.");
				redirUrl = (festivalStatus == 1)?"redirect:/myticket":"redirect:/mypage/ticketlist";
			} else if(festivalStatus == 3) {
				redirAttr.addFlashAttribute("buyMsg", "이미 종료된 축제입니다.");
				redirUrl = "redirect:/festival/info?festivalCode=" + ticketVO.getFestivalCode();
			}
		} else {			
			redirUrl = "redirect:/login";
		}
		return redirUrl;
	}
}
