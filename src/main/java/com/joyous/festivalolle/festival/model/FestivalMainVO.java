package com.joyous.festivalolle.festival.model;

import lombok.Data;

@Data
// 축제 목록에 표시할 데이터를 담는 VO 클래스
public class FestivalMainVO {
	private int festivalCode;	// 축제 코드
	private String stateName;	// 지역(시/도)명
	private String cityName;	// 지역(시/군/구)명
	private String startDdate;	// 시작일자
	private String endDate;		// 종료일자
	private int status;			// 축제 상태
	private String fileName;	// 이미지 파일명
	private byte[] image;		// 이미지 원본
	private byte[] thumbnail;	// 썸네일
	private float rating;		// 평균 평점
	private int visitors;		// 이용객 수
}
