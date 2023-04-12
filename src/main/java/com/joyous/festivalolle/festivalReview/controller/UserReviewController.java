package com.joyous.festivalolle.festivalReview.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.festivalReview.model.FestivalReviewVO;
import com.joyous.festivalolle.festivalReview.model.ViewFestivalReviewVO;
import com.joyous.festivalolle.festivalReview.service.IUserReviewService;
import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.util.constant.PageValue;
import com.joyous.festivalolle.util.status.AjaxResponseStatus;

// 사용자 화면 리뷰 insert(작성)/update(신고 및 신고 해제)/delete(삭제) 관리
@Controller
@RequestMapping("/review")
public class UserReviewController {
	@Autowired
	IUserReviewService userReviewService;	// 서비스 객체 주입
	
	private static Logger logger = LoggerFactory.getLogger(UserReviewController.class);	// logger 객체
	
	// 리뷰 작성
	@PostMapping("/insert")
	@ResponseBody
	public Boolean insertFestivalReview(@RequestBody FestivalReviewVO festivalReviewVO, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		
		// 세션 null 체크
		if(loginUser != null) {
			festivalReviewVO.setMemberCode(loginUser.getMemberCode());		// 회원 코드 참조
			try {
				userReviewService.insertFestivalReview(festivalReviewVO);	// insert 실행
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
			return true;
		} else {
			logger.info("session is not found");
			return false;
		}
	}
	
	// 리뷰 신고
	@PostMapping("/report")
	@ResponseBody
	public AjaxResponseStatus updateFestivalReview(int festivalReviewCode, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		
		// 세션 null 체크
		if(loginUser != null) {
			try {
				userReviewService.updateFestivalReview(festivalReviewCode, 1);		// update 실행(신고 처리)
				// 신고 정보 로그 생성
				logger.info("신고] 축제 리뷰 코드 : " + festivalReviewCode + ", 신고자 : {code:" + loginUser.getMemberCode()
							+ "}, {id:" + loginUser.getId() + "}, 신고일시 : " + LocalDateTime.now());
				return AjaxResponseStatus.NORMAL_TRUE;
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
				return AjaxResponseStatus.ERROR;
			}
		} else {
			logger.info("session is not found");
			return AjaxResponseStatus.NOT_SESSION;
		}
	}
	
	// 리뷰 삭제
	@PostMapping("/delete")
	@ResponseBody
	public Boolean deleteFestivalReview(int festivalReviewCode, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		
		// 세션 null 체크
		if(loginUser != null) {
			try {
				// delete 실행(리뷰 삭제 처리)
				userReviewService.deleteFestivalReview(festivalReviewCode, loginUser.getMemberCode());
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
			return true;
		} else {
			logger.info("session is not found");
			return false;
		}
	}
	
	// 해당 축제에 작성한 내 리뷰 조회
	@GetMapping("/myreview")
	@ResponseBody
	public ViewFestivalReviewVO selectMyFestivalReviewInFestivalInfo(int festivalCode, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		
		// 세션 null 체크
		if(loginUser != null) {
			// 내 리뷰 정보 반환
			ViewFestivalReviewVO vo = userReviewService.selectMyFestivalReviewInFestivalInfo(festivalCode, 
									loginUser.getMemberCode());
			// null 체크
			if(vo != null) {
				logger.info("vo is not null");
			}else {
				logger.info("vo is null");
				vo = new ViewFestivalReviewVO();
				vo.setFestivalReviewCode(-1);
			}
			return vo;
		} else {
			logger.info("session is not found");
			ViewFestivalReviewVO vo = new ViewFestivalReviewVO();
			vo.setFestivalReviewCode(-1);
			return vo;
		}
	}
	
	// 해당 축제에 작성된 리뷰 목록 조회(본인 리뷰 제외)
	@PostMapping({"/list", "/list/more"})
	@ResponseBody
	public Map<String, Object> selectFestivalReviewList(@RequestBody Map<String, Object> paramData,
														HttpSession session) {
		String festivalCodeData = (String)paramData.get("festivalCode");
		String lastReviewCodeData = (String)paramData.get("lastReviewCode");
		int festivalCode = (festivalCodeData!=null)?Integer.parseInt(festivalCodeData):0;
		int lastReviewCode = (lastReviewCodeData!=null)?Integer.parseInt(lastReviewCodeData):0;
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		// 데이터 저장할 변수 선언(리뷰 목록>List / ajax응답>HashMap)
		List<ViewFestivalReviewVO> festivalReviewList = null;
		Map<String, Object> responseData = new HashMap<String, Object>();
		int memberCode = 0;
		// 세션 null 체크
		if(loginUser != null) {
			memberCode = loginUser.getMemberCode();
		}
		festivalReviewList = userReviewService.selectFestivalReviewList(festivalCode, memberCode, lastReviewCode, PageValue.PER_PAGE);
		// 목록이 비어있지 않으면 응답 데이터에 저장
		if(festivalReviewList != null) {
			responseData.put("festivalReviewList", festivalReviewList);
			responseData.put("dataStatus", AjaxResponseStatus.NORMAL_TRUE);
		} else {
			responseData.put("dataStatus", AjaxResponseStatus.NORMAL_FALSE);
		}
		responseData.put("dataClass", "review");
		return responseData;
	}
}
