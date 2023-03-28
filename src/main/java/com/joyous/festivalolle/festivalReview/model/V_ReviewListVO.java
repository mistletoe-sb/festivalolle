package com.joyous.festivalolle.festivalReview.model;

//작성자: 이혜성
//축제리뷰 리스트 VO

import lombok.Data;

@Data
public class V_ReviewListVO {
	
	private int festivalReviewCode;	//축제리뷰코드
	private int status;				//리뷰 상태
	private String id;				//회원 id
	private String content;			//리뷰 내용
	private String writeDate;		//작성일시
	private String title;			//작성일시
}
