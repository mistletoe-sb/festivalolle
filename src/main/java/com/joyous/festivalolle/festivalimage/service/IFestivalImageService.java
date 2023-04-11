package com.joyous.festivalolle.festivalimage.service;

import com.joyous.festivalolle.festivalimage.model.FestivalImageVO;

// 축제 이미지 서비스 인터페이스
// 작성자 : 이수봉
public interface IFestivalImageService {
	FestivalImageVO selectFestivalImage(int festivalCode);
}
