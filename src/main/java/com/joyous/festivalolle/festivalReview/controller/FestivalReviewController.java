package com.joyous.festivalolle.festivalReview.controller;

import java.util.HashMap;
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
import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;
import com.joyous.festivalolle.festivalReview.service.FestivalReviewService;


//작성자: 이혜성
//축제리뷰 리스트

@Controller
@RequestMapping("/admin/review")
public class FestivalReviewController {

		@Autowired
		FestivalReviewService festivalReviewService;
		
		private final Logger logger = LoggerFactory.getLogger(FestivalController.class);
		
		private String paging = "10";
		
		@GetMapping("/list")
		public String ReviewList(V_ReviewListVO reviewVO, Model model, HttpSession session,
								@RequestParam(value="festivalCode", required = false, defaultValue = "0") String festivalCode){
			 AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
			    	if(festivalCode.equals("0")) {
//				    int organizationCode = adminVO.getOrganizationCode();
//				    reviewVO.setOrganizationCode(organizationCode);
//				    List<V_ReviewListVO> reviewList = festivalReviewService.festivalReviewList(reviewVO);
//				    model.addAttribute("reviewList", reviewList);
//				    //logger.info("reviewList1:" + reviewList);
//				    logger.info("reviewList1");
			    		model.addAttribute("festivalCode", 0);
				    	return "adminreview/review"; //전체 리뷰 리스트 출력: festivalCode x
				    }else {
//				    	int organizationCode = adminVO.getOrganizationCode();
//					    reviewVO.setOrganizationCode(organizationCode);
//					    reviewVO.setFestivalCode(Integer.parseInt(festivalCode));
//					    List<V_ReviewListVO> reviewList = festivalReviewService.festivalReviewList(reviewVO);
//					    model.addAttribute("reviewList", reviewList);
//					    //logger.info("reviewList2:" + reviewList);
//					    logger.info("reviewList2");
				    	model.addAttribute("festivalCode", Integer.parseInt(festivalCode));
					    return "adminreview/review"; //전체 리뷰 리스트 출력: festivalCode o
				    }
		}//리뷰 리스트 페이지-기본 출력: 전체리뷰
		
		@ResponseBody
		@GetMapping("/all")
		public List<V_ReviewListVO> getReviewList(V_ReviewListVO reviewVO, Model model, HttpSession session){
			AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
			int organizationCode = adminVO.getOrganizationCode();
			 reviewVO.setOrganizationCode(organizationCode);
			List<V_ReviewListVO> reviewList = festivalReviewService.festivalReviewList(reviewVO);
			model.addAttribute("reviewList", reviewList);
			//logger.info("reviewList3:" + reviewList);
			logger.info("reviewList");
	        return reviewList;
		}//리뷰 전체 리스트 출력
		
		@ResponseBody
		@GetMapping("/report")
		public List<V_ReviewListVO> getReportList(V_ReviewListVO reviewVO, Model model, HttpSession session) {
			AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
			int organizationCode = adminVO.getOrganizationCode();
			 reviewVO.setOrganizationCode(organizationCode);
			List<V_ReviewListVO> reportList = festivalReviewService.selectReport(reviewVO);
			model.addAttribute("reportList", reportList);
			//logger.info("reportList:" + reportList);
			return reportList;
		}//신고된 리뷰 리스트 출력
	        
	        @GetMapping("/detail")
	        public String getDetail(@RequestParam int festivalReviewCode, Model model, HttpSession session, V_ReviewListVO reviewVO) {
	        	AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
	    		int organizationCode = adminVO.getOrganizationCode();
	    		reviewVO.setOrganizationCode(organizationCode);
	          V_ReviewListVO reviewList = festivalReviewService.selectReview(festivalReviewCode);
	          model.addAttribute("reviewList", reviewList);
	          //logger.info("reviewList4:" + reviewList);
	          return "adminreview/reviewdetail";
		}//특정한 1개 리뷰만 출력 - 축제리뷰코드 기준 각 항목의 링크로 이동.
	        
			@GetMapping("/normal")
			public String setNormal(@RequestParam("festivalReviewCode") int festivalReviewCode, HttpSession session, V_ReviewListVO reviewVO) {
				AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
			    festivalReviewService.setNormal(festivalReviewCode);
			    logger.info("setNormal:" + Integer.toString(festivalReviewCode));
			    logger.info("setNormal");
			    return "redirect:./detail?festivalReviewCode=" + festivalReviewCode;
			}//신고철회 처리

