package com.joyous.festivalolle.ticket.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.ticket.model.TicketVOmyticket;
import com.joyous.festivalolle.ticket.model.TicketVOvalidator;

// 입장권 구매 repository 인터페이스
public interface ITicketRepositoryMyticket {
	//현재 사용 가능한 이용권 리스트
	List<TicketVOmyticket> getMyCurrentTicket(int memberCode);
	
	//관리자 티켓 확인용 이용권 정보
	TicketVOvalidator ticketValidate(@Param("memberCode") int memberCode, @Param("ticketCode")int ticketCode);
	
	//입장 확인
	int validateEntrance(int ticketCode);
	
	//쿠폰 사용 확인
	int validateCoupon(int ticketCode);
	
	
}
