package com.joyous.festivalolle.festivalReview.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		public String ReviewList(V_ReviewListVO reviewVO, Model model){
			List<V_ReviewListVO> reviewList = festivalReviewService.festivalReviewList(reviewVO);
			model.addAttribute("reviewList", reviewList);
			System.out.println("reviewList");
	        return "adminreview/review";
		}//리뷰 리스트 페이지-기본 출력: 전체리뷰
		
		@ResponseBody
		@GetMapping("/all")
		public List<V_ReviewListVO> getReviewList(V_ReviewListVO reviewVO, Model model){
			List<V_ReviewListVO> reviewList = festivalReviewService.festivalReviewList(reviewVO);
			model.addAttribute("reviewList", reviewList);
			System.out.println("reviewList");
	        return reviewList;
		}//리뷰 전체 리스트 출력
		
		@ResponseBody
		@GetMapping("/report")
		public List<V_ReviewListVO> getReportList(V_ReviewListVO reviewVO, Model model) {
			List<V_ReviewListVO> reportList = festivalReviewService.selectReport(reviewVO);
			model.addAttribute("reportList", reportList);
			return reportList;
		}//신고된 리뷰 리스트 출력
	        
	        @GetMapping("/detail")
	        public String getDetail(@RequestParam int festivalReviewCode, Model model) {
	          V_ReviewListVO reviewList = festivalReviewService.selectReview(festivalReviewCode);
	          model.addAttribute("reviewList", reviewList);
	          return "adminreview/reviewdetail";
		}//특정한 1개 리뷰만 출력 - 축제리뷰코드 기준 각 항목의 링크로 이동.
	        
			@GetMapping("/normal")
			public String setNormal(@RequestParam("festivalReviewCode") int festivalReviewCode) {
			    festivalReviewService.setNormal(festivalReviewCode);
			    System.out.println("setNormal");
			    return "redirect:./detail?festivalReviewCode=" + festivalReviewCode;
			}//신고철회 처리

			@GetMapping("/blind")
			public String setBlind(@RequestParam("festivalReviewCode") int festivalReviewCode) {
			    festivalReviewService.setBlind(festivalReviewCode);
			    System.out.println("setBlind");
			    return "redirect:./detail?festivalReviewCode=" + festivalReviewCode;
			}// 블라인드 처리
	        
	        
	  // ---------------------------test controller -------------------------  
			@GetMapping("/test")
			public String getTest(V_ReviewListVO reviewVO, Model model) {
				List<V_ReviewListVO> test = festivalReviewService.festivalReviewList(reviewVO);
				model.addAttribute("test", test);
				return "adminreview/test";
			}//리뷰 리스트 페이지-기본 출력: 전체리뷰
			
			@GetMapping("/test1")
			@ResponseBody
			public List<V_ReviewListVO> getTest1(V_ReviewListVO reviewVO, Model model) {
				List<V_ReviewListVO> test = festivalReviewService.festivalReviewList(reviewVO);
				model.addAttribute("test", test);
				return test;
			}//리뷰 리스트 출력
			
			@GetMapping("/test2")
			public String getTest2(Model model, @RequestParam("festivalReviewCode") int festivalReviewCode) {
			    V_ReviewListVO test2 = festivalReviewService.selectReview(festivalReviewCode);
			    model.addAttribute("test2", test2);
			    return "adminreview/test2";
			}//특정한 1개 리뷰만 출력 - 축제리뷰코드 기준 각 항목의 링크로 이동.
			
			@GetMapping("/test3")
			@ResponseBody
			public List<V_ReviewListVO> getTest3(V_ReviewListVO reviewVO, Model model) {
				List<V_ReviewListVO> test = festivalReviewService.selectReport(reviewVO);
				model.addAttribute("test", test);
				return test;
			}//신고 리스트 출력
	        
			@GetMapping("/test4")
			public String setNormalTest(@RequestParam("festivalReviewCode") int festivalReviewCode) {
			    festivalReviewService.setNormal(festivalReviewCode);
			    System.out.println("setNormal");
			    return "redirect:./test2?festivalReviewCode=" + festivalReviewCode;
			}//신고철회 처리

			@GetMapping("/test5")
			public String setBlindTest(@RequestParam("festivalReviewCode") int festivalReviewCode) {
			    festivalReviewService.setBlind(festivalReviewCode);
			    System.out.println("setBlind");
			    return "redirect:./test2?festivalReviewCode=" + festivalReviewCode;
			}// 블라인드 처리
}
	        


