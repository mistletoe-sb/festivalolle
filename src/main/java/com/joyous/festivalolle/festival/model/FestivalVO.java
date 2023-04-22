package com.joyous.festivalolle.festival.model;

import lombok.Data;

@Data
public class FestivalVO {
	private int festivalCode;			// 축제 코드
	private String title;				// 축제명
	private String stateName;			// 지역명(시/도 단위)
	private String cityName;			// 지역명(시/군/구 단위)
	private String address;				// 상세주소
	private String startDate;			// 시작일자
	private String endDate;				// 종료일자
	private int fee;					// 입장료
	private String url;					// 홈페이지 URL
	private int organizationCode;		// 기관코드
	private String telephone;			// 전화번호
	private String adminName;			// 담당자
	private String detail;				// 상세설명
	private String tags;				// 태그
	private String registerDate;		// 등록일자
	private int status;					// 축제 상태
	private int festivalImageCode;		// 이미지 코드 (이미지)
	private String fileName;			// 이미지 파일명 (이미지)
	private byte[] image;				// 이미지 (이미지)
	private byte[] thumbnail;			// 썸네일 (이미지)
	private float rating;				// 평균 평점
	private int reviewCount;			// 리뷰 수
	private String organizationName;	// 담당기관명
}
