package com.joyous.festivalolle.festival.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Base64;
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
		List<FestivalMainVO> recommendList = festivalMainService.selectFestivalRecommendList(recommend);
		List<FestivalMainVO> defaultList = festivalMainService.selectFestivalMainList();
		// 뷰에 표시할 이미지 binary 데이터 추출
		List<byte[]> recommendListImages = new ArrayList<byte[]>();
		List<byte[]> defaultListImages = new ArrayList<byte[]>();
		for(FestivalMainVO vo : recommendList) {
			recommendListImages.add(vo.getImage());
		}
		for(FestivalMainVO vo : defaultList) {
			defaultListImages.add(vo.getImage());
		}
		
		// 뷰에 표시할 데이터를 model 통해 전달
		model.addAttribute("recommendList", recommendList);		// 추천 목록
		model.addAttribute("recommendListImages", 
				convertByteArrayToString(recommendListImages));	// 추천 목록에 표시할 이미지 목록
		model.addAttribute("defaultList", defaultList);			// 기본 목록
		model.addAttribute("defaultListImages", 
				convertByteArrayToString(defaultListImages));	// 기본 목록에 표시할 이미지 목록
		model.addAttribute("recommend", recommend);				// 추천 개수
		return "mobilehome";
	}
	
	// 축제 상세 정보 조회하여 데이터 전달
	@GetMapping(value="/festival/info")
	public String selectFestivalInfo(Model model, @RequestParam(value="festivalCode") int festivalCode) {
		// 축제 코드에 해당하는 상세 정보 조회(이미지가 여러 개인 경우를 고려하여 List 타입)
		List<FestivalVO> festivalVOList = festivalMainService.selectFestialInfo(festivalCode);
		// 뷰에 표시할 이미지 binary 데이터 추출
		List<byte[]> festivalImages = new ArrayList<byte[]>();
		for(FestivalVO vo : festivalVOList) {
			festivalImages.add(vo.getImage());
		}
		model.addAttribute("statusMsg", getFestivalStatus(festivalVOList.get(0)));	// 축제 상태 정보
		model.addAttribute("fesInfo", festivalVOList);	// 상세 정보
		model.addAttribute("fesInfoImages", convertByteArrayToString(festivalImages));	// 해당 축제에 등록된 이미지 목록
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
		Map<Integer, List<FestivalMainVO>> weekData = getFestivalListEachWeek(festivalMainVOList, month);
		// 주차 별 축제 이미지 목록 추출
		Map<Integer, List<byte[]>> weekDataImages = getImageBinaryDataList(weekData);
		model.addAttribute("weekData", weekData);			// 주차 별 축제 목록
		model.addAttribute("weekDataImages", 
				convertByteArrayToString(weekDataImages));	// 주차 별 축제 이미지 목록
		model.addAttribute("nowMonth", month);				// 현재 월
		return "festival/festivalcalendar";
	}
	
	// 선택된 월, 지역 축제 일정 조회하여 데이터 전달(지역 선택 안 되었을 시 선택된 월의 전체 축제 조회)
	@GetMapping(value="/festival/calendar/select")
	@ResponseBody
	public Map<String, Object> selectFestivalCalendarList(Model model, @RequestParam(value="month") int month,
			@RequestParam(value="location", required = false, defaultValue = "전체") String location) {
		// 데이터 저장할 변수 선언(축제 목록>List / ajax응답>HashMap)
		List<FestivalMainVO> festivalMainVOList = null;
		Map<String, Object> responseData = new HashMap<String, Object>();
		// 조회한 축제 목록(지역 선택 안 할 경우 전체 지역 선택으로 간주)
		if(location.equals(SelectFilter.ALL_LOCATION)) {
			festivalMainVOList = festivalMainService.selectFestivalCalendarList(getMonth(month), null);
			responseData.put("locationList", getStateList(festivalMainVOList));		// 지역 목록을 ajax응답에 저장
		} else {
			festivalMainVOList = festivalMainService.selectFestivalCalendarList(getMonth(month), location);
		}
		// 주차 별 축제 정보
		Map<Integer, List<FestivalMainVO>> weekData = getFestivalListEachWeek(festivalMainVOList, month);
		// 주차 별 축제 이미지 목록 추출
		Map<Integer, List<byte[]>> weekDataImages = getImageBinaryDataList(weekData);
		// ajax 응답 데이터 생성(주차(week) 정보 + 주차 별 축제 이미지 목록)
		responseData.put("weekData", weekData);
		responseData.put("weekDataImages", convertByteArrayToString(weekDataImages));
		return responseData;
	}
	
	// 축제 검색 목록 조회
	@GetMapping(value="festival/search")
	public String selectFestivalSearchList(String keyword, Model model) {
		List<FestivalMainVO> searchList = festivalMainService.selectFestivalSearchList(keyword);
		// 뷰에 표시할 이미지 binary 데이터 추출
		List<byte[]> searchListImages = new ArrayList<byte[]>();
		for(FestivalMainVO vo : searchList) {
			searchListImages.add(vo.getImage());
		}
		model.addAttribute("searchList", searchList);	// 검색 목록
		model.addAttribute("searchListImages", convertByteArrayToString(searchListImages));	// 검색 목록에 표시할 이미지 목록
		return "festival/festivalsearch";
	}
	
	/*
	 * // D-Day 계산 메서드(util로 옮기는 것 고려) public String getDday(String startDate) {
	 * LocalDate fromDate = LocalDate.now(); // 현재 날짜 LocalDate toDate =
	 * LocalDate.parse(startDate, DateTimeFormatter.ISO_DATE); // 축제 시작일자
	 * logger.info("d-day: " + ChronoUnit.DAYS.between(fromDate, toDate)); // 두 날짜 간
	 * 차이 계산하여 반환 return Long.toString(ChronoUnit.DAYS.between(fromDate, toDate)); }
	 */

	// 축제 상태 표시 메시지 반환 메서드
	public String getFestivalStatus(FestivalVO festivalVO) {
		// 축제 상태(진행 중, 진행 예정, 종료)에 따라 표시할 메시지 반환
		switch (festivalVO.getStatus()) {
			// 진행 중
			case 1:
				return "진행 중";
			// 진행 예정
			case 2:
				LocalDate fromDate = LocalDate.now();								// 현재 날짜
				LocalDate toDate = LocalDate.parse(festivalVO.getStartDate(), 
													DateTimeFormatter.ISO_DATE);	// 축제 시작일자
				// 두 날짜 간 차이 계산하여 반환
				return "D-" + ChronoUnit.DAYS.between(fromDate, toDate);
			// 종료
			case 3:
				return "종료";
			// 그 외
			default:
				return "숨김";
		}
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
	
	// 선택한 달의 각 주차 시작일, 종료일 계산(util로 옮기는 것 고려)
	public LocalDate[][] getWeekOfMonth(int month) {
		String selectedMonth = getMonth(month);		// 해당 월을 yyyy-MM 포맷 문자열로 변환
		// 해당 월의 첫 날 계산
		LocalDate startDayOfFirstWeek = LocalDate.parse(selectedMonth + "-01");
		// 해당 월의 마지막 날 계산
		LocalDate endDayOfLastWeek = LocalDate.parse(selectedMonth + "-" + startDayOfFirstWeek.lengthOfMonth());
		// 선택된 월의 각 주차 시작일 목록 추출(각 주차는 일요일~월요일 기준)
		List<LocalDate> startDateOfWeekList = new ArrayList<LocalDate>();
		startDateOfWeekList.add(startDayOfFirstWeek);
		// 해당 월의 첫 날이 무슨 요일인지에 따라 2주차 시작일 계산
		switch(startDayOfFirstWeek.getDayOfWeek().getValue()) {
			case 1: startDateOfWeekList.add(startDayOfFirstWeek.plusDays(6)); break;
			case 2: startDateOfWeekList.add(startDayOfFirstWeek.plusDays(5)); break;
			case 3: startDateOfWeekList.add(startDayOfFirstWeek.plusDays(4)); break;
			case 4: startDateOfWeekList.add(startDayOfFirstWeek.plusDays(3)); break;
			case 5: startDateOfWeekList.add(startDayOfFirstWeek.plusDays(2)); break;
			case 6: startDateOfWeekList.add(startDayOfFirstWeek.plusDays(1)); break;
			case 7: break;
		}
		// 해당 월의 마지막 날이 있는 주차까지의 시작일 목록 추출
		boolean isCurrentMonth = true;
		while(isCurrentMonth) {
			int currentSize = startDateOfWeekList.size();	// 현재 리스트 사이즈
			LocalDate startDayOfNextWeek = startDateOfWeekList.get(currentSize - 1).plusWeeks(1);	// 다음 주차의 시작일
			// 시작일이 현재 월에 포함될 경우 리스트에 추가
			if(startDayOfNextWeek.getMonthValue() == month) {
				startDateOfWeekList.add(startDayOfNextWeek);
			} else {
				isCurrentMonth = false;		// 반복문 종료 조건
			}
		}
		// 각 주차의 시작일과 종료일을 담은 배열 생성하여 반환
		int week = startDateOfWeekList.size();
		LocalDate[][] weekOfMonth = new LocalDate[week][2];
		for(int i = 0; i < week; i++) {
			if(i < week - 1) {
				weekOfMonth[i][0] = startDateOfWeekList.get(i);						// 해당 주차의 시작일
				weekOfMonth[i][1] = startDateOfWeekList.get(i + 1).minusDays(1);	// 해당 주차의 종료일
			} else {
				weekOfMonth[i][0] = startDateOfWeekList.get(i);						// 마지막 주차의 시작일
				weekOfMonth[i][1] = endDayOfLastWeek;								// 마지막 주차의 종료일				
			}
		}
		return weekOfMonth;
	}
	
	// 주차(week)별 축제 정보 추출
	public Map<Integer, List<FestivalMainVO>> getFestivalListEachWeek(List<FestivalMainVO> festivalMainVOList
			, int month) {
		// 선택한 달의 주차별 시작 및 종료일을 계산한 배열 획득
		LocalDate[][] weekOfMonth = getWeekOfMonth(month);
		// 축제의 시작 및 종료일자를 LocalDate형으로 변환한 배열 추출
		LocalDate[][] festivalPeriodList = new LocalDate[festivalMainVOList.size()][2];
		for(int i = 0; i < festivalMainVOList.size(); i++) {
			festivalPeriodList[i][0] = LocalDate.parse(festivalMainVOList.get(i).getStartDate());
			festivalPeriodList[i][1] = LocalDate.parse(festivalMainVOList.get(i).getEndDate());
		}
		
		// 조회한 축제 목록 중 각 주차별로 진행되는 축제 목록 추출
		Map<Integer, List<FestivalMainVO>> festivalListEachWeek = new HashMap<Integer, List<FestivalMainVO>>();
		for(int week = 0; week < weekOfMonth.length; week++) {
			// 해당 주차의 진행 축제 목록 저장
			List<FestivalMainVO> listIndexEachWeek = new ArrayList<FestivalMainVO>();
			for(int i = 0; i < festivalPeriodList.length; i++) {
				// 해당 주에 진행 중인 축제를 리스트에 추가
				if(checkInProgress(festivalPeriodList[i], weekOfMonth[week])) {
					listIndexEachWeek.add(festivalMainVOList.get(i));
				}
			}
			festivalListEachWeek.put(week + 1, listIndexEachWeek);	// 각 주차별 축제 목록 저장
		}
		return festivalListEachWeek;
	}
	
	// 주어진 기간 내에서 진행 중인 축제인지 판별하는 메서드
	public boolean checkInProgress(LocalDate[] festivalPeriod, LocalDate[] setPeriod) {
		LocalDate setStart = setPeriod[0];					// 기간 시작일
		LocalDate setEnd = setPeriod[1];					// 기간 종료일
		LocalDate festivalStartDate = festivalPeriod[0];	// 축제 시작일
		LocalDate festivalEndDate = festivalPeriod[1];		// 축제 종료일
		
		// 축제 시작일자가 주어진 기간의 종료일 이전이고, 축제 종료일자가 주어진 기간의 시작일 이후이면 true 반환
		if(festivalStartDate.isBefore(setEnd) && festivalEndDate.isAfter(setStart)) {
			return true;
		} else {
			return false;
		}
	}
	
	// 이미지 binary 배열을 string으로 변환하는 메서드(이미지가 여러 개인 경우를 고려하여 결과값을 String[]으로 반환)(util로 이동 고려)
	public String[] convertByteArrayToString(List<byte[]> imageList) {
		String[] imageDataArray = new String[imageList.size()];
		for(int i = 0; i < imageDataArray.length; i++) {
			if(imageList.get(i) != null) {
				imageDataArray[i] = Base64.getEncoder().encodeToString(imageList.get(i));	// 이미지 원본이 존재하면, 문자열로 인코딩
			} else {
				imageDataArray[i] = null;
			}
		}
		return imageDataArray;
	}
	// 이미지 binary 데이터 변환(오버로딩)
	public Map<Integer, String[]> convertByteArrayToString(Map<Integer, List<byte[]>> imageList) {
		Map<Integer, String[]> imageDataMap = new HashMap<Integer, String[]>();
		for(Integer key : imageList.keySet()) {
			List<byte[]> tempList = imageList.get(key);
			String[] images = new String[tempList.size()];
			for(int i = 0; i < images.length; i++) {
				if(tempList.get(i) != null) {
					images[i] = Base64.getEncoder().encodeToString(tempList.get(i));	// 이미지 원본이 존재하면, 문자열로 인코딩
				} else {
					images[i] = null;
				}
			}
			imageDataMap.put(key, images);
		}
		return imageDataMap;
	}
	
	// 주차 별 축제 이미지 binary 데이터 목록 추출
	public Map<Integer, List<byte[]>> getImageBinaryDataList(Map<Integer, List<FestivalMainVO>> weekData) {
		// 주차 별 축제 이미지 목록 추출
		Map<Integer, List<byte[]>> weekDataImages = new HashMap<Integer, List<byte[]>>();
		for(Integer key : weekData.keySet()) {
			List<byte[]> images = new ArrayList<byte[]>();
			for(FestivalMainVO vo : weekData.get(key)) {
				images.add(vo.getImage());
			}
			weekDataImages.put(key, images);
		}
		return weekDataImages;
	}
}
