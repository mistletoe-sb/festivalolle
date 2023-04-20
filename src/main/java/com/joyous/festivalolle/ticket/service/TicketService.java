package com.joyous.festivalolle.ticket.service;

import java.util.List;
import java.util.Map;

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
	public int countBuyer(int organizationCode, int titleListInput, String tableBoxInput, String searchInput) {
		return ticketRepository.countBuyer(organizationCode,titleListInput, tableBoxInput, searchInput); //구매자 목록의 행 수;
	}


	@Override
	public List<V_ticketBuyerListVO> searchBuyer(int organizationCode, String buyerKeyword, String tableBox) {
		return  ticketRepository.searchBuyer(organizationCode,buyerKeyword,tableBox);

	}

	@Override
	public List<V_ticketBuyerListVO> selectYearTitleList(V_ticketBuyerListVO buyerList) {
		
		return ticketRepository.selectYearTitleList(buyerList);
	}

	public List<V_ticketBuyerListVO> selectYearBuyer(V_ticketBuyerListVO buyerListVO) {
		return ticketRepository.selectYearBuyer(buyerListVO);
	}

	@Override
	public List<V_ticketBuyerListVO> selectBoard(Map<String, Object> map) {
		return ticketRepository.selectBoard(map);
	}
}
