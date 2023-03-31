package com.joyous.festivalolle.ticket.service;

import com.joyous.festivalolle.ticket.model.TicketVO;

//입장권 구매 서비스 인터페이스
public interface ITicketInsertService {
	void insertTicket(TicketVO ticketVO) throws Exception;	// 입장권 구매
}
