package com.joyous.festivalolle.festival.service;

import java.util.List;
import java.util.Map;

import com.joyous.festivalolle.festival.model.FestivalVO;

public interface IFestivalService  {
	
	int countFestival(int organizationCode, String radioInput, String titleListInput, String tableBoxInput, String searchInput);
//	int countTotalPage(int organizationCode, int pageLimit);
	List<FestivalVO> selectFestivalList(int organizationCode);				// 축제 리스트 출력
	List<FestivalVO> selectMapFestivalList(Map<String,Object> map);				// 축제 리스트 출력
	List<FestivalVO> selectStatusFestivalList(FestivalVO vo);	// 축제 진행 상태에 따른 축제 리스트 출력
	List<FestivalVO> selectYearTitleList(FestivalVO vo);		// 연도별 타이틀
	FestivalVO selectFestivalInfo(FestivalVO vo);		// 축제 상세 정보
	List<FestivalVO> selectYearFestival(FestivalVO vo);				// 축제 상세 정보
	List<FestivalVO> selectFestivalSearch(int organizationCode, String festivalKeyword, String tableBox);		// 검색 기능
	void insertFestival(FestivalVO vo);					// 축제 추가
	void updateFestivalImage(FestivalVO vo);					// 축제 추가
	void updateFestival(FestivalVO vo);					// 축제 수정
	void updateFestivalStatus(FestivalVO vo);					// 축제 숨김
}
