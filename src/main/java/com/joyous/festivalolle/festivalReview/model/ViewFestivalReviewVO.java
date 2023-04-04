package com.joyous.festivalolle.festivalReview.model;

import lombok.Data;

// 축제 리뷰 출력 시 사용할 데이터를 저장할 VO 클래스
@Data
public class ViewFestivalReviewVO {
	private int festivalReviewCode;		// 축제리뷰 코드
	private int festivalCode;			// 축제 코드
	private String writeDate;			// 작성일자
	private String content;				// 내용
	private int rating;					// 평점
	private int status;					// 리뷰 상태
	private String id;					// 회원 ID
	private String title;				// 축제명
	private int organizationCode;		// 기관 코드
}
