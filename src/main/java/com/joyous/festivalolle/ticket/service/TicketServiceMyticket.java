package com.joyous.festivalolle.ticket.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.joyous.festivalolle.ticket.model.TicketVOmyticket;
import com.joyous.festivalolle.ticket.model.TicketVOvalidator;
import com.joyous.festivalolle.ticket.repository.ITicketRepositoryMyticket;

@Service
public class TicketServiceMyticket implements ITicketServiceMyticket {
	
	@Autowired
	ITicketRepositoryMyticket ticketRepositoryMyticket;
	
	//현재 사용 가능한 이용권 리스트
	@Override
	public List<TicketVOmyticket> getMyCurrentTicket(int memberCode) {
		return ticketRepositoryMyticket.getMyCurrentTicket(memberCode);
	}
	
	//관리자 티켓 확인용 이용권 정보
	@Override	
	public TicketVOvalidator ticketValidate(int memberCode, int ticketCode) {
		return ticketRepositoryMyticket.ticketValidate(memberCode, ticketCode);
	}

	
}
