package com.joyous.festivalolle.ticket.repository;

import java.util.List;

import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;

//작성자: 이혜성
// 티켓(구매자목록 포함) 정보 인터페이스

public interface ITicketRepository {
	
	List<V_ticketBuyerListVO> ticketBuyerList(V_ticketBuyerListVO buyerList); //구매자 목록 출력
	int totalBuyerCount(); //구매자 목록의 행 수
	
}
