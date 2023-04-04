package com.joyous.festivalolle.ticket.repository;

import java.util.List;


import com.joyous.festivalolle.ticket.model.TicketVOmyticket;

// 입장권 구매 repository 인터페이스
public interface ITicketRepositoryMyticket {
	
	List<TicketVOmyticket> getMyCurrentTicket(int memberCode);
	
	
}
