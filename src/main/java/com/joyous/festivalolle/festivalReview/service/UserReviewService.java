package com.joyous.festivalolle.festivalReview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joyous.festivalolle.festivalReview.model.FestivalReviewVO;
import com.joyous.festivalolle.festivalReview.model.ViewFestivalReviewVO;
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
	public void deleteFestivalReview(int festivalReviewCode, int memberCode) throws Exception {
		int check = userReviewRepository.deleteFestivalReview(festivalReviewCode, memberCode);
		if(check != 1) {
			throw new Exception("리뷰 삭제에 실패했습니다.");
		}
	}

	// 해당 축제에 본인이 작성한 리뷰 조회
	@Override
	public ViewFestivalReviewVO selectMyFestivalReviewInFestivalInfo(int festivalCode, int memberCode) {
		return userReviewRepository.selectMyFestivalReviewInFestivalInfo(festivalCode, memberCode);
	}

	// 해당 축제의 리뷰 목록 조회(본인 리뷰 제외)
	@Override
	public List<ViewFestivalReviewVO> selectFestivalReviewList(int festivalCode, int memberCode,
																int lastReviewCode, int perPage) {
		return userReviewRepository.selectFestivalReviewList(festivalCode, memberCode, lastReviewCode, perPage);
	}

}
