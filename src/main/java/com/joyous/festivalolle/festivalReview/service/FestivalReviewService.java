package com.joyous.festivalolle.festivalReview.service;

//작성자: 이혜성
//축제 리뷰 서비스

import java.util.List;
import java.util.Map;

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
	public V_ReviewListVO selectReview(int festivalReviewCode) {

		return reviewRepository.selectReview(festivalReviewCode);
	}

	@Override
	public List<V_ReviewListVO> selectReport(V_ReviewListVO reviewVO) {
		
		return reviewRepository.selectReport(reviewVO);
	}
	
	@Override
	public void setBlind(int festivalReviewCode) {
		
		reviewRepository.setBlind(festivalReviewCode);
	}

	@Override
	public void setNormal(int festivalReviewCode) {
		
		reviewRepository.setNormal(festivalReviewCode);
		
	}
	
	@Override
	public List<V_ReviewListVO> searchReview(int organizationCode, String reviewKeyword, String tableBox){
		
		return reviewRepository.searchReview(organizationCode,reviewKeyword, tableBox);
	}


	@Override
	public List<V_ReviewListVO> selectYearTitleList(V_ReviewListVO reviewVO) {

		return reviewRepository.selectYearTitleList(reviewVO);
	}


	public List<V_ReviewListVO> selectYearReview(V_ReviewListVO reviewVO) {
		
		return reviewRepository.selectYearReview(reviewVO);
	}


	@Override
	public int countFestivalReview(int organizationCode, int radioInput, int titleListInput, String tableBoxInput, String searchInput) {

		return reviewRepository.countFestivalReview(organizationCode, radioInput, titleListInput, tableBoxInput, searchInput);
	}


	@Override
	public List<V_ReviewListVO> selectBoard(Map<String, Object> map) {

		return reviewRepository.selectBoard(map);
	}



	
}
