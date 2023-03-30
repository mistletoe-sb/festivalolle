package com.joyous.festivalolle.festivalReview.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joyous.festivalolle.festivalReview.model.FestivalReviewVO;
import com.joyous.festivalolle.festivalReview.repository.IUserReviewRepository;

// 사용자 화면 리뷰 관리용 service 구현 클래스
@Service
public class UserReviewService implements IUserReviewService {

	@Autowired
	IUserReviewRepository userReviewRepository;		// repository 객체
	
	// 리뷰 작성
	@Override
	@Transactional
	public void insertFestivalReview(FestivalReviewVO festivalReviewVO) throws Exception {
		int check = userReviewRepository.insertFestivalReview(festivalReviewVO);
		if(check != 1) {
			throw new Exception("리뷰 작성이 실패했습니다.");
		}
	}

	// 리뷰 신고 및 신고 해제
	@Override
	@Transactional
	public void updateFestivalReview(int festivalReviewCode, int status) throws Exception {
		int check = userReviewRepository.updateFestivalReview(festivalReviewCode, status);
		if(check != 1) {
			throw new Exception("신고 처리가 실패했습니다.");
		}
	}

	// 리뷰 삭제
	@Override
	@Transactional
	public void deleteFestivalReview(int festivalReviewCode) throws Exception {
		int check = userReviewRepository.deleteFestivalReview(festivalReviewCode);
		if(check != 1) {
			throw new Exception("리뷰 삭제에 실패했습니다.");
		}
	}

}
