package com.joyous.festivalolle.ticket.controller;

//작성자:이기쁨

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;
import com.joyous.festivalolle.ticket.service.TicketService;
import com.joyous.festivalolle.ticket.service.TicketServiceMyticket;

@Controller
public class TicketControllerMyticket {

	@Autowired
	TicketServiceMyticket ticketServiceMyticket;
	
	@GetMapping(value="/myticket")
	public String myTicket(HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		if (memberVO != null) {
			//List<TicketVO> ticketVO = ticketServiceMyticket.getMyCurrentTicket(memberVO.getMemberCode())
			
			return "ticket/myticket";
		} else {
			return "member/gologin";
		}
	}
	
	

	

}
