package com.joyous.festivalolle.festival.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.festival.model.FestivalMainVO;
import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festival.repository.IFestivalMainRepository;

// 사용자가 보는 축제 리스트 Service 구현 클래스
// 작성자 : 이수봉
@Service
public class FestivalMainService implements IFestivalMainService {

	@Autowired
	private IFestivalMainRepository festivalMainRepository;		// repository 객체 주입
	
	// 홈 화면 추천 목록 조회
	@Override
	public List<FestivalMainVO> selectFestivalRecommendList(int recommend) {
		return festivalMainRepository.selectFestivalRecommendList(recommend);
	}

	// 홈 화면 기본 목록 조회
	@Override
	public List<FestivalMainVO> selectFestivalMainList(int lastFestivalCode, int perPage) {
		return festivalMainRepository.selectFestivalMainList(lastFestivalCode, perPage);
	}

	// 축제 상세 정보 조회
	@Override
	public List<FestivalVO> selectFestialInfo(int festivalCode) {
		return festivalMainRepository.selectFestialInfo(festivalCode);
	}

	// 기간 및 지역 선택하여 축제 리스트 정보 조회
	@Override
	public List<FestivalMainVO> selectFestivalScheduleList(int status, String periodStart, String periodEnd,
														String location, int lastFestivalCode, int perPage) {
		return festivalMainRepository.selectFestivalScheduleList(status, periodStart, periodEnd,
																location, lastFestivalCode, perPage);
	}

	// 해당 기간에 축제가 진행되는 지역 조회
	@Override
	public List<String> selectFestivalLocationList(String periodStart, String periodEnd) {
		return festivalMainRepository.selectFestivalLocationList(periodStart, periodEnd);
	}
	
	// 축제 검색 목록 조회
	@Override
	public List<FestivalMainVO> selectFestivalSearchList(String keyword, int lastFestivalCode, int perPage) {
		return festivalMainRepository.selectFestivalSearchList(keyword, lastFestivalCode, perPage);
	}

	// 북마크 목록 조회
	@Override
	public List<FestivalMainVO> selectBookmarkList(int memberCode, int lastBookmarkCode, int perPage) {
		return festivalMainRepository.selectBookmarkList(memberCode, lastBookmarkCode, perPage);
	}

	// 이번주 HOT 축제 조회
	@Override
	public List<FestivalMainVO> selectFestivalHotList(String periodStart, String periodEnd,
													int lastFestivalCode, int perPage) {
		return festivalMainRepository.selectFestivalHotList(periodStart, periodEnd, lastFestivalCode, perPage);
	}

}
