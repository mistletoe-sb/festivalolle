package com.joyous.festivalolle.festivalReview.repository;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;

//작성자: 이혜성
//축제리뷰 정보 인터페이스

public interface IFestivalReviewRepository {

	List<V_ReviewListVO> festivalReviewList(V_ReviewListVO reviewVO); 	//축제리뷰 목록 출력
	//int totalFestivalReviewCount(); 									//축제리뷰 목록 행 수
	V_ReviewListVO selectReview(int festivalReviewCode);				//특정 리뷰의 상세정보 출력-축제리뷰코드 기준 select
	List<V_ReviewListVO> selectReport(V_ReviewListVO reviewVO);			//신고된 리뷰 출력-리뷰상태 1 select
	List<V_ReviewListVO> searchReview(
			@Param("organizationCode") int organizationCode,@Param("reviewKeyword") String reviewKeyword, @Param("tableBox") String tableBox);//리뷰검색-아이디, 리뷰내용, 축제명으로 검색 가능
	List<V_ReviewListVO> selectYearTitleList(V_ReviewListVO reviewVO);		// 연도별 타이틀
	List<V_ReviewListVO> selectYearReview(V_ReviewListVO reviewVO);
	
	void setBlind(int festivalReviewCode);	//리뷰 상태 update->2
	void setNormal(int festivalReviewCode); //리뷰 상태 update->0

}
