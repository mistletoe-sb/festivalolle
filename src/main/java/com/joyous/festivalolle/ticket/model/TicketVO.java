package com.joyous.festivalolle.ticket.model;
import lombok.Data;

//티켓 VO
//작성자: 이혜성

@Data
public class TicketVO {
	
	/* v_ticket_mypage */
	
	/* ticket */
	private int ticketCode;		//입장권 코드
	private int memberCode;		//회원 코드
	private int festivalCode;		//축제 코드
	private int headCount;			//사용인원
	private int fee;				//입장료
	private int couponAmount;		//쿠폰 금액
	private String purchaseTime;	//구매일시
	private String paymentTime;		//결제일시
	private String entranceTime;	//입장일시
	private String couponUseTime;	//쿠폰사용일시
	
	/* member */
	private String id;				//아이디
	private String password;		//비밀번호
	private String name;			//이름
	private String mobile;			//휴대폰번호
	private String birth;			//생년월일
	private String gender;			//성별
	private String status;			//회원 상태
	
	/* festival */
	private String title;			//축제명
	private String address;			//상세주소
	private String startDate;		//시작일자
	private String endDate;		//종료일자
	
	/* festival_image */
	private String image;			//이미지 원본
	private String thumbnail;		//이미지썸네일
}

