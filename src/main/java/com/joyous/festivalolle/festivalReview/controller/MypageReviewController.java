package com.joyous.festivalolle.festivalReview.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;
import com.joyous.festivalolle.festivalReview.service.IMypageReviewService;
import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.service.IMypageTicketService;

@Controller
@RequestMapping (value = "/mypage")
public class MypageReviewController {

	@Autowired
	private IMypageReviewService mypageReviewService;
	
	private String view_pos = "mypage/";		// 뷰 저장 위치
	
	/* =====================================================ticketlist====================================================== */	
	@GetMapping("/Reviewlist")

	public String Reviewlist(Model model, HttpSession session) throws Exception {

		 MemberVO memberVO = (MemberVO) session.getAttribute("loginUser"); 
		 int memberCode = memberVO.getMemberCode();
		 
		List<V_ReviewListVO> selectReviewtList = mypageReviewService.selectReviewList(memberCode);
		model.addAttribute("selectReviewtList", selectReviewtList);

		return view_pos + "Reviewlist";
	}
	
}
