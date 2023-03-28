package com.joyous.festivalolle.member.model;
import lombok.Data;

	//축제정보 VO
	//작성자: 이혜성

@Data
public class FestivalVO {

	private int festivalCode; 		//축제 코드
	private String title;			//축제명
	private String stateName;		//지역명(시/도 단위)
	private String cityName;		//지역명(시/군/구 단위)
	private String address;			//상세주소
	private String startDate;		//시작일자
	private String endDate;		//종료일자
	private int fee;				//입장료
	private String url;				//홈페이지 URL
	private int organizationCode;	//기관 코드
	private String telephone;		//기관 전화번호
	private String adminName;		//담당자명
	private String detail;			//상세설명
	private String tags;			//태그
	private String registerDate;	//등록일자
	private int status;				//축제 상태
}
