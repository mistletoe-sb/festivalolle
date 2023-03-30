package com.joyous.festivalolle.festivalReview.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joyous.festivalolle.festivalReview.model.FestivalReviewVO;
import com.joyous.festivalolle.festivalReview.service.IUserReviewService;

// 사용자 화면 리뷰 insert(작성)/update(신고 및 신고 해제)/delete(삭제) 관리
@Controller
@RequestMapping("/review")
public class UserReviewController {
	@Autowired
	IUserReviewService userReviewService;	// 서비스 객체 주입
	
	private static Logger logger = LoggerFactory.getLogger(UserReviewController.class);	// logger 객체
	
	// 리뷰 작성
	@PostMapping("/insert")
	public String insertFestivalReview(FestivalReviewVO festivalReviewVO, HttpSession session) {
		festivalReviewVO.setMemberCode(Integer.parseInt(session.getAttribute("").toString()));	// 세션에서 회원 코드 참조
		try {
			userReviewService.insertFestivalReview(festivalReviewVO);	// insert 실행
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
	
	// 리뷰 신고 및 신고 해제
	@PostMapping("/update")
	public String updateFestivalReview(int festivalReviewCode, int status) {
		try {
			userReviewService.updateFestivalReview(festivalReviewCode, status);		// update 실행(신고, 신고 해제 처리)
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
	
	// 리뷰 삭제
	@PostMapping("/delete")
	public String deleteFestivalReview(int festivalReviewCode) {
		try {
			userReviewService.deleteFestivalReview(festivalReviewCode);		// delete 실행(리뷰 삭제 처리)
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
}
