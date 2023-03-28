package com.joyous.festivalolle.festivalReview.service;

import java.util.List;
import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;

//작성자: 이혜성
//축제 리뷰 서비스 인터페이스

public interface IFestivalReviewService {

	List<V_ReviewListVO> festivalReviewList(V_ReviewListVO reviewVO); //축제리뷰 목록 출력	
	//int totalFestivalReviewCount(); //축제리뷰 목록 행 수
	List<V_ReviewListVO> selectReview(int festivalReviewCode);			//특정 리뷰의 상세정보 출력-축제리뷰코드 기준 select
	List<V_ReviewListVO> selectReport(V_ReviewListVO reviewVO);						//신고된 리뷰 출력-리뷰상태 1 select
	
	void setBlind(int status);	//리뷰 상태 update->2
}
