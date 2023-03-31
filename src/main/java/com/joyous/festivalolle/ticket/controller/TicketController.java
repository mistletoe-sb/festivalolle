package com.joyous.festivalolle.ticket.controller;

//작성자: 이혜성
//관리자- 구매자 관리 컨트롤러

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;
import com.joyous.festivalolle.ticket.service.TicketService;

@Controller
@RequestMapping("/admin/ticket") 
public class TicketController {

	@Autowired
	TicketService ticketService;
	

	@GetMapping("/list")
	public String getBuyerList(V_ticketBuyerListVO buyerListVO, Model model, HttpSession session){
//		AdminVO adminVO = (AdminVO) session.getAttribute("loginUser");
//		int organizationCode = adminVO.getOrganizationCode();
//		buyerListVO.setOrganizationCode(organizationCode);
		List<V_ticketBuyerListVO> ticketList = ticketService.ticketBuyerList(buyerListVO);
		model.addAttribute("ticketList", ticketList);
		System.out.println("ticketList");
        return "adminticket/ticket"; // 구매자 전체 리스트 출력
	}
	
    @ResponseBody
    @GetMapping("/search")
    public String getSearch(V_ticketBuyerListVO buyerListVO, Model model, HttpSession session){
//    	AdminVO adminVO = (AdminVO) session.getAttribute("loginUser");
//		int organizationCode = adminVO.getOrganizationCode();
//		buyerListVO.setOrganizationCode(organizationCode);
    	List<V_ticketBuyerListVO> search = ticketService.searchBuyer(buyerListVO);
    	model.addAttribute("search", search);
    	System.out.println("search");
        return "adminticket/list"; //구매자 리스트 출력
    }
    	
	//-------------------test controller-------------------------------------------
	@GetMapping("/test")
	public String getTest(V_ticketBuyerListVO buyerListVO, Model model, HttpSession session){
//		AdminVO adminVO = (AdminVO) session.getAttribute("loginUser");
//		int organizationCode = adminVO.getOrganizationCode();
//		buyerListVO.setOrganizationCode(organizationCode);
		List<V_ticketBuyerListVO> test = ticketService.ticketBuyerList(buyerListVO);
		model.addAttribute("test", test);
		System.out.println("test");
        return "adminticket/test"; // 구매자 전체 리스트 출력
	}
	@ResponseBody
	@GetMapping("/test1")
	public String getTest1(V_ticketBuyerListVO buyerListVO, Model model, HttpSession session){
//		AdminVO adminVO = (AdminVO) session.getAttribute("loginUser");
//		int organizationCode = adminVO.getOrganizationCode();
//		buyerListVO.setOrganizationCode(organizationCode);
		List<V_ticketBuyerListVO> test = ticketService.searchBuyer(buyerListVO);
		model.addAttribute("test", test);
		System.out.println("test1");
        return "adminticket/test"; // 구매자 검색 리스트 출력
	}
}
