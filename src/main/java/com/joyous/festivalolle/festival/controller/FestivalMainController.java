package com.joyous.festivalolle.festival.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festival.service.IFestivalMainService;

// 홈페이지(메인)에 출력되는 축제 리스트 관리
// 작성자 : 이수봉
@Controller
public class FestivalMainController {
	@Autowired
	private IFestivalMainService festivalMainService;	// 서비스 객체 주입
	
	private static Logger logger = LoggerFactory.getLogger(FestivalMainController.class);	// logger 객체
	
	// 홈화면에 표시할 축제 리스트 정보 조회하여 데이터 전달
	@GetMapping(value="/home")
	public String selectFestivalMainList(Model model) {
		int recommend = 7;
		model.addAttribute("recommendList", festivalMainService.selectFestivalRecommendList(recommend));	// 추천 목록
		model.addAttribute("defaultList", festivalMainService.selectFestivalMainList());					// 기본 목록
		model.addAttribute("recommend", recommend);															// 추천 개수
		return "homepage";
	}
	
	// 축제 상세 정보 조회하여 데이터 전달
	@GetMapping(value="/festival/info/{festivalCode}")
	public String selectFestivalInfo(Model model, @PathVariable int festivalCode) {
		// 축제 코드에 해당하는 상세 정보 조회(이미지가 여러 개인 경우를 고려하여 List 타입)
		List<FestivalVO> festivalVOList = festivalMainService.selectFestialInfo(festivalCode);
		// 축제가 진행예정 상태인 경우 D-Day 계산
		String dday = null;
		if(festivalVOList.get(0).getStatus() == 2) {
			dday = getDday(festivalVOList.get(0).getStartDate());
		}
		model.addAttribute("dday", dday);				// D-Day 정보
		model.addAttribute("fesInfo", festivalVOList);	// 상세 정보
		return "festival/festivalinfo";
	}
	
	// D-Day 계산 메서드
	public String getDday(String startDate) {
		
		LocalDate fromDate = LocalDate.now();										// 현재 일자
		LocalDate toDate = LocalDate.parse(startDate, DateTimeFormatter.ISO_DATE);	// 축제 시작일자
		logger.info("d-day: " + ChronoUnit.DAYS.between(fromDate, toDate));
		// 두 날짜 간 차이 계산하여 반환
		return Long.toString(ChronoUnit.DAYS.between(fromDate, toDate));
	}
}
