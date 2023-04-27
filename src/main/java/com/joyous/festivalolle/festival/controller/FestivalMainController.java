package com.joyous.festivalolle.festival.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.festival.model.FestivalMainVO;
import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festival.service.IFestivalMainService;
import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.util.constant.PageValue;
import com.joyous.festivalolle.util.constant.SelectFilter;
import com.joyous.festivalolle.util.status.AjaxResponseStatus;
import com.joyous.festivalolle.util.status.FestivalStatus;

// 홈페이지(메인)에 출력되는 축제 리스트 관리
// 작성자 : 이수봉
@Controller
public class FestivalMainController {
	@Autowired
	private IFestivalMainService festivalMainService;	// 서비스 객체 주입
	
	private static Logger logger = LoggerFactory.getLogger(FestivalMainController.class);	// logger 객체
	
	// 홈화면에 표시할 축제 리스트 정보 조회하여 데이터 전달
	@GetMapping(value={"/init", "/home"})
	public String selectFestivalMainList(Model model, HttpServletRequest request) {
		int recommend = PageValue.RECOMMEND;	// 추천 목록에 표시할 수
		List<FestivalMainVO> recommendList = festivalMainService.selectFestivalRecommendList(recommend);
		String mappingValue = request.getServletPath();		// 요청된 URL 참조
		if(mappingValue.equals("/init")) {
			model.addAttribute("isInit", true);
		}
		// 뷰에 표시할 데이터를 model 통해 전달
		model.addAttribute("recommendList", recommendList);		// 추천 목록
		return "mobilehome";
	}
	
	// 홈화면에 표시할 카테고리별 축제 리스트 정보 조회하여 데이터 전달
	@GetMapping(value="/categorylist")
	@ResponseBody
	public Map<String, Object> selectCategoryList(int category) {
		List<FestivalMainVO> defaultList = selectFestivalListByCategory(category, 0, PageValue.RECOMMEND);
		Map<String, Object> responseData = new HashMap<String, Object>();
		// 목록이 비어있지 않으면
		if(defaultList != null && defaultList.size() != 0) {
			responseData.put("fesList", defaultList);
			responseData.put("dataStatus", AjaxResponseStatus.NORMAL_TRUE);
		} else {
			responseData.put("dataStatus", AjaxResponseStatus.NORMAL_FALSE);
		}
		return responseData;
	}
	
	// 카테고리에 따라 축제 리스트 정보 조회하여 데이터 전달
	@GetMapping(value="/festival/list")
	public String selectFestivalList(@RequestParam(value="category") int category, 
									@RequestParam(value="title") String title, Model model) {
		List<FestivalMainVO> defaultList = null;
		// 해당 카테고리의 축제 목록 조회
		if(category == 1) {
			LocalDate startDayOfWeek = LocalDate.now().with(DayOfWeek.MONDAY).minusDays(1);		// 이번 주의 첫날 계산(일요일)
			LocalDate endDayOfWeek = startDayOfWeek.plusDays(6);								// 이번 주의 마지막날 계산(토요일)
			defaultList = festivalMainService.selectFestivalHotAllList(startDayOfWeek.toString(), endDayOfWeek.toString());
		} else {
			defaultList = selectFestivalListByCategory(category, 0, PageValue.PER_PAGE);
		}
		// 뷰에 표시할 데이터를 model 통해 전달
		model.addAttribute("defaultList", defaultList);
		model.addAttribute("title", title);
		model.addAttribute("category", category);
		return "festival/festivallist";
	}
	
