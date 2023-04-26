package com.joyous.festivalolle.ticket.model;
import lombok.Data;


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
	private int headCount;
	private int couponAmount;
}
