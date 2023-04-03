package com.joyous.festivalolle.ticket.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;
import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;

//작성자: 이혜성
//티켓 서비스 인터페이스

public interface ITicketServiceMyticket {
	
	List<TicketVO> getMyCurrentTicket(int memberCode);
}