	// 페이징 처리된 축제 목록 조회(스크롤이 bottom에 다다르면 Ajax 통신하여 자동 로딩)
	@PostMapping(value={"/home/more", "/festival/list/more", "/festival/search/more", "/festival/calendar/more"})
	@ResponseBody
	public Map<String, Object> selectPagingList(@RequestBody Map<String, Object> paramData, HttpServletRequest request) {
		String lastFestivalCodeData = (String)paramData.get("lastFestivalCode");
		int lastFestivalCode = (lastFestivalCodeData!=null)?Integer.parseInt(lastFestivalCodeData):0;	// 마지막으로 조회된 축제 코드
		// 데이터 저장할 변수 선언(축제 목록>List / ajax응답>HashMap)
		List<FestivalMainVO> festivalMainVOList = null;
		Map<String, Object> responseData = new HashMap<String, Object>();
		String mappingValue = request.getServletPath();		// 요청된 URL 참조
		switch (mappingValue) {
			case "/festival/list/more":		// 카테고리별 축제목록화면 페이징 처리
				int category = Integer.parseInt((String)paramData.get("category"));
				festivalMainVOList = selectFestivalListByCategory(category, lastFestivalCode, PageValue.PER_PAGE);
				break;
			case "/festival/search/more":	// 검색화면 페이징 처리
				String keyword = (String)paramData.get("keyword");
				if(!keyword.equals("")) {
					festivalMainVOList = festivalMainService.selectFestivalSearchList(keyword, lastFestivalCode,
																					PageValue.PER_PAGE);					
				}
				break;
			case "/festival/calendar/more":		// 축제일정화면 페이징 처리
				String periodStart = (String)paramData.get("periodStart");
				String periodEnd = (String)paramData.get("periodEnd");
				String location = (String)paramData.get("location");
				if(location.equals(SelectFilter.ALL_LOCATION)) {
					festivalMainVOList = festivalMainService.selectFestivalScheduleList(FestivalStatus.NOT_HIDE.ordinal(),
																						periodStart, periodEnd,
																						null, lastFestivalCode, PageValue.PER_PAGE);
				} else {
					festivalMainVOList = festivalMainService.selectFestivalScheduleList(FestivalStatus.NOT_HIDE.ordinal(),
																						periodStart, periodEnd,
																						location, lastFestivalCode, PageValue.PER_PAGE);
				}
				break;
			default:
				break;
		}
		// 목록이 비어있지 않으면
		if(festivalMainVOList != null && festivalMainVOList.size() != 0) {
			responseData.put("fesList", festivalMainVOList);
			responseData.put("dataStatus", AjaxResponseStatus.NORMAL_TRUE);
		} else {
			responseData.put("dataStatus", AjaxResponseStatus.NORMAL_FALSE);
		}
		responseData.put("dataClass", "festival");
		return responseData;
	}
	
	// 페이징 처리된 북마크 축제 목록 조회(스크롤이 bottom에 다다르면 Ajax 통신하여 자동 로딩)
	@PostMapping(value="/bookmark/list/more")
	@ResponseBody
	public Map<String, Object> selectPagingList(@RequestBody Map<String, Object> paramData, HttpSession session) {
		// 데이터 저장할 변수 선언(축제 목록>List / ajax응답>HashMap)
		List<FestivalMainVO> festivalMainVOList = null;
		Map<String, Object> responseData = new HashMap<String, Object>();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		String lastBookmarkCodeData = (String)paramData.get("lastBookmarkCode");
		int lastBookmarkCode = (lastBookmarkCodeData!=null)?Integer.parseInt(lastBookmarkCodeData):0;	// 마지막으로 조회된 북마크 코드
		// 세션 null 체크
		if(loginUser != null) {
			festivalMainVOList = festivalMainService.selectBookmarkList(loginUser.getMemberCode(), lastBookmarkCode, PageValue.PER_PAGE);
			// 목록이 비어있지 않으면
			if(festivalMainVOList != null && festivalMainVOList.size() != 0) {
				responseData.put("fesList", festivalMainVOList);
//				responseData.put("fesImages", convertByteArrayToString(images));
				responseData.put("dataStatus", AjaxResponseStatus.NORMAL_TRUE);
			} else {
				responseData.put("dataStatus", AjaxResponseStatus.NORMAL_FALSE);
			}
		} else {
			responseData.put("dataStatus", AjaxResponseStatus.NOT_SESSION);
		}
		responseData.put("dataClass", "festival");
		responseData.put("dataOption", "bookmark");
		return responseData;
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
		LocalDate today = LocalDate.now();		// 현재 일자
		int month = today.getMonthValue();		// 현재 월
		int week = 0;							// 현재 주차
		LocalDate[][] weekData = getWeekOfMonth(month);	// 현재 월의 주차 정보 계산
		
		// 현재 주차 계산
		for(int i = 0; i < weekData.length; i++) {
			if(today.compareTo(weekData[i][0]) >= 0 && today.compareTo(weekData[i][1]) <= 0) {
				week = i;
				break;
			}
		}
		
		// 지역 목록
		model.addAttribute("locationList", 
				festivalMainService.selectFestivalLocationList(weekData[week][0].toString(),
															weekData[week][1].toString()));
		// 표시할 축제 목록
		model.addAttribute("defaultList",
				festivalMainService.selectFestivalScheduleList(FestivalStatus.NOT_HIDE.ordinal(),
															weekData[week][0].toString(),
															weekData[week][1].toString(),
															null, 0, PageValue.PER_PAGE));					
		model.addAttribute("nowMonth", month);		// 현재 월
		model.addAttribute("nowWeek", week);		// 현재 주차
		model.addAttribute("weekData", getStringWeekOfMonth(weekData));	// 주차 정보(해당 주차 시작일, 종료일)
		
		return "festival/festivalcalendar";
	}
	
