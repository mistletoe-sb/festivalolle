package com.joyous.festivalolle.festival.service;

import java.util.List;

import com.joyous.festivalolle.festival.model.FestivalMainVO;
import com.joyous.festivalolle.festival.model.FestivalVO;

// 사용자가 보는 축제 리스트 Service 인터페이스
// 작성자 : 이수봉
public interface IFestivalMainService {
	List<FestivalMainVO> selectFestivalRecommendList(int recommend);	// 홈화면의 추천 축제 리스트 정보 조회
	List<FestivalMainVO> selectFestivalMainList();						// 홈화면의 축제 리스트 정보 조회
	List<FestivalVO> selectFestialInfo(int festivalCode);				// 축제 상세 정보 조회
}
