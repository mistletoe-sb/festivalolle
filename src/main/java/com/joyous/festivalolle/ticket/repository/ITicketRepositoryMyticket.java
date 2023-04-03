package com.joyous.festivalolle.ticket.repository;

import java.util.List;

import com.joyous.festivalolle.ticket.model.TicketVO;

// 입장권 구매 repository 인터페이스
public interface ITicketRepositoryMyticket {
	
	List<TicketVO> getMyCurrentTicket(int memberCode);
	
	
}
