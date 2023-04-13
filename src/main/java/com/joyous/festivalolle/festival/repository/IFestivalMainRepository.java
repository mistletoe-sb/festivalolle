package com.joyous.festivalolle.festival.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.festival.model.FestivalMainVO;
import com.joyous.festivalolle.festival.model.FestivalVO;

// 사용자가 보는 축제 리스트 Repository 인터페이스
// 작성자 : 이수봉
public interface IFestivalMainRepository {
	List<FestivalMainVO> selectFestivalRecommendList(int recommend);			// 홈화면의 추천 축제 리스트 정보 조회
	List<FestivalMainVO> selectFestivalMainList(@Param("lastFestivalCode") int lastFestivalCode,
												@Param("perPage") int perPage);	// 홈화면의 축제 리스트 정보 조회
	List<FestivalVO> selectFestialInfo(int festivalCode);						// 축제 상세 정보 조회
	// 선택한 달의 지역 축제 리스트 정보 조회(지역 선택 안 할 시 해당 월의 전체 축제 리스트)
//	List<FestivalMainVO> selectFestivalCalendarList(@Param("month") String month);
//	List<FestivalMainVO> selectFestivalCalendarList(@Param("month") String month, @Param("location") String location);
	// 기간 및 지역 선택하여 축제 리스트 정보 조회
	List<FestivalMainVO> selectFestivalScheduleList(@Param("periodStart") String periodStart,
													@Param("periodEnd") String periodEnd,
													@Param("location") String location,
													@Param("lastFestivalCode") int lastFestivalCode,
													@Param("perPage") int perPage);
	// 해당 기간 중 축제가 진행되는 지역(시/도 단위) 리스트 조회
	List<String> selectFestivalLocationList(@Param("periodStart") String periodStart,
											@Param("periodEnd") String periodEnd);
	// 축제 검색 목록 조회
	List<FestivalMainVO> selectFestivalSearchList(@Param("keyword") String keyword, 
												@Param("lastFestivalCode") int lastFestivalCode,
												@Param("perPage") int perPage);
}
