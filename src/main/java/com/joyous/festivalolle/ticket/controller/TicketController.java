package com.joyous.festivalolle.ticket.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;
import com.joyous.festivalolle.ticket.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {

	@Autowired
	TicketService ticketService;
	

	@GetMapping("/list")
	public String getBuyerList(V_ticketBuyerListVO buyerListVO, Model model){
		List<V_ticketBuyerListVO> list = ticketService.ticketBuyerList(buyerListVO);
		model.addAttribute("buyerList", list);
		System.out.println("ticketList");
        return "adminticket/ticket";
	}//구매자 리스트 출력
}
