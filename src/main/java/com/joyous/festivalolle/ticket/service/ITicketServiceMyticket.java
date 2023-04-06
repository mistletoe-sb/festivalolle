package com.joyous.festivalolle.ticket.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.ticket.model.TicketVOmyticket;
import com.joyous.festivalolle.ticket.model.TicketVOvalidator;



public interface ITicketServiceMyticket {
	
	//현재 사용 가능한 이용권 리스트
	List<TicketVOmyticket> getMyCurrentTicket(int memberCode);
	
	//관리자 티켓 확인용 이용권 정보
	TicketVOvalidator ticketValidate(int memberCode, int ticketCode);
	
	//입장 확인
	int validateEntrance(int ticketCode);
	
	//쿠폰 사용 확인
	int validateCoupon(int ticketCode);
}
