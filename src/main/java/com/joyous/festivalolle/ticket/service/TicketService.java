package com.joyous.festivalolle.ticket.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;
import com.joyous.festivalolle.ticket.repository.ITicketRepository;

@Service
public class TicketService implements ITicketService {
	
	@Autowired
	ITicketRepository ticketRepository;

	@Override
	public List<V_ticketBuyerListVO> ticketBuyerList(V_ticketBuyerListVO buyerListVO) {
		
		return ticketRepository.ticketBuyerList(buyerListVO);
	}

	@Override
	public int totalBuyerCount() {
		
		return ticketRepository.totalBuyerCount(); //구매자 목록의 행 수;
	}

	@Override
	public List<V_ticketBuyerListVO> searchBuyer(V_ticketBuyerListVO buyerList) {
	
		return  ticketRepository.searchBuyer(buyerList);
	}

}