	// 선택된 월, 지역 축제 일정 조회하여 데이터 전달(지역 선택 안 되었을 시 선택된 월의 전체 축제 조회)
	@GetMapping(value="/festival/calendar/select")
	@ResponseBody
	public Map<String, Object> selectFestivalCalendarList(Model model, @RequestParam(value="month") int month,
			@RequestParam(value="location", required = false, defaultValue = "지역") String location, 
			@RequestParam(value="periodStart") String periodStart, @RequestParam(value="periodEnd") String periodEnd) {
		// 데이터 저장할 변수 선언(축제 목록>List / ajax응답>HashMap)
		List<FestivalMainVO> festivalMainVOList = null;
		Map<String, Object> responseData = new HashMap<String, Object>();
		// 조회한 축제 목록(지역 선택 안 할 경우 전체 지역 선택으로 간주)
		if(location.equals("지역")) {
			LocalDate[][] weekData = getWeekOfMonth(month);	// 현재 월의 주차 정보 계산
			LocalDate startDayOfMonth = weekData[0][0];					// 해당 월의 첫 날
			LocalDate endDayOfMonth = weekData[weekData.length - 1][1];	// 해당 월의 마지막 날
			festivalMainVOList = festivalMainService.selectFestivalScheduleList(FestivalStatus.NOT_HIDE.ordinal(),
																				startDayOfMonth.toString(),
																				endDayOfMonth.toString(),
																				null, 0, PageValue.PER_PAGE);
			responseData.put("weekData", getStringWeekOfMonth(weekData));
			responseData.put("locationList",
							festivalMainService.selectFestivalLocationList(startDayOfMonth.toString(),
																		endDayOfMonth.toString()));		// 지역 목록을 ajax응답에 저장
		} else if(location.equals(SelectFilter.ALL_LOCATION)) {
			festivalMainVOList = festivalMainService.selectFestivalScheduleList(FestivalStatus.NOT_HIDE.ordinal(),
																				periodStart, periodEnd,
																				null, 0, PageValue.PER_PAGE);
		} else {
			festivalMainVOList = festivalMainService.selectFestivalScheduleList(FestivalStatus.NOT_HIDE.ordinal(),
																				periodStart, periodEnd,
																				location, 0, PageValue.PER_PAGE);
		}
		responseData.put("fesList", festivalMainVOList);
		return responseData;
	}
	
	// 축제 검색 목록 조회
	@GetMapping(value="/festival/search")
	public String selectFestivalSearchList(String keyword, Model model) {
		List<FestivalMainVO> searchList = new ArrayList<FestivalMainVO>();
		// 검색 키워드가 빈 값이 아니면
		if(!keyword.equals("")) {
			List<FestivalMainVO> originSearchList = festivalMainService.selectFestivalSearchList(keyword, 0, PageValue.PER_PAGE);
			int originSize = originSearchList.size();
			for(int i = 0; i < PageValue.PER_PAGE; i++) {
				if(i < originSize) {
					searchList.add(originSearchList.get(i));
				} else {
					break;
				}
			}
			model.addAttribute("resultCount", originSearchList.size());	// 검색된 결과 수
		} else {
			model.addAttribute("resultCount", 0);	// 검색된 결과 수			
		}
		model.addAttribute("keyword", keyword);			// 검색한 키워드
		model.addAttribute("searchList", searchList);	// 검색 목록
		return "festival/festivalsearch";
	}
	
