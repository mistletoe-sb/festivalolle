package com.joyous.festivalolle.ticket.model;
import lombok.Data;

//티켓 VO
//작성자: 이혜성

@Data
public class TicketVO {
	
	private int tickeCode;
	private int memberCode;
	private int festivalCode;
	private int headCount;
	private int fee;
	private int couponAmount;
	private String purchaseTime;
	private String paymentTime;
	private String entranceTime;
	private String couponUseTime;
}
