package com.joyous.festivalolle.ticket.controller;

import java.util.HashMap;

//작성자: 이혜성
//관리자- 구매자 관리 컨트롤러

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.admin.model.PagingVO;
import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;
import com.joyous.festivalolle.ticket.service.TicketService;

@Controller
@RequestMapping("/admin/ticket") 
public class TicketController {

//	private final Logger logger = LoggerFactory.getLogger(TicketController.class);
	
	@Autowired
	TicketService ticketService;
	

	@GetMapping("/list")
	public String getBuyerList(V_ticketBuyerListVO buyerListVO, Model model, HttpSession session, String festivalCode){
		AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
	    	if(festivalCode == null) {
	    		int organizationCode = adminVO.getOrganizationCode();
				buyerListVO.setOrganizationCode(organizationCode);
				List<V_ticketBuyerListVO> ticketList = ticketService.ticketBuyerList(buyerListVO);
				model.addAttribute("ticketList", ticketList);
				System.out.println("ticketList1"); 
					return "adminticket/ticket"; // 구매자 전체 리스트 출력: festivalCode x
			}else {
				int organizationCode = adminVO.getOrganizationCode();
				buyerListVO.setOrganizationCode(organizationCode);
				buyerListVO.setFestivalCode(Integer.parseInt(festivalCode));
				List<V_ticketBuyerListVO> ticketList = ticketService.ticketBuyerList(buyerListVO);
				model.addAttribute("ticketList", ticketList);
				System.out.println("ticketList2");
					return "adminticket/ticket"; // 구매자 전체 리스트 출력: festivalCode o
			}
	}
	
//	//페이징처리
//	  @PostMapping(value="/ticketlist")	  
//	  @ResponseBody 
//	  public Map<String, Object> ticketPaging(String nowPage, String cntPerPage, int organizationCode, String buyerKeyword, PagingVO vo, Locale locale) {
//		  
//		  Map<String,Object> map = new HashMap<String,Object>();	//매퍼에 넘겨줄 map
//		  Map<String, Object> result = new HashMap<String, Object>();	//DB에서 검색해 온 결과 담아줄 result	 
//		  int total = ticketService.totalBuyerCount(organizationCode, buyerKeyword);
//		  
//		  if (nowPage == null && cntPerPage == null) {
//		  		nowPage = "1";
//		  		cntPerPage = "10";
//		  	} else if (nowPage == null) {
//		  		nowPage = "1";
//		  	} else if (cntPerPage == null) { 
//		  		cntPerPage = "10";
//		  	}
//		  
//		  	vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		  	//model.addAttribute("paging", vo);
//		  	//model.addAttribute("viewAll", ticketService.selectBoard(vo));
//		  	//return "system/adminlist2";
//		  
//		  //List<buyerListVO> ticketList = ticketService.ticketBuyerList(buyerListVO);
//		  //searchList = ticketService.searchBuyer(buyerKeyword);
//		  
//		  logger.info("컨트롤러에서 받음" + buyerKeyword);		 
//		  map.put("start", vo.getStart());
//		  map.put("end", vo.getEnd());
//		  map.put("buyerKeyword", buyerKeyword);
//		  
//		  
//		  List<V_ticketBuyerListVO> viewAll = ticketService.selectBoard(map);
//	      result.put("viewAll",  viewAll);
//	      result.put("startPage", vo.getStartPage());
//	      result.put("cntPerPage", vo.getCntPerPage());
//	      result.put("endPage", vo.getEndPage());
//	      logger.info(Integer.toString(vo.getEndPage()));
//	      result.put("nowPage", vo.getNowPage());
//	      result.put("lastPage", vo.getLastPage());
//	
//	  
//	  
//		  return result; 
//	  }

    @ResponseBody
    @GetMapping("/search")
    public List<V_ticketBuyerListVO> getSearch(V_ticketBuyerListVO buyerListVO, Model model, HttpSession session,
    		 @RequestParam("buyerKeyword") String buyerKeyword, @RequestParam("tableBox") String tableBox){
    	AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
		int organizationCode = adminVO.getOrganizationCode();
    	List<V_ticketBuyerListVO> ticketList = ticketService.searchBuyer(organizationCode, buyerKeyword, tableBox);

    	System.out.println("search");
        return ticketList; //구매자 리스트 출력
    }
    
    @GetMapping("/selectYearTitleList")
	@ResponseBody
	public List<V_ticketBuyerListVO> selectYearTitleList(V_ticketBuyerListVO buyerListVO,Model model, HttpSession session, @RequestParam("titleyear") String titleyear) {				
		AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
		int organizationCode = adminVO.getOrganizationCode();
		buyerListVO.setOrganizationCode(organizationCode);
		String titleyear2 = titleyear + "%";
		System.out.println(titleyear2);
		buyerListVO.setOrganizationCode(organizationCode);
		buyerListVO.setPurchaseTime(titleyear2);
			List<V_ticketBuyerListVO> selectYearTitleList = ticketService.selectYearTitleList(buyerListVO);
			return selectYearTitleList;	
	}
	
	@GetMapping("/selectYearBuyer")
	@ResponseBody
	public List<V_ticketBuyerListVO> selectYeaBuyer(V_ticketBuyerListVO buyerListVO,Model model, HttpSession session, @RequestParam("festivalCode") int festivalCode)  {				
			AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
			int organizationCode = adminVO.getOrganizationCode();
			buyerListVO.setOrganizationCode(organizationCode);
			buyerListVO.setFestivalCode(festivalCode);
			List<V_ticketBuyerListVO> selectYearBuyer = ticketService.selectYearBuyer(buyerListVO);
			return selectYearBuyer;	
	}
	
    	
	//-------------------test controller-------------------------------------------
	@GetMapping("/test")
	public String getTest(V_ticketBuyerListVO buyerListVO, Model model, HttpSession session){
		AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
		int organizationCode = adminVO.getOrganizationCode();
		buyerListVO.setOrganizationCode(organizationCode);
		List<V_ticketBuyerListVO> test = ticketService.ticketBuyerList(buyerListVO);
		model.addAttribute("test", test);
		System.out.println("test");
        return "adminticket/test"; // 구매자 전체 리스트 출력
	}

}