	// 북마크 목록 조회
	@GetMapping(value="/bookmark/list")
	public String selectBookmarkList(Model model, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		
		// 세션 null 체크
		if(loginUser != null) {
			model.addAttribute("defaultList", festivalMainService.selectBookmarkList(loginUser.getMemberCode(), 0, PageValue.PER_PAGE));
			return "mypage/bookmarklist";
		} else {
			return "member/gologin";
		}
	}
	
	// 카테고리에 따라 조회할 축제 목록 선택
	public List<FestivalMainVO> selectFestivalListByCategory(int category, int lastFestivalCode, int perPage) {
		List<FestivalMainVO> defaultList = null;
		// 카테고리에 따라 조회할 정보 선택
		switch(category) {
			case 1:		// 이번 주 HOT 축제
				LocalDate startDayOfWeek = LocalDate.now().with(DayOfWeek.MONDAY).minusDays(1);		// 이번 주의 첫날 계산(일요일)
				LocalDate endDayOfWeek = startDayOfWeek.plusDays(6);								// 이번 주의 마지막날 계산(토요일)
				defaultList = festivalMainService.selectFestivalHotList(startDayOfWeek.toString(),
																		endDayOfWeek.toString(),
																		lastFestivalCode, perPage);
				break;
			case 2:		// 축제 NOW(현재 진행 중인 축제)
				defaultList = festivalMainService.selectFestivalMainList(lastFestivalCode, perPage);
				break;
			case 3:		// COMING SOON(다음 주에 시작되는 축제)
				LocalDate startDayOfNextWeek = LocalDate.now().with(DayOfWeek.SUNDAY);	// 다음 주의 첫날 계산(일요일)
				LocalDate endDayOfNextWeek = startDayOfNextWeek.plusDays(6);			// 다음 주의 마지막날 계산(토요일)
				defaultList = festivalMainService.selectFestivalScheduleList(FestivalStatus.SCHEDULED.ordinal(),
																			startDayOfNextWeek.toString(),
																			endDayOfNextWeek.toString(),
																			null, lastFestivalCode, perPage);
				break;
		}
		return defaultList;
	}
	
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
		} else if(month >=10 && month <= 12) {	// 10~12월의 경우
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
	
	// LocalDate 타입 주차 데이터를 String 타입으로 일괄 변환
	public String[][] getStringWeekOfMonth(LocalDate[][] weekData) {
		String[][] stringWeekData = new String[weekData.length][2];
		for(int i = 0; i < weekData.length; i++) {
			stringWeekData[i][0] = weekData[i][0].toString();
			stringWeekData[i][1] = weekData[i][1].toString();
		}
		return stringWeekData;
	}
	
	// 선택한 달의 첫 날, 마지막 날 계산
	public LocalDate[] getStartAndEndDayOfMonth(int month) {
		String selectedMonth = getMonth(month);		// 해당 월을 yyyy-MM 포맷 문자열로 변환
		// 해당 월의 첫 날 계산
		LocalDate startDayOfMonth = LocalDate.parse(selectedMonth + "-01");
		// 해당 월의 마지막 날 계산
		LocalDate endDayOfMonth = LocalDate.parse(selectedMonth + "-" + startDayOfMonth.lengthOfMonth());
		LocalDate[] data = new LocalDate[2];
		data[0] = startDayOfMonth;
		data[1] = endDayOfMonth;
		//logger.info("월 시작, 종료일:" + startDayOfMonth + "/" + endDayOfMonth);
		return data;
	}
	
	// 선택한 달의 각 주차 시작일, 종료일 계산(util로 옮기는 것 고려)
	public LocalDate[][] getWeekOfMonth(int month) {
		LocalDate[] startAndEndDayOfMonth = getStartAndEndDayOfMonth(month);	// 선택한 달의 시작일, 종료일 계산
		LocalDate startDayOfFirstWeek = startAndEndDayOfMonth[0];	// 해당 월의 첫 날
		LocalDate endDayOfLastWeek = startAndEndDayOfMonth[1];		// 해당 월의 마지막 날
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
			if(startDayOfNextWeek.getMonthValue() == startDayOfFirstWeek.getMonthValue()) {
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
		logger.info("count of week:" + week);
		return weekOfMonth;
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
}