			@GetMapping("/blind")
			public String setBlind(@RequestParam("festivalReviewCode") int festivalReviewCode, HttpSession session, V_ReviewListVO reviewVO) {
				AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
			    festivalReviewService.setBlind(festivalReviewCode);
			    logger.info("setBlind:" + Integer.toString(festivalReviewCode));
			    logger.info("setBlind");
			    return "redirect:./detail?festivalReviewCode=" + festivalReviewCode;
			}// 블라인드 처리
	        
			@ResponseBody
		    @GetMapping("/search")
		    public List<V_ReviewListVO> getSearch(V_ReviewListVO reviewVO, Model model, HttpSession session,
		    		 @RequestParam("reviewKeyword") String reviewKeyword, @RequestParam("tableBox") String tableBox){
		    	AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
		    	List<V_ReviewListVO> reviewList = festivalReviewService.searchReview(organizationCode, reviewKeyword, tableBox);
		    	//logger.info("reviewList5:" + reviewList);
		    	logger.info("search");
		        return reviewList; 
		        }//구매자 리스트 출력
		        
		        @GetMapping("/selectYearTitleList")
		    	@ResponseBody
		    	public List<V_ReviewListVO> selectYearTitleList(V_ReviewListVO reviewVO,Model model, HttpSession session, @RequestParam("titleyear") String titleyear) {				
		    		AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
					int organizationCode = adminVO.getOrganizationCode();
					reviewVO.setOrganizationCode(organizationCode);
		    		String titleyear2 = titleyear + "%";
		    		logger.info("titleyear2:" + titleyear2);
		    		logger.info(titleyear2);
		    		reviewVO.setOrganizationCode(organizationCode);
		    		reviewVO.setWriteDate(titleyear2);
		    			List<V_ReviewListVO> selectYearTitleList = festivalReviewService.selectYearTitleList(reviewVO);
		    			//logger.info("selectYearTitleList1:" + selectYearTitleList);
		    			return selectYearTitleList;	
		    	}
		    	
		    	@GetMapping("/selectYearReview")
		    	@ResponseBody
		    	public List<V_ReviewListVO> selectYearFestival(V_ReviewListVO reviewVO,Model model, HttpSession session, @RequestParam("festivalCode") int festivalCode)  {				
		    		AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
					int organizationCode = adminVO.getOrganizationCode();
					reviewVO.setOrganizationCode(organizationCode);
		    		reviewVO.setFestivalCode(festivalCode);
		    			List<V_ReviewListVO> selectYearTitleList = festivalReviewService.selectYearReview(reviewVO);
		    			//logger.info("selectYearTitleList2:" + selectYearTitleList);
		    			return selectYearTitleList;	
		    	}
		   
		      //페이징처리
		      @RequestMapping(value="/reviewpaging", method = {RequestMethod.GET, RequestMethod.POST})  
		  	  @ResponseBody 
		  	  public Map<String, Object>reviewPaging(HttpSession session, String nowPage, String cntPerPage, int radioInput, int titleListInput, String tableBoxInput, String searchInput, Locale locale) {
		  		  
		  		  AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
		  		int organizationCode = adminVO.getOrganizationCode();
		  		  Map<String,Object> map = new HashMap<String,Object>();	//매퍼에 넘겨줄 map
		  		  Map<String, Object> result = new HashMap<String, Object>();	//DB에서 검색해 온 결과 담아줄 result	 
		  		  int total = festivalReviewService.countFestivalReview(organizationCode, radioInput, titleListInput,
		  				tableBoxInput, searchInput);
				  logger.info("total:" + Integer.toString(total));

		  		 /* String cntPerPage = paging;
		  		  if(nowPage == null) {
		  			  nowPage = "1";
		  		  }*/
				  
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
		  		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		  		  	//model.addAttribute("paging", vo);
		  		  	//model.addAttribute("viewAll", adminService.selectBoard(vo));
		  		  	//return "system/adminlist2";

		  		  //List<AdminVO> adminList = adminService.getAdminList();
		  		  //adminList = adminService.adminSearch(keyword);
		  		  	 
		  		  map.put("start", vo.getStart());
		  		  map.put("end", vo.getEnd());
		  		  map.put("organizationCode", organizationCode);
		  		  map.put("radioInput", radioInput);
		  		  map.put("titleListInput", titleListInput);
		  		  map.put("tableBoxInput", tableBoxInput);
		  		  map.put("searchInput", searchInput);
		  		  
		  		  List<V_ReviewListVO> viewAll = festivalReviewService.selectBoard(map);
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
	 