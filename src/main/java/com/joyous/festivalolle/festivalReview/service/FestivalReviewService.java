package com.joyous.festivalolle.festivalReview.service;

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
	public int totalFestivalReviewCount() {
		
		return reviewRepository.totalFestivalReviewCount();
	}

}
