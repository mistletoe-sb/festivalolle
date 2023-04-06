package com.joyous.festivalolle.ticket.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.service.IMypageTicketService;

@Controller
@RequestMapping (value = "/mypage")
public class MypageTicketController {
	@Autowired
	private IMypageTicketService mypageTicketService;
	
	private String view_pos = "mypage/";		// 뷰 저장 위치
	
	/* =====================================================ticketlist====================================================== */	
	@GetMapping("/ticketlist")

	public String ticketlist(TicketVO vo, Model model, HttpSession session) throws Exception {

		 MemberVO memberVO = (MemberVO) session.getAttribute("loginUser"); 
		 int memberCode = memberVO.getMemberCode();

		List<TicketVO> selectTicketList = mypageTicketService.selectTicketList(memberCode);
		

		byte[] getImage;
		String img;

		
		for(int i=0; i <selectTicketList.size(); i++) {
			getImage = selectTicketList.get(i).getImage();
			if(getImage ==null) {
				img = "1";
			} else {
				img = Base64.getEncoder().encodeToString(getImage);
			}
			
			
			//byte[] getImage = vo.getImage();
			selectTicketList.get(i).setAddress(img);
		}
		
		model.addAttribute("selectTicketList", selectTicketList);
		
		return view_pos + "ticketlist";
	}
	
	/* =====================================================ticketinfo====================================================== */	
	@GetMapping("/ticketinfo")

	public String ticketinfo(TicketVO vo, Model model, HttpSession session, @RequestParam(value="ticketCode", required=true) int ticketCode) throws Exception {

		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		vo = mypageTicketService.selectTicketInfo(ticketCode);
		

		byte[] getImage = vo.getImage();
		String img;
		model.addAttribute("adminfestivalinfo", vo);
		if(getImage == null) {
			img = "1";
		} else {
			img = Base64.getEncoder().encodeToString(vo.getImage());
		}
		
		model.addAttribute("img", img);

		model.addAttribute("selectTicketList", vo);
		
		return view_pos + "ticketinfo";
	}
}
