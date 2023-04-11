package com.joyous.festivalolle.festivalReview.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.festivalReview.model.FestivalReviewVO;
import com.joyous.festivalolle.festivalReview.model.ViewFestivalReviewVO;

// 사용자 화면 리뷰 관리용 repository 인터페이스
public interface IUserReviewRepository {
	int insertFestivalReview(FestivalReviewVO festivalReviewVO);	// 리뷰 작성
	int updateFestivalReview(@Param("festivalReviewCode") int festivalReviewCode, 
							@Param("status") int status);			// 리뷰 신고 및 신고 해제
	int deleteFestivalReview(@Param("festivalReviewCode") int festivalReviewCode,
							@Param("memberCode") int memberCode);	// 리뷰 삭제
	// 해당 축제에 본인이 작성한 리뷰 조회
	ViewFestivalReviewVO selectMyFestivalReviewInFestivalInfo(@Param("festivalCode") int festivalCode,
															@Param("memberCode") int memberCode);
	// 해당 축제의 리뷰 목록 조회(본인 리뷰 제외)
	List<ViewFestivalReviewVO> selectFestivalReviewList(@Param("festivalCode") int festivalCode,
														@Param("memberCode") int memberCode,
														@Param("lastReviewCode") int lastReviewCode,
														@Param("perPage") int perPage);
}
