package com.joyous.festivalolle.festivalReview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;
import com.joyous.festivalolle.festivalReview.repository.IMypageReviewRepository;

@Service
public class MypageReviewService implements IMypageReviewService {

	@Autowired
	private IMypageReviewRepository mypageReviewRepository;	// mypageTicketRepository 객체
	

	@Override
	public List<V_ReviewListVO> selectReviewList(int memberCode) {
		return mypageReviewRepository.selectReviewList(memberCode);
	}

	@Override
	public void delectReview(int festivalReviewCode) {
		mypageReviewRepository.delectReview(festivalReviewCode);
	}

}
