package com.joyous.festivalolle.festival.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.TreeSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.festival.model.FestivalMainVO;
import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festival.service.IFestivalMainService;
import com.joyous.festivalolle.util.constant.SelectFilter;

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
		return "mobilehome";
	}
	
	// 축제 상세 정보 조회하여 데이터 전달
	@GetMapping(value="/festival/info")
	public String selectFestivalInfo(Model model, @RequestParam(value="festivalCode") int festivalCode) {
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
	
	// 축제 일정 조회 페이지로 이동
	@GetMapping(value="/festival/calendar")
	public String selectFestivalCalendarList(Model model) {
		// 기본 페이지에 로드할 데이터 조회(현재 월, 전체 지역)
		List<FestivalMainVO> festivalMainVOList = festivalMainService
				.selectFestivalCalendarList(getMonth(0), null);
		// model 설정
		model.addAttribute("locationList", getStateList(festivalMainVOList));	// 지역 목록
		model.addAttribute("festivalList", festivalMainVOList);					// 표시할 축제 목록
		return "festival/festivalcalendar";
	}
	
	// 선택된 월별, 지역별 축제 일정 조회하여 데이터 전달
	@GetMapping(value="/festival/calendar/select")
	@ResponseBody
	public String selectFestivalCalendarList(Model model, @RequestParam(value="month") int month,
				@RequestParam(value="location", required = false, defaultValue = "전체") String location) {
		List<FestivalMainVO> festivalMainVOList = null;
		// 월만 선택된 경우(지역="전체")
		if(location.equals(SelectFilter.ALL_LOCATION)) {
			festivalMainVOList = festivalMainService.selectFestivalCalendarList(getMonth(month));
		} else {
			festivalMainVOList = festivalMainService.selectFestivalCalendarList(getMonth(month), location);
		}
		return "festival/festivalcalendar";
	}
	
	// D-Day 계산 메서드(util로 옮기는 것 고려)
	public String getDday(String startDate) {
		LocalDate fromDate = LocalDate.now();										// 현재 날짜
		LocalDate toDate = LocalDate.parse(startDate, DateTimeFormatter.ISO_DATE);	// 축제 시작일자
		logger.info("d-day: " + ChronoUnit.DAYS.between(fromDate, toDate));
		// 두 날짜 간 차이 계산하여 반환
		return Long.toString(ChronoUnit.DAYS.between(fromDate, toDate));
	}
	
	// 축제 리스트에서 지역명(시/도 단위) 배열 추출
	public String[] getStateList(List<FestivalMainVO> festivalMainVOList) {
		// 축제가 진행되는 지역명 추출
		TreeSet<String> stateNameSet = new TreeSet<String>();
		for(FestivalMainVO vo : festivalMainVOList) {
			stateNameSet.add(vo.getStateName());
		}
		return stateNameSet.toArray(new String[0]);
	}
	
	// 선택한 달을 DB에서 검색할 수 있도록 포맷 변환(util로 옮기는 것 고려)
	public String getMonth(int month) {
		LocalDate today = LocalDate.now();	// 현재 날짜
		// 1~9월의 경우
		if(month >= 1 && month <= 9) {
			return today.getYear() + "-0" + month;
		} else if(month == 13) {	// 10~12월의 경우
			return today.getYear() + "-" + month;
		} else if(month == 13) {	// 이듬해 1월의 경우
			return (today.getYear() + 1) + "-0" + (month - 12);
		} else {	// 그 외의 경우
			int monthValue = today.getMonthValue();
			if(monthValue < 10) {
				return today.getYear() + "-0" + monthValue;
			} else {
				return today.getYear() + "-" + monthValue;
			}
		}
	}
}
