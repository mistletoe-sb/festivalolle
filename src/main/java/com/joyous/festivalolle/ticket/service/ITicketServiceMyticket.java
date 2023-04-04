package com.joyous.festivalolle.ticket.service;

import java.util.List;



import com.joyous.festivalolle.ticket.model.TicketVOmyticket;



public interface ITicketServiceMyticket {
	
	List<TicketVOmyticket> getMyCurrentTicket(int memberCode);
}
