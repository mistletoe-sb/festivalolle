package com.joyous.festivalolle.festivalReview.service;

import java.util.List;
import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;

//작성자: 이혜성
//축제 리뷰 서비스 인터페이스

public interface IFestivalReviewService {

	List<V_ReviewListVO> festivalReviewList(V_ReviewListVO reviewVO); //축제리뷰 목록 출력	
	int totalFestivalReviewCount(); //축제리뷰 목록 행 수
}
