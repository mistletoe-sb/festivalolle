package com.joyous.festivalolle.member.model;
import lombok.Data;

//축제리뷰 VO
//작성자: 이혜성

@Data
public class Festival_reviewVO {
	
	private int festival_review_code; 	//축제리뷰코드
	private int member_code;			//회원코드
	private int festival_code;			//축제코드
	private String write_date;			//작성일자
	private String content;				//내용
	private int rating;					//별점
	private int status;					//리뷰 상태
}
