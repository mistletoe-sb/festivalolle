package com.joyous.festivalolle.festivalReview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.festivalReview.model.V_ReviewListVO;
import com.joyous.festivalolle.festivalReview.service.FestivalReviewService;

//작성자: 이혜성
//축제리뷰 리스트 VO

@Controller
@RequestMapping("/review")
public class FestivalReviewController {

		@Autowired
		FestivalReviewService festivalReviewService;
		

		@GetMapping("/list")
		public String getReviewList(V_ReviewListVO reviewVO, Model model){
			List<V_ReviewListVO> list = festivalReviewService.festivalReviewList(reviewVO);
			model.addAttribute("reviewList", list);
			System.out.println("reviewList");
	        return "adminreview/review";
		}//리뷰 리스트 출력
		
		@GetMapping("/reportList")
		public String getReportList(V_ReviewListVO reviewVO, Model model) {
			List<V_ReviewListVO> reportList = festivalReviewService.selectReport(reviewVO);
			model.addAttribute("reportList", reportList);
			return "adminreview/review";
		}//신고 리스트 출력
	        
	        @GetMapping("/detail/{festivalReviewCode}")
	        public String getItemDetail(@PathVariable int festivalReviewCode, Model model) {
	          List<V_ReviewListVO> reviewList = festivalReviewService.selectReview(festivalReviewCode);
	          model.addAttribute("reviewList", reviewList);
	          return "adminreview/reviewdetail";
		}//특정한 1개 리뷰만 출력 - 축제리뷰코드 기준 각 항목의 링크로 이동.
	        
	  // ---------------------------test controller -------------------------  
			@GetMapping("/test")
			public String getTest(V_ReviewListVO reviewVO, Model model) {
				List<V_ReviewListVO> test = festivalReviewService.festivalReviewList(reviewVO);
				model.addAttribute("test", test);
				return "adminreview/test";
			}//리뷰 리스트 출력
			
			@GetMapping("/test1")
			@ResponseBody
			public List<V_ReviewListVO> getTest1(V_ReviewListVO reviewVO, Model model) {
				List<V_ReviewListVO> test = festivalReviewService.festivalReviewList(reviewVO);
				model.addAttribute("test", test);
				return test;
			}//리뷰 리스트 출력
			
			
			
			@GetMapping("/test3")
			@ResponseBody
			public List<V_ReviewListVO> getTest3(V_ReviewListVO reviewVO, Model model) {
				List<V_ReviewListVO> test = festivalReviewService.selectReport(reviewVO);
				model.addAttribute("test", test);
				return test;
			}//신고 리스트 출력

	        @GetMapping("/test2/{festivalReviewCode}")
	        public String getTest2(@PathVariable int festivalReviewCode, Model model) {
	          List<V_ReviewListVO> test2 = festivalReviewService.selectReview(festivalReviewCode);
	          for(V_ReviewListVO item : test2) {
	        	  System.out.println("테스트"+item.getId());
	          }
	          model.addAttribute("test2",test2);
	          return "adminreview/test2";
	        }//특정한 1개 리뷰만 출력 - 축제리뷰코드 기준 각 항목의 링크로 이동.		
}
	        


