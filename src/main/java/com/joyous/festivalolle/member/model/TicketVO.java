package com.joyous.festivalolle.member.model;
import lombok.Data;

//티켓 VO
//작성자: 이혜성

@Data
public class TicketVO {
	
	private int ticket_code;
	private int member_code;
	private int festival_code;
	private int head_count;
	private int fee;
	private int coupon_amount;
	private String purchase_time;
	private String payment_time;
	private String entrance_time;
	private String coupon_use_time;
}
