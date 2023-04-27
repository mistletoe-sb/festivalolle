package com.joyous.festivalolle.festivalReview.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.festivalReview.model.ViewFestivalReviewVO;

public interface IMypageReviewRepository {
//	List<V_ReviewListVO> selectReviewList(String memberId);	// 리뷰 리스트 출력
	List<ViewFestivalReviewVO> selectReviewList(@Param("memberCode") int memberCode,
										@Param("lastReviewCode") int lastReviewCode,
										@Param("perPage") int perPage);	// 리뷰 리스트 출력
	void delectReview(int festivalReviewCode);				//리뷰 삭제
}
