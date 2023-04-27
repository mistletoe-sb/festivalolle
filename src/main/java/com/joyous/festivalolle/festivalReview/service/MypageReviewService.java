package com.joyous.festivalolle.festivalReview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.festivalReview.model.ViewFestivalReviewVO;
import com.joyous.festivalolle.festivalReview.repository.IMypageReviewRepository;

@Service
public class MypageReviewService implements IMypageReviewService {

	@Autowired
	private IMypageReviewRepository mypageReviewRepository;	// mypageTicketRepository 객체
	
	/*
	@Override
	public List<V_ReviewListVO> selectReviewList(String memberId) {
		return mypageReviewRepository.selectReviewList(memberId);
	}
	*/
	
	@Override
	public void delectReview(int festivalReviewCode) {
		mypageReviewRepository.delectReview(festivalReviewCode);
	}

	@Override
	public List<ViewFestivalReviewVO> selectReviewList(int memberCode, int lastReviewCode, int perPage) {
		return mypageReviewRepository.selectReviewList(memberCode, lastReviewCode, perPage);
	}
}
