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

	// 선택한 달의 전체 축제 리스트 정보 조회
//	@Override
//	public List<FestivalMainVO> selectFestivalCalendarList(String month) {
//		return festivalMainRepository.selectFestivalCalendarList(month);
//	}

	// 선택한 달에 선택한 지역 축제 리스트 정보 조회(지역 선택 안 할 시 해당 월의 전체 축제 리스트)
	@Override
	public List<FestivalMainVO> selectFestivalCalendarList(String month, String location) {
		return festivalMainRepository.selectFestivalCalendarList(month, location);
	}

	// 축제 검색 목록 조회
	@Override
	public List<FestivalMainVO> selectFestivalSearchList(String keyword, int lastFestivalCode, int perPage) {
		return festivalMainRepository.selectFestivalSearchList(keyword, lastFestivalCode, perPage);
	}



}
