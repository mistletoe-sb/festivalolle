package com.joyous.festivalolle.member.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import com.joyous.festivalolle.admin.controller.AdminController;
import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.member.service.IMemberService;
import com.joyous.festivalolle.member.service.IMemberService2;
import com.joyous.festivalolle.ticket.model.TicketVO;
import com.joyous.festivalolle.ticket.model.TicketVOvalidator;
import com.joyous.festivalolle.ticket.service.TicketServiceMyticket;

@Controller

public class MemberController {
	private final Logger logger = LoggerFactory.getLogger(MemberController.class);
	   
	@Autowired
	private IMemberService memberService;	// MemberService 객체
	
	@Autowired
	private IMemberService2 memberService2;	// MemberService2 객체
	
	@Autowired
	TicketServiceMyticket ticketServiceMyticket;
	
	
	private String view_pos = "member/";		// 뷰 저장 위치
	
	@GetMapping(value="/test/count")
	public String empCount(Model model) {
		model.addAttribute("count", memberService.countMember());
		return view_pos + "count";
	}
	
	//로그인 api
	@GetMapping(value="/member/loginapi")
	public String loginapi(HttpSession session) {
		return view_pos + "loginapi";
	}
	
	//로그인
	@GetMapping(value="/login")
	public String login(HttpSession session) {
		return view_pos + "login";
	}
	
	@PostMapping(value="/login")
	@ResponseBody
	public String login(String id, String password, HttpSession session, Model model, Locale locale) {		
		logger.info(id, locale);
		
		MemberVO memberVO = new MemberVO();
		memberVO = memberService.memberLogin(id, password);
	
		if(memberVO != null) {
			int memberType = memberVO.getStatus();
			if(memberType == 0) {
				session.setAttribute("loginUser", memberVO);		//세션에 VO 담아줌	
				return "ok";			
			} else if(memberType == 1) {							
				return "fail";
			}
		} else {
			return "fail";
		}
		return "fail";
	}
	
	//로그아웃
	@GetMapping(value="/logout")
	public String logout(HttpSession session, Model model, Locale locale) {
		logger.info("세션 파기 전", locale);
		session.invalidate();
		//logger.info("세션 파기 후", locale);
		return "redirect:/login";
	}
	
	
	//마이페이지 화면
	@GetMapping(value="/mypage")
	public String mypage(HttpSession session, Locale locale) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		if (memberVO != null) {
			return "member/mypage";
		} else {
			return "member/gologin";
		}
	}
	

	
	//회원가입 페이지로 이동
	@GetMapping(value="/join")
	public String join(HttpSession session) {
		return view_pos + "join";
	}
	
	//회원가입
	@PostMapping(value="/join")
	@ResponseBody
	public String join(@RequestBody MemberVO memberVO, Locale locale) {
		logger.info("회원 회원가입 실행", locale);
		return (memberService2.joinMember(memberVO) == 1)? "ok":"fail";
	}
	
	//id 중복 체크
	@PostMapping(value="/member/idchk")
	@ResponseBody
	public String idChk(String id, Locale locale) {
		//0이면 사용 가능, 1이면 사용 불가		
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);		
		return (memberService2.overlapChk(memberVO) == 0)? "ok":"fail";
	}
	
	//회원가입 휴대폰번호 중복 체크
	@PostMapping(value="/member/mobilechk")
	@ResponseBody
	public String phoneChk(String mobile, Locale locale) {
		//0이면 사용 가능, 1이면 사용 불가		
		MemberVO memberVO = new MemberVO();
		memberVO.setMobile(mobile);		
		return (memberService2.overlapChk(memberVO) == 0)? "ok":"fail";
	}
	
	
	
	
	
	
	
	
	
	
	
	/***************입장권*****************/
	
	
	/*
	@GetMapping("/qr")
    public Object createQr(@RequestParam String url) throws WriterException, IOException {
        int width = 200;
        int height = 200;
        BitMatrix matrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height);

        try (ByteArrayOutputStream out = new ByteArrayOutputStream();) {
            MatrixToImageWriter.writeToStream(matrix, "PNG", out);
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_PNG)
                    .body(out.toByteArray());
        }
    }*/
    
	//파일명 브라우저에서
	//인코딩 base64
	
	
	
	@GetMapping(value="/qr1")
	@ResponseBody
    public Object createQr(String url, Locale locale) throws WriterException, IOException {
		logger.info("qr 코드 생성 메서드 왔음");
		
        int width = 200;
        int height = 200;
        BitMatrix matrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height);

        try (ByteArrayOutputStream out = new ByteArrayOutputStream();) {
            MatrixToImageWriter.writeToStream(matrix, "PNG", out);
            
            String qrCode = Base64.getEncoder().encodeToString(out.toByteArray());
           
            
            /*
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_PNG)
                    .body(out.toByteArray());
            */
            
            return qrCode;
        }
    }
	
	
	
	
	
	//QR URL 읽어오기	
	@GetMapping(value="/qrreader/{memberCode}/{ticketCode}")
	public String qrReader(@PathVariable("memberCode") int memberCode, @PathVariable("ticketCode") int ticketCode, HttpSession session, Locale locale, Model model) {
		logger.info("vo 담기 전", locale);
		AdminVO adminVO = (AdminVO)session.getAttribute("loginAdmin");
		logger.info("vo 담았다", locale);
		
		TicketVOvalidator validatorVO = new TicketVOvalidator();
		validatorVO = ticketServiceMyticket.ticketValidate(memberCode, ticketCode);
		
		if(adminVO != null) {
			int adminType = adminVO.getStatus();
			if (adminType == 3) {
				model.addAttribute("ticketInfo", validatorVO);
				return "ticket/ticketvalidator";			
			} else if(adminType == 4) {							
				model.addAttribute("ticketInfo", validatorVO);
				return "ticket/couponvalidator";
			} else {
				return "redirect:/admin/login";			
			}	
		} else {
			return "redirect:/admin/login";
		}
	}
	
	
	//입장 확인
	@PostMapping(value="/ticket/entrance")
	@ResponseBody
	public String entrance(int ticketCode) {
		logger.info("입장 확인 하러 옴");
		int result = ticketServiceMyticket.validateEntrance(ticketCode);
		System.out.println(result);
		return (ticketServiceMyticket.validateEntrance(ticketCode) == 1)? "ok":"fail";		
	}
	
	//쿠폰 사용 확인
	@PostMapping(value="/ticket/coupon")
	@ResponseBody
	public String coupon(int ticketCode) {

		return (ticketServiceMyticket.validateCoupon(ticketCode) == 1)? "ok":"fail";	
	}
	
	
	
	/*
	//관리자 티켓 확인 페이지
	@GetMapping(value="/ticketvalidator")
	public String ticketValidate(HttpSession session) {
		return null;
	}
	
	//관리자 쿠폰 확인 페이지
	@GetMapping(value="/couponvalidator")
	public String couponValidate(HttpSession session) {
		return null;
	}
	*/


}

