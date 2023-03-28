package com.joyous.festivalolle.festivalReview.model;
import lombok.Data;

//축제리뷰 VO
//작성자: 이혜성

@Data
public class FestivalReviewVO {
	
	private int festivalReviewCode; 	//축제리뷰코드
	private int memberCode;				//회원코드
	private int festivalCode;			//축제코드
	private String writeDate;			//작성일자
	private String content;				//내용
	private int rating;					//별점
	private int status;					//리뷰 상태
}
