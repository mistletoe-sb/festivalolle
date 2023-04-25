package com.joyous.festivalolle.ticket.controller;

import java.util.ArrayList;
import java.util.Base64;

//작성자:이기쁨

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.joyous.festivalolle.admin.controller.AdminController;
import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.model.TicketVOmyticket;
import com.joyous.festivalolle.ticket.service.TicketServiceMyticket;

//작성자: 이기쁨
@Controller
public class TicketControllerMyticket {
	
	private final Logger logger = LoggerFactory.getLogger(TicketControllerMyticket.class);
	
	@Autowired
	TicketServiceMyticket ticketServiceMyticket;
	
	//이용권 출력
	@GetMapping(value="/myticket")
	public String myTicket(HttpSession session, Model model) {
		logger.info("/myticket 왔다");
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		if (memberVO != null) {
			List<TicketVOmyticket> myticketList = ticketServiceMyticket.getMyCurrentTicket(memberVO.getMemberCode());
			//List<String> myticketImages = new ArrayList<String>();
			/*
			for(TicketVOmyticket myticketVO : myticketList) {	
				if(myticketVO.getImage() != null) {
					myticketImages.add(Base64.getEncoder().encodeToString(myticketVO.getImage()));
				} else {
					myticketImages.add(null);
				}
			}*/
			
			//현재 사용 가능한 이용권과 이미지 model에 담음
			model.addAttribute("myticketList", myticketList);
			//model.addAttribute("myticketImages", myticketImages);
			
			return "ticket/myticket";
		} else {
			return "member/gologin";
		}
	}
	
	

	

}
