package com.joyous.festivalolle.ticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.repository.ITicketInsertRepository;
import com.joyous.festivalolle.util.constant.CouponAmount;

// 입장권 구매 서비스 구현 클래스
@Service
public class TicketInsertService implements ITicketInsertService{

	@Autowired
	ITicketInsertRepository ticketInsertRepository;		// repository 객체 주입
	
	@Override
	@Transactional
	public void insertTicket(TicketVO ticketVO) throws Exception {
		// 결제금액 계산
		int pay = ticketVO.getFee() * ticketVO.getHeadCount();
		// 결제금액에 따라 쿠폰 할인금액 산정
		if(pay > CouponAmount.CRITERIA_SALE_5000) {
			ticketVO.setCouponAmount(CouponAmount.SALE_5000WON);	// 1만원 초과 결제 시 5천원 할인 쿠폰
		} else if(pay > CouponAmount.CRITERIA_SALE_3000) {
			ticketVO.setCouponAmount(CouponAmount.SALE_3000WON);	// 5천원 초과 결제 시 3천원 할인 쿠폰		
		} else {
			ticketVO.setCouponAmount(CouponAmount.SALE_1500WON);	// 5천원 이하 결제 시 1500원 할인 쿠폰
		}
		
		int check = ticketInsertRepository.insertTicket(ticketVO);
		if(check != 1) {
			throw new Exception("입장권 구매에 실패했습니다.");
		}
	}

}
