package com.joyous.festivalolle.festivalReview.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.festivalReview.model.ViewFestivalReviewVO;
import com.joyous.festivalolle.festivalReview.service.IMypageReviewService;
import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.util.constant.PageValue;
import com.joyous.festivalolle.util.status.AjaxResponseStatus;

@Controller
@RequestMapping (value = "/mypage")
public class MypageReviewController {

	@Autowired
	private IMypageReviewService mypageReviewService;
	
	private String view_pos = "mypage/";		// 뷰 저장 위치
	
	/* =====================================================ticketlist====================================================== */	
	@GetMapping("/reviewlist")
	public String reviewlist(Model model, HttpSession session ) throws Exception {
		/*
		 MemberVO memberVO = (MemberVO) session.getAttribute("loginUser"); 
		 String memberId = memberVO.getId();
		 
		List<V_ReviewListVO> selectReviewtList = mypageReviewService.selectReviewList(memberId);
		model.addAttribute("selectReviewtList", selectReviewtList);
		
		return view_pos + "reviewlist";
		*/
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser != null) {
			return view_pos + "reviewlist";
		} else {
			return "redirect:/login";			
		}
	}
	
	@GetMapping("/reviewdelect")
	public String reviewdelect(Model model, HttpSession session, @RequestParam(value="festivalReviewCode", required=true) int festivalReviewCode) throws Exception {

		 
		mypageReviewService.delectReview(festivalReviewCode);
		

		return "redirect:/mypage/reviewlist";
	}
	
	@PostMapping("/reviewlist/more")
	@ResponseBody
	public Map<String, Object> selectFestivalReviewList(@RequestBody Map<String, Object> paramData,
														HttpSession session) {
		//String festivalCodeData = (String)paramData.get("festivalCode");
		String lastReviewCodeData = (String)paramData.get("lastReviewCode");
		//int festivalCode = (festivalCodeData!=null)?Integer.parseInt(festivalCodeData):0;
		int lastReviewCode = (lastReviewCodeData!=null)?Integer.parseInt(lastReviewCodeData):0;
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		// 데이터 저장할 변수 선언(리뷰 목록>List / ajax응답>HashMap)
		Map<String, Object> responseData = new HashMap<String, Object>();
		// 세션 null 체크
		if(loginUser != null) {
			int memberCode = loginUser.getMemberCode();		// 회원코드 참조
			List<ViewFestivalReviewVO> festivalReviewList = mypageReviewService.selectReviewList(memberCode, lastReviewCode, PageValue.PER_PAGE);
			// 목록이 비어있지 않으면 응답 데이터에 저장
			if(festivalReviewList != null) {
				responseData.put("festivalReviewList", festivalReviewList);
				responseData.put("dataStatus", AjaxResponseStatus.NORMAL_TRUE);
			} else {
				responseData.put("dataStatus", AjaxResponseStatus.NORMAL_FALSE);
			}
		} else {
			responseData.put("dataStatus", AjaxResponseStatus.NOT_SESSION);
		}
		responseData.put("dataClass", "review");
		responseData.put("dataOption", "mypage");
		return responseData;
	}
}
