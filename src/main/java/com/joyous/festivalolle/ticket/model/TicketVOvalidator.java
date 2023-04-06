package com.joyous.festivalolle.ticket.model;
import lombok.Data;


@Data
public class TicketVOvalidator {
	
	private int ticketCode;
	private int memberCode;
	private int festivalCode;
	private String title;
	private String name;
	private String mobile;
	private int headCount;
	private int couponAmount;
	private String entranceTime;
	private String couponUseTime;
}
