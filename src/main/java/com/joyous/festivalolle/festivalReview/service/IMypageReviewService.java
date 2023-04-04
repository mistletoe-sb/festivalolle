package com.joyous.festivalolle.festivalReview.service;

import java.util.List;

import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;

public interface IMypageReviewService {
	
	List<V_ReviewListVO> selectReviewList(String memberId);	// 리뷰 리스트 출력
	void delectReview(int festivalReviewCode);				//리뷰 삭제

}
