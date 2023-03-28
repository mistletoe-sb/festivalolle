package com.joyous.festivalolle.festivalReview.service;

//작성자: 이혜성
//축제 리뷰 서비스

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;
import com.joyous.festivalolle.festivalReview.repository.IFestivalReviewRepository;

@Service
public class FestivalReviewService implements IFestivalReviewService {

	@Autowired
	IFestivalReviewRepository reviewRepository;
	
	@Override
	public List<V_ReviewListVO> festivalReviewList(V_ReviewListVO reviewVO) {

		return reviewRepository.festivalReviewList(reviewVO);
	}


	@Override
	public List<V_ReviewListVO> selectReview(int festivalReviewCode) {

		return reviewRepository.selectReview(festivalReviewCode);
	}

	@Override
	public List<V_ReviewListVO> selectReport(V_ReviewListVO reviewVO) {
		
		return reviewRepository.selectReport(reviewVO);
	}
	
	@Override
	public void setBlind(int status) {
		
		reviewRepository.setBlind(status);
	}



//	@Override
//	public int totalFestivalReviewCount() {
//		
//		return reviewRepository.totalFestivalReviewCount();
//	}

	
}
