package com.joyous.festivalolle.ticket.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;

//작성자: 이혜성
// 티켓(구매자목록 포함) 정보 인터페이스

public interface ITicketRepository {
	List<V_ticketBuyerListVO> selectBoard(Map<String,Object> map);
	List<V_ticketBuyerListVO> ticketBuyerList(V_ticketBuyerListVO buyerList); //구매자 목록 출력
	int totalBuyerCount(
			@Param("titleListInput") String titleListInput, @Param("tableBoxInput") String tableBoxInput, @Param("buyerKeyword") String buyerKeyword ); //구매자 목록의 행 수
	List<V_ticketBuyerListVO> searchBuyer(		// 검색 기능
			@Param("organizationCode") int organizationCode,@Param("buyerKeyword") String buyerKeyword, @Param("tableBox") String tableBox);
	List<V_ticketBuyerListVO> selectYearTitleList(V_ticketBuyerListVO buyerList);		// 연도별 타이틀
	List<V_ticketBuyerListVO> selectYearBuyer(V_ticketBuyerListVO buyerListVO);

}
