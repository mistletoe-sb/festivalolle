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
        return "ticket/buyer";
	}
	
//	@PostMapping("/list")
//	public String postReviewList(V_ticketBuyerListVO buyerListVO, RedirectAttributes redirectAttributes){
//		buyerList.
//		 return "buyer/list";
//	}
}
