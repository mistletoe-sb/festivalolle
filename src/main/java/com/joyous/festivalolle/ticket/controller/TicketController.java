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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.admin.model.PagingVO;
import com.joyous.festivalolle.festival.controller.FestivalController;
import com.joyous.festivalolle.ticket.model.V_ticketBuyerListVO;
import com.joyous.festivalolle.ticket.service.TicketService;

@Controller
@RequestMapping("/admin/ticket") 
public class TicketController {

	@Autowired
	TicketService ticketService;
	
	private final Logger logger = LoggerFactory.getLogger(FestivalController.class);
	
	private String paging = "10";

	@GetMapping("/list")
	public String getBuyerList(V_ticketBuyerListVO buyerListVO, Model model, HttpSession session, String festivalCode){
		AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
	    	if(festivalCode == null) {
	    		int organizationCode = adminVO.getOrganizationCode();
				buyerListVO.setOrganizationCode(organizationCode);
				List<V_ticketBuyerListVO> ticketList = ticketService.ticketBuyerList(buyerListVO);
				model.addAttribute("ticketList", ticketList);
				logger.info("ticketList1:" + ticketList);
				System.out.println("ticketList1"); 
					return "adminticket/ticket"; // 구매자 전체 리스트 출력: festivalCode x
			}else {
				int organizationCode = adminVO.getOrganizationCode();
				buyerListVO.setOrganizationCode(organizationCode);
				buyerListVO.setFestivalCode(Integer.parseInt(festivalCode));
				List<V_ticketBuyerListVO> ticketList = ticketService.ticketBuyerList(buyerListVO);
				model.addAttribute("ticketList", ticketList);
				logger.info("ticketList2:" + ticketList);
				System.out.println("ticketList2");
					return "adminticket/ticket"; // 구매자 전체 리스트 출력: festivalCode o
			}
	}

    @ResponseBody
    @GetMapping("/search")
    public List<V_ticketBuyerListVO> getSearch(V_ticketBuyerListVO buyerListVO, Model model, HttpSession session,
    		 @RequestParam("buyerKeyword") String buyerKeyword, @RequestParam("tableBox") String tableBox){
    	AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
		int organizationCode = adminVO.getOrganizationCode();
    	List<V_ticketBuyerListVO> ticketList = ticketService.searchBuyer(organizationCode, buyerKeyword, tableBox);
    	logger.info("ticketList:" + ticketList);
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
			logger.info("selectYearTitleList:" + selectYearTitleList);
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
			logger.info("selectYearBuyer:" + selectYearBuyer);
			return selectYearBuyer;	
	}
	
//	//페이징처리
	@RequestMapping(value="/ticketpaging", method = {RequestMethod.GET, RequestMethod.POST})
	  @ResponseBody 
	  public Map<String, Object>ticketPaging(HttpSession session, String nowPage, String cntPerPage,  int titleListInput, String tableBoxInput, String searchInput, PagingVO vo, Locale locale) {
		  
		  AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
		  int organizationCode = adminVO.getOrganizationCode();
		  Map<String,Object> map = new HashMap<String,Object>();	//매퍼에 넘겨줄 map
		  Map<String, Object> result = new HashMap<String, Object>();	//DB에서 검색해 온 결과 담아줄 result	 
		  int total = ticketService.countBuyer(organizationCode, titleListInput, tableBoxInput, searchInput);
		  logger.info("total:" + Integer.toString(total));
		  
		  if (nowPage == null && cntPerPage == null) {
		  		nowPage = "1";
		  		cntPerPage = paging;
		  	} else if (nowPage == null) {
		  		nowPage = "1";
		  	} else if (cntPerPage == null) { 
		  		cntPerPage = paging;
		  	}
		  
		  logger.info("^ total"+total);
		  logger.info("^ nowPage"+Integer.parseInt(nowPage));
		  logger.info("^ cntPerPage"+Integer.parseInt(cntPerPage));
		  	vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		  	//model.addAttribute("paging", vo);
		  	//model.addAttribute("viewAll", adminService.selectBoard(vo));
		  	//return "system/adminlist2";
		  	
		  //List<AdminVO> adminList = adminService.getAdminList();
		  //adminList = adminService.adminSearch(keyword);
		  	 
		  map.put("start", vo.getStart());
		  map.put("end", vo.getEnd());
		  map.put("organizationCode", organizationCode);
		  map.put("titleListInput", titleListInput);
		  map.put("tableBoxInput", tableBoxInput);
		  map.put("searchInput", searchInput);
		  
		  List<V_ticketBuyerListVO> viewAll = ticketService.selectBoard(map);
	      result.put("viewAll",  viewAll);
	      result.put("startPage", vo.getStartPage());
	      result.put("cntPerPage", vo.getCntPerPage());
	      result.put("endPage", vo.getEndPage());
	      logger.info(Integer.toString(vo.getEndPage()));
	      result.put("nowPage", vo.getNowPage());
	      result.put("lastPage", vo.getLastPage());
	
		  return result; 
	  }
}
