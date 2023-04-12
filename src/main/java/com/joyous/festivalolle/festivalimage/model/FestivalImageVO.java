package com.joyous.festivalolle.festivalimage.model;

import lombok.Data;

// 축제 이미지 VO
@Data
public class FestivalImageVO {
	private int festivalImageCode;	// 축제 이미지코드
	private int festivalCode;		// 축제코드
	private String fileName;		// 이미지 파일명
	private byte[] image;			// 이미지 원본
	private byte[] thumbnail;		// 이미지 썸네일
}
