package com.joyous.festivalolle.festivalReview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


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
	        return "festivalReview/review";
		}
	}
