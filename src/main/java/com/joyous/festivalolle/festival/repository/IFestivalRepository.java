package com.joyous.festivalolle.festival.repository;

import java.util.List;

import com.joyous.festivalolle.festival.model.FestivalVO;

public interface IFestivalRepository {
	
	List<FestivalVO> selectFestivalList(int organizationCode);	// 축제 리스트 출려
	FestivalVO selectFestivalInfo(int festivalCode);			// 축제 상세 정보
	void insertFestival(FestivalVO vo);							// 축제 추가
	void insertFestivalImage(FestivalVO vo);
	void updateFestival(FestivalVO vo);							// 축제 수정, 삭제

}
