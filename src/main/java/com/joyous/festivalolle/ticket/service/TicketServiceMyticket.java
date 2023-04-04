package com.joyous.festivalolle.ticket.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.joyous.festivalolle.ticket.model.TicketVOmyticket;
import com.joyous.festivalolle.ticket.repository.ITicketRepositoryMyticket;

@Service
public class TicketServiceMyticket implements ITicketServiceMyticket {
	
	@Autowired
	ITicketRepositoryMyticket ticketRepositoryMyticket;

	@Override
	public List<TicketVOmyticket> getMyCurrentTicket(int memberCode) {
		return ticketRepositoryMyticket.getMyCurrentTicket(memberCode);
	}

	
}
