package com.joyous.festivalolle.ticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.repository.ITicketInsertRepository;

// 입장권 구매 서비스 구현 클래스
@Service
public class TicketInsertService implements ITicketInsertService{

	@Autowired
	ITicketInsertRepository ticketInsertRepository;		// repository 객체 주입
	
	@Override
	@Transactional
	public void insertTicket(TicketVO ticketVO) throws Exception {
		int check = ticketInsertRepository.insertTicket(ticketVO);
		if(check != 1) {
			throw new Exception("입장권 구매에 실패했습니다.");
		}
	}

}
