package com.joyous.festivalolle.festival.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
		model.addAttribute("fesInfo", festivalMainService.selectFestialInfo(festivalCode));	// 상세 정보
		return "festival/festivalinfo";
	}
	
	@GetMapping(value="/fmtest")
	public String test() {
		return "festival/swipetest";
	}
}
