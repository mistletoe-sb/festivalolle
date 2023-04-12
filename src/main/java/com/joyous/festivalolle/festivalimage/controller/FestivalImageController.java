package com.joyous.festivalolle.festivalimage.controller;

import java.util.Base64;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.festivalimage.model.FestivalImageVO;
import com.joyous.festivalolle.festivalimage.service.IFestivalImageService;

// 축제 이미지 컨트롤러 클래스
// 작성자 : 이수봉
@Controller
public class FestivalImageController {
	
	private static Logger logger = LoggerFactory.getLogger(FestivalImageController.class);	// logger 참조
	@Autowired
	IFestivalImageService festivalImageService;		// 서비스 객체 주입
	
//	// 해당 축제 이미지 조회
//	@GetMapping(value="/image/{festivalCode}")
//	@ResponseBody
//	public ResponseEntity<byte[]> selectFestivalImage(@PathVariable int festivalCode) {
//		FestivalImageVO image = festivalImageService.selectFestivalImage(festivalCode);
//		final HttpHeaders headers = new HttpHeaders();
//		if(image != null) {
//			logger.info("selectImage > 축제코드:" + image.getFestivalCode() + ", 파일명:" + image.getFileName());
//			headers.setContentType(new MediaType("image", "jpg"));
//			return new ResponseEntity<byte[]>(image.getImage(), headers, HttpStatus.OK);
//		} else {
//			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
//		}
//	}
	// 해당 축제 이미지 조회
	@GetMapping(value="/image")
	@ResponseBody
	public String selectFestivalImage(int festivalCode) {
		FestivalImageVO image = festivalImageService.selectFestivalImage(festivalCode);
		String responseData = "";
		if(image != null && image.getImage() != null) {
			logger.info("selectImage > 축제코드:" + image.getFestivalCode() + ", 파일명:" + image.getFileName());
			responseData = "data:image:jpg;base64," + Base64.getEncoder().encodeToString(image.getImage());
		}
		return responseData;
	}
}
