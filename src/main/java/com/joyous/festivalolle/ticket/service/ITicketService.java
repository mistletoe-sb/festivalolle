package com.joyous.festivalolle.ticket.service;

import java.util.List;
import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;

//작성자: 이혜성
//티켓 서비스 인터페이스

public interface ITicketService {
	
	List<V_ticketBuyerListVO> ticketBuyerList(V_ticketBuyerListVO buyerListVO); //구매자 리스트 전체 출력
	int totalBuyerCount(); //구매자 목록의 행 수
	List<V_ticketBuyerListVO> searchBuyer(int organizationCode, String buyerKeyword, String tableBox);		// 검색 기능
	List<V_ticketBuyerListVO> selectYearTitleList(V_ticketBuyerListVO buyerList);		// 연도별 타이틀
}
