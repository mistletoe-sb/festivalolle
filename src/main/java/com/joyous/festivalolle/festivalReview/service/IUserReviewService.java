package com.joyous.festivalolle.festivalReview.service;

import com.joyous.festivalolle.festivalReview.model.FestivalReviewVO;

// 사용자 화면 리뷰 관리용 service 인터페이스
public interface IUserReviewService {
	void insertFestivalReview(FestivalReviewVO festivalReviewVO) throws Exception;	// 리뷰 작성
	void updateFestivalReview(int festivalReviewCode, int status) throws Exception;	// 리뷰 신고 및 신고 해제
	void deleteFestivalReview(int festivalReviewCode) throws Exception;				// 리뷰 삭제
}
