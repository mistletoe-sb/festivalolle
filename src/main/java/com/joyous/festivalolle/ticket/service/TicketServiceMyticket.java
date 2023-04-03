package com.joyous.festivalolle.ticket.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;
import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;
import com.joyous.festivalolle.ticket.repository.ITicketRepository;
import com.joyous.festivalolle.ticket.repository.ITicketRepositoryMyticket;

@Service
public class TicketServiceMyticket implements ITicketServiceMyticket {
	
	@Autowired
	ITicketRepositoryMyticket ticketRepositoryMyticket;

	@Override
	public List<TicketVO> getMyCurrentTicket(int memberCode) {
		return ticketRepositoryMyticket.getMyCurrentTicket(memberCode);
	}

	
}
