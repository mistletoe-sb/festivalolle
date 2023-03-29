package com.joyous.festivalolle.festivalReview.repository;

import com.joyous.festivalolle.festivalReview.model.FestivalReviewVO;

// 사용자 화면 리뷰 관리용 repository 인터페이스
public interface IUserReviewRepository {
	int insertFestivalReview(FestivalReviewVO festivalReviewVO);	// 리뷰 작성
	int updateFestivalReview(int festivalReviewCode, int status);	// 리뷰 신고
	int deleteFestivalReview(int festivalReviewCode);				// 리뷰 삭제
}
