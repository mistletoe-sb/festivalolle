package com.joyous.festivalolle.ticket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.repository.IMypageTicketRepository;

@Service
public class MypageTicketService implements IMypageTicketService {

	@Autowired
	private IMypageTicketRepository mypageTicketRepository;	// mypageTicketRepository 객체
	
	@Override
	public List<TicketVO> selectTicketList(int memberCode) {
		return mypageTicketRepository.selectTicketList(memberCode);
	}

	@Override
	public TicketVO selectTicketInfo(int ticketCode) {
		return mypageTicketRepository.selectTicketInfo(ticketCode);
	}

}
