package com.joyous.festivalolle.ticket.repository;

import com.joyous.festivalolle.ticket.model.TicketVO;

// 입장권 구매 repository 인터페이스
public interface ITicketInsertRepository {
	int insertTicket(TicketVO ticketVO);	// 입장권 구매
}
