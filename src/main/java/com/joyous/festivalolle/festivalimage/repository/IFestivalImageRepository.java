package com.joyous.festivalolle.festivalimage.repository;

import com.joyous.festivalolle.festivalimage.model.FestivalImageVO;

// 축제 이미지 Repository 인터페이스
// 작성자 : 이수봉
public interface IFestivalImageRepository {
	FestivalImageVO selectFestivalImage(int festivalCode);		// 축제 이미지 조회
}
