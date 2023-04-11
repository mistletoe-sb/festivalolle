package com.joyous.festivalolle.festivalimage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.festivalimage.service.IFestivalImageService;

// 축제 이미지 컨트롤러 클래스
// 작성자 : 이수봉
@Controller
public class FestivalImageController {
	
	@Autowired
	IFestivalImageService festivalImageService;		// 서비스 객체 주입
	
	@GetMapping(value="/image")
	@ResponseBody
	public String selectFestivalImage(int festivalCode) {
		return null;
	}
}
