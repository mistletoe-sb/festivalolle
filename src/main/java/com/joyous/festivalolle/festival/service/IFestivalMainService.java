package com.joyous.festivalolle.festival.service;

import java.util.List;

import com.joyous.festivalolle.festival.model.FestivalMainVO;
import com.joyous.festivalolle.festival.model.FestivalVO;

// 사용자가 보는 축제 리스트 Service 인터페이스
// 작성자 : 이수봉
public interface IFestivalMainService {
	List<FestivalMainVO> selectFestivalRecommendList(int recommend);	// 홈화면의 추천 축제 리스트 정보 조회
	List<FestivalMainVO> selectFestivalMainList(int lastFestivalCode,
												int perPage);			// 홈화면의 축제 리스트 정보 조회
	List<FestivalVO> selectFestialInfo(int festivalCode);				// 축제 상세 정보 조회
	// 기간 및 지역 선택하여 축제 리스트 정보 조회
	List<FestivalMainVO> selectFestivalScheduleList(int status, String periodStart, String periodEnd,
													String location, int lastFestivalCode, int perPage);
	// 해당 기간 중 축제가 진행되는 지역(시/도 단위) 리스트 조회
	List<String> selectFestivalLocationList(String periodStart, String periodEnd);
	// 축제 검색 목록 조회
	List<FestivalMainVO> selectFestivalSearchList(String keyword, int lastFestivalCode, int perPage);
	// 북마크 목록 조회
	List<FestivalMainVO> selectBookmarkList(int memberCode, int lastBookmarkCode, int perPage);
	// 이번주 HOT 축제 조회
	List<FestivalMainVO> selectFestivalHotList(String periodStart, String periodEnd,
											int lastFestivalCode, int perPage);
}
