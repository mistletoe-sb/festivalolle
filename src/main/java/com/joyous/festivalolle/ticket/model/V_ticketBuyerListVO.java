package com.joyous.festivalolle.ticket.model;
import lombok.Data;

//구매자 목록 VO
//작성자: 이혜성

@Data
public class V_ticketBuyerListVO {
	
	private int ticketCode;			//구매자 티켓 코드
	private int festivalCode;		//축제코드
	private String id;				//구매자 id
	private String name;			//구매자 이름
	private String mobile;			//구매자 전화번호
	private String purchaseTime;	//구매일시
	private String entranceTime;	//입장일시
	private String couponUseTime;	//쿠폰사용일시
	private int organizationCode;	//기관코드
	private String title;			//축제명
	private String startDate;			// 시작일자
	private String endDate;				// 종료일자
	
}
