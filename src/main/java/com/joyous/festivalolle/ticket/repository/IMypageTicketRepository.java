package com.joyous.festivalolle.ticket.repository;

import java.util.List;

import com.joyous.festivalolle.ticket.model.TicketVO;

public interface IMypageTicketRepository {
	List<TicketVO> selectTicketList(int memberCode);	// 티켓 리스트 출력
	TicketVO selectTicketInfo(int ticketCode);				// 티켓 상세 정보
}
