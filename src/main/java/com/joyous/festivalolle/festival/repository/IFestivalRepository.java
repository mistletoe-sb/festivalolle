package com.joyous.festivalolle.festival.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.joyous.festivalolle.festival.model.FestivalVO;

public interface IFestivalRepository {
	
	int countFestival(
			@Param("organizationCode") int organizationCode, @Param("radioInput") String radioInput, 
			@Param("titleListInput") String titleListInput, @Param("tableBoxInput") String tableBoxInput, 
			@Param("searchInput") String searchInput);
	List<FestivalVO> selectBoard(Map<String,Object> map);
	List<FestivalVO> selectFestivalList(int organizationCode);	// 축제 리스트 출려
	List<FestivalVO> selectStatusFestivalList(FestivalVO vo);	// 축제 진행 상태에 따른 축제 리스트 출력
	List<FestivalVO> selectYearTitleList(FestivalVO vo);		// 연도별 타이틀
	public abstract List<FestivalVO> selectFestivalSearch(		// 검색 기능
			@Param("organizationCode") int organizationCode,@Param("festivalKeyword") String festivalKeyword, 
			@Param("tableBox") String tableBox);
	FestivalVO selectFestivalInfo(FestivalVO vo);				// 축제 상세 정보
	List<FestivalVO> selectYearFestival(FestivalVO vo);			// 축제 상세 정보
	void insertFestival(FestivalVO vo);							// 축제 추가
	void insertFestivalImage(FestivalVO vo);					// 이미지 추가
	void updateFestival(FestivalVO vo);							// 축제 수정
	void updateFestivalImage(FestivalVO vo);					// 이미지 수정
	void updateFestivalStatus(FestivalVO vo);					// 축제 숨김

}
