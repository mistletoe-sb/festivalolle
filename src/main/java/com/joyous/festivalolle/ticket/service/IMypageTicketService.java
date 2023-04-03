package com.joyous.festivalolle.ticket.service;

import java.util.List;

import com.joyous.festivalolle.ticket.model.TicketVO;

public interface IMypageTicketService {
	List<TicketVO> selectTicketList(int memberCode);	// 티켓 리스트 출력
	TicketVO selectTicketInfo(TicketVO vo);				// 티켓 상세 정보
}
