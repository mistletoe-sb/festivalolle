package com.joyous.festivalolle.ticket.model;
import lombok.Data;

//티켓 VO
//작성자: 이혜성

@Data
public class TicketVOmyticket {
	
	private int ticketCode;
	private int memberCode;
	private int festivalCode;
	private String entranceTime;
	private String couponUseTime;
	private String title;
	private String startDate;
	private String endDate;
	private int status;
	private byte[] image;
}
