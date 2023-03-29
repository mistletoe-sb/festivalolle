package com.joyous.festivalolle.festivalReview.service;

import com.joyous.festivalolle.festivalReview.model.FestivalReviewVO;

// 사용자 화면 리뷰 관리용 service 인터페이스
public interface IUserReviewService {
	void insertFestivalReview(FestivalReviewVO festivalReviewVO);	// 리뷰 작성
	void updateFestivalReview(int festivalReviewCode, int status);	// 리뷰 신고
	void deleteFestivalReview(int festivalReviewCode);				// 리뷰 삭제
}
