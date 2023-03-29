package com.joyous.festivalolle.festivalReview.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.joyous.festivalolle.festivalReview.model.FestivalReviewVO;
import com.joyous.festivalolle.festivalReview.repository.IUserReviewRepository;

// 사용자 화면 리뷰 관리용 service 구현 클래스
public class UserReviewService implements IUserReviewService {

	@Autowired
	IUserReviewRepository userReviewRepository;		// repository 객체
	
	// 리뷰 작성
	@Override
	public void insertFestivalReview(FestivalReviewVO festivalReviewVO) {
		// TODO Auto-generated method stub
	}

	// 리뷰 신고
	@Override
	public void updateFestivalReview(int festivalReviewCode, int status) {
		// TODO Auto-generated method stub
	}

	// 리뷰 삭제
	@Override
	public void deleteFestivalReview(int festivalReviewCode) {
		// TODO Auto-generated method stub
	}

}
