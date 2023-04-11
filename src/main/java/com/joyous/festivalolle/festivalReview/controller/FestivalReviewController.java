package com.joyous.festivalolle.festivalReview.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;
import com.joyous.festivalolle.festivalReview.service.FestivalReviewService;


//작성자: 이혜성
//축제리뷰 리스트 VO

@Controller
@RequestMapping("/admin/review")
public class FestivalReviewController {

		@Autowired
		FestivalReviewService festivalReviewService;
		
		@GetMapping("/list")
		public String ReviewList(V_ReviewListVO reviewVO, Model model, HttpSession session, String festivalCode){
			 AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
			    	if(festivalCode == null) {
				    int organizationCode = adminVO.getOrganizationCode();
				    reviewVO.setOrganizationCode(organizationCode);
				    List<V_ReviewListVO> reviewList = festivalReviewService.festivalReviewList(reviewVO);
				    model.addAttribute("reviewList", reviewList);
				    System.out.println("reviewList1");
				    	return "adminreview/review"; //전체 리뷰 리스트 출력: festivalCode x
				    }else {
				    	int organizationCode = adminVO.getOrganizationCode();
					    reviewVO.setOrganizationCode(organizationCode);
					    reviewVO.setFestivalCode(Integer.parseInt(festivalCode));
					    List<V_ReviewListVO> reviewList = festivalReviewService.festivalReviewList(reviewVO);
					    model.addAttribute("reviewList", reviewList);
					    System.out.println("reviewList2");
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
			System.out.println("reviewList");
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
			return reportList;
		}//신고된 리뷰 리스트 출력
	        
	        @GetMapping("/detail")
	        public String getDetail(@RequestParam int festivalReviewCode, Model model, HttpSession session, V_ReviewListVO reviewVO) {
	        	AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
	    		int organizationCode = adminVO.getOrganizationCode();
	    		reviewVO.setOrganizationCode(organizationCode);
	          V_ReviewListVO reviewList = festivalReviewService.selectReview(festivalReviewCode);
	          model.addAttribute("reviewList", reviewList);
	          return "adminreview/reviewdetail";
		}//특정한 1개 리뷰만 출력 - 축제리뷰코드 기준 각 항목의 링크로 이동.
	        
			@GetMapping("/normal")
			public String setNormal(@RequestParam("festivalReviewCode") int festivalReviewCode, HttpSession session, V_ReviewListVO reviewVO) {
				AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
			    festivalReviewService.setNormal(festivalReviewCode);
			    System.out.println("setNormal");
			    return "redirect:./detail?festivalReviewCode=" + festivalReviewCode;
			}//신고철회 처리

			@GetMapping("/blind")
			public String setBlind(@RequestParam("festivalReviewCode") int festivalReviewCode, HttpSession session, V_ReviewListVO reviewVO) {
				AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
			    festivalReviewService.setBlind(festivalReviewCode);
			    System.out.println("setBlind");
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

		    	System.out.println("search");
		        return reviewList; 
		        }//구매자 리스트 출력
		        
		        @GetMapping("/selectYearTitleList")
		    	@ResponseBody
		    	public List<V_ReviewListVO> selectYearTitleList(V_ReviewListVO reviewVO,Model model, HttpSession session, @RequestParam("titleyear") String titleyear) {				
		    		AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
					int organizationCode = adminVO.getOrganizationCode();
					reviewVO.setOrganizationCode(organizationCode);
		    		String titleyear2 = titleyear + "%";
		    		System.out.println(titleyear2);
		    		reviewVO.setOrganizationCode(organizationCode);
		    		reviewVO.setWriteDate(titleyear2);
		    			List<V_ReviewListVO> selectYearTitleList = festivalReviewService.selectYearTitleList(reviewVO);
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
		    			return selectYearTitleList;	
		    	}
		   
	        
	  // ---------------------------test controller -------------------------  
			@GetMapping("/test")
			public String getTest(V_ReviewListVO reviewVO, Model model, HttpSession session) {
				AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
				List<V_ReviewListVO> test = festivalReviewService.festivalReviewList(reviewVO);
				model.addAttribute("test", test);
				return "adminreview/test";
			}//리뷰 리스트 페이지-기본 출력: 전체리뷰
			
			@GetMapping("/test1")
			@ResponseBody
			public List<V_ReviewListVO> getTest1(V_ReviewListVO reviewVO, Model model, HttpSession session) {
				AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
				List<V_ReviewListVO> test = festivalReviewService.festivalReviewList(reviewVO);
				model.addAttribute("test", test);
				return test;
			}//리뷰 리스트 출력
			
			@GetMapping("/test2")
			public String getTest2(Model model, @RequestParam("festivalReviewCode") int festivalReviewCode, HttpSession session, V_ReviewListVO reviewVO) {
				AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
			    V_ReviewListVO test2 = festivalReviewService.selectReview(festivalReviewCode);
			    model.addAttribute("test2", test2);
			    return "adminreview/test2";
			}//특정한 1개 리뷰만 출력 - 축제리뷰코드 기준 각 항목의 링크로 이동.
			
			@GetMapping("/test3")
			@ResponseBody
			public List<V_ReviewListVO> getTest3(V_ReviewListVO reviewVO, Model model, HttpSession session) {
				AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
				List<V_ReviewListVO> test = festivalReviewService.selectReport(reviewVO);
				model.addAttribute("test", test);
				return test;
			}//신고 리스트 출력
	        
			@GetMapping("/test4")
			public String setNormalTest(@RequestParam("festivalReviewCode") int festivalReviewCode, HttpSession session, V_ReviewListVO reviewVO) {
				AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
			    festivalReviewService.setNormal(festivalReviewCode);
			    System.out.println("setNormal");
			    return "redirect:./test2?festivalReviewCode=" + festivalReviewCode;
			}//신고철회 처리

			@GetMapping("/test5")
			public String setBlindTest(@RequestParam("festivalReviewCode") int festivalReviewCode, HttpSession session, V_ReviewListVO reviewVO) {
				AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");
				int organizationCode = adminVO.getOrganizationCode();
				reviewVO.setOrganizationCode(organizationCode);
			    festivalReviewService.setBlind(festivalReviewCode);
			    System.out.println("setBlind");
			    return "redirect:./test2?festivalReviewCode=" + festivalReviewCode;
			}// 블라인드 처리
}
	        


