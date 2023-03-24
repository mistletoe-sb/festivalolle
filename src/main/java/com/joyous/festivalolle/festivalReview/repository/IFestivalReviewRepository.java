package com.joyous.festivalolle.festivalReview.repository;

import java.util.List;
import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;

//작성자: 이혜성
//축제리뷰 정보 인터페이스

public interface IFestivalReviewRepository {

	List<V_ReviewListVO> festivalReviewList(V_ReviewListVO reviewVO); //축제리뷰 목록 출력
	int totalFestivalReviewCount(); //축제리뷰 목록 행 수
	
}
