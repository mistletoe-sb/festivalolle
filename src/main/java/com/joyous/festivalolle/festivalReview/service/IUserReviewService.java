package com.joyous.festivalolle.festivalReview.service;

import java.util.List;

import com.joyous.festivalolle.festivalReview.model.FestivalReviewVO;
import com.joyous.festivalolle.festivalReview.model.ViewFestivalReviewVO;

// 사용자 화면 리뷰 관리용 service 인터페이스
public interface IUserReviewService {
	void insertFestivalReview(FestivalReviewVO festivalReviewVO) throws Exception;		// 리뷰 작성
	void updateFestivalReview(int festivalReviewCode, int status) throws Exception;		// 리뷰 신고 및 신고 해제
	void deleteFestivalReview(int festivalReviewCode, int memberCode) throws Exception;	// 리뷰 삭제
	// 해당 축제에 본인이 작성한 리뷰 조회
	ViewFestivalReviewVO selectMyFestivalReviewInFestivalInfo(int festivalCode, int memberCode);
	// 해당 축제의 리뷰 목록 조회(본인 리뷰 제외)
	List<ViewFestivalReviewVO> selectFestivalReviewList(int festivalCode, int memberCode,
														int lastReviewCode, int perPage);
}
