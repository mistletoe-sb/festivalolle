package com.joyous.festivalolle.festival.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
		int month = LocalDate.now().getMonthValue();
		// 기본 페이지에 로드할 데이터 조회(현재 월, 전체 지역)
		List<FestivalMainVO> festivalMainVOList = festivalMainService
				.selectFestivalCalendarList(getMonth(month), null);
		// model 설정
		model.addAttribute("locationList", getStateList(festivalMainVOList));	// 지역 목록
		model.addAttribute("festivalList", festivalMainVOList);					// 표시할 축제 목록
		// 주차 별 축제 정보
		model.addAttribute("weekData", getFestivalListIndexEachWeek(festivalMainVOList, getMonth(month)));
		model.addAttribute("nowMonth", month);									// 현재 월
		return "festival/festivalcalendar";
	}
	
	/*
	 * // 선택된 달의 전체 축제 일정 조회하여 데이터 전달
	 * 
	 * @GetMapping(value="/festival/calendar/selectmonth")
	 * 
	 * @ResponseBody public HashMap<String, Object> selectFestivalCalendarList(Model
	 * model, @RequestParam(value="month") int month) { // 조회한 축제 목록
	 * List<FestivalMainVO> festivalMainVOList =
	 * festivalMainService.selectFestivalCalendarList(getMonth(month), null); //
	 * ajax 응답 데이터 생성(지역 리스트 + 축제 리스트) HashMap<String, Object> responseData = new
	 * HashMap<String, Object>(); responseData.put("locationList",
	 * getStateList(festivalMainVOList)); responseData.put("festivalList",
	 * festivalMainVOList); return responseData; }
	 */
	
	// 선택된 월, 지역 축제 일정 조회하여 데이터 전달(지역 선택 안 되었을 시 선택된 월의 전체 축제 조회)
	@GetMapping(value="/festival/calendar/select")
	@ResponseBody
	public Map<String, Object> selectFestivalCalendarList(Model model, @RequestParam(value="month") int month,
			@RequestParam(value="location", required = false, defaultValue = "전체") String location) {
		// 선택한 월 추출값(yyyy-MM 포맷)
		String selectedMonth = getMonth(month);
		// 데이터 저장할 변수 선언(축제 목록>List / ajax응답>HashMap)
		List<FestivalMainVO> festivalMainVOList = null;
		Map<String, Object> responseData = new HashMap<String, Object>();
		// 조회한 축제 목록(지역 선택 안 할 경우 전체 지역 선택으로 간주)
		if(location.equals(SelectFilter.ALL_LOCATION)) {
			festivalMainVOList = festivalMainService.selectFestivalCalendarList(selectedMonth);
			responseData.put("locationList", getStateList(festivalMainVOList));		// 지역 목록을 ajax응답에 저장
		} else {
			festivalMainVOList = festivalMainService.selectFestivalCalendarList(selectedMonth, location);
		}
		// ajax 응답 데이터 생성(주차(week) 정보 + 축제 리스트)
		responseData.put("weekData", getFestivalListIndexEachWeek(festivalMainVOList, selectedMonth));
		return responseData;
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
	
	// 선택한 달을 DB에서 검색할 수 있도록 포맷 변환(yyyy-MM 포맷)(util로 옮기는 것 고려)
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
	
	// 주차(week) 정보 추출
	public Map<Integer, List<FestivalMainVO>> getFestivalListIndexEachWeek(List<FestivalMainVO> festivalMainVOList
			, String selectedMonth) {
		// 해당 월의 첫 날 계산
		LocalDate startDayOfFirstWeek = LocalDate.parse(selectedMonth + "-01");
		// 해당 월의 마지막 날 계산
		LocalDate endDayOfLastWeek = LocalDate.parse(selectedMonth + "-" + startDayOfFirstWeek.lengthOfMonth());
		// 선택된 월의 각 주차 시작일 목록 추출(각 주차는 일요일~월요일 기준)
		List<LocalDate> startDateOfMonthList = new ArrayList<LocalDate>();
		startDateOfMonthList.add(startDayOfFirstWeek);
		// 해당 월의 첫 날이 무슨 요일인지에 따라 2주차 시작일 계산
		switch(startDayOfFirstWeek.getDayOfWeek().getValue()) {
			case 1: startDateOfMonthList.add(startDayOfFirstWeek.plusDays(6)); break;
			case 2: startDateOfMonthList.add(startDayOfFirstWeek.plusDays(5)); break;
			case 3: startDateOfMonthList.add(startDayOfFirstWeek.plusDays(4)); break;
			case 4: startDateOfMonthList.add(startDayOfFirstWeek.plusDays(3)); break;
			case 5: startDateOfMonthList.add(startDayOfFirstWeek.plusDays(2)); break;
			case 6: startDateOfMonthList.add(startDayOfFirstWeek.plusDays(1)); break;
			case 7: break;
		}
		// 해당 월의 마지막 날이 있는 주차까지의 시작일 목록 추출
		boolean isCurrentMonth = true;
		while(isCurrentMonth) {
			int currentSize = startDateOfMonthList.size();	// 현재 리스트 사이즈
			LocalDate startDayOfNextWeek = startDateOfMonthList.get(currentSize - 1).plusWeeks(1);	// 다음 주차의 시작일
			// 시작일이 현재 월에 포함될 경우 리스트에 추가
			if(startDayOfNextWeek.getMonthValue() == startDayOfFirstWeek.getMonthValue()) {
				startDateOfMonthList.add(startDayOfNextWeek);
			} else {
				isCurrentMonth = false;		// 반복문 종료 조건
			}
		}
		// 축제의 시작 및 종료일자를 LocalDate형으로 변환한 배열 추출
		LocalDate[][] festivalPeriodList = new LocalDate[festivalMainVOList.size()][2];
		for(int i = 0; i < festivalMainVOList.size(); i++) {
			festivalPeriodList[i][0] = LocalDate.parse(festivalMainVOList.get(i).getStartDate());
			festivalPeriodList[i][1] = LocalDate.parse(festivalMainVOList.get(i).getEndDate());
		}
		
		// 조회한 축제 목록 중 각 주차별로 진행되는 축제가 위치하는 인덱스 추출
		Map<Integer, List<FestivalMainVO>> festivalListIndexEachWeek = new HashMap<Integer, List<FestivalMainVO>>();
		for(int week = 0; week < startDateOfMonthList.size(); week++) {
			List<FestivalMainVO> listIndexEachWeek = new ArrayList<FestivalMainVO>();
			for(int i = 0; i < festivalPeriodList.length; i++) {
				// 축제 시작일자가 해당 주의 종료일 이전이고, 축제 종료일자가 해당 주의 시작일 이후이면 해당 축제가 저장된 인덱스 추출
				if(week < startDateOfMonthList.size() - 1) {
					if(festivalPeriodList[i][0].isAfter(startDateOfMonthList.get(week).minusDays(1))
							&& festivalPeriodList[i][1].isBefore(startDateOfMonthList.get(week + 1))) {
						listIndexEachWeek.add(festivalMainVOList.get(i));
					}
				} else {
					if(festivalPeriodList[i][0].isAfter(startDateOfMonthList.get(week).minusDays(1))
							&& festivalPeriodList[i][1].isBefore(endDayOfLastWeek.plusDays(1))) {
						listIndexEachWeek.add(festivalMainVOList.get(i));
					}
				}
				festivalListIndexEachWeek.put(week + 1, listIndexEachWeek);	// 각 주차별 축제 목록 인덱스 저장
			}
		}
		return festivalListIndexEachWeek;
	}
}
