package com.joyous.festivalolle.festivalReview.service;

import java.util.List;
import java.util.Map;

import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;

//작성자: 이혜성
//축제 리뷰 서비스 인터페이스

public interface IFestivalReviewService {
	
	int totalFestivalReviewCount(int organizationCode, String radioInput, String titleListInput, String tableBoxInput, String reviewKeyword);  //축제리뷰 목록 출력
	List<V_ReviewListVO> selectBoard(Map<String,Object> map);			//페이징
	List<V_ReviewListVO> festivalReviewList(V_ReviewListVO reviewVO); 	//축제리뷰 목록 출력	
	V_ReviewListVO selectReview(int festivalReviewCode);				//특정 리뷰의 상세정보 출력-축제리뷰코드 기준 select
	List<V_ReviewListVO> selectReport(V_ReviewListVO reviewVO);			//신고된 리뷰 출력-리뷰상태 1 select
	List<V_ReviewListVO> searchReview(int organizationCode, String reviewKeyword, String tableBox); //리뷰검색: 아이디, 리뷰 내용, 축제명으로 검색가능
	List<V_ReviewListVO> selectYearTitleList(V_ReviewListVO reviewVO);	// 연도별 타이틀
	
	void setBlind(int festivalReviewCode);	//리뷰 상태 update->2
	void setNormal(int festivalReviewCode); //리뷰 상태 update->0
	
}
