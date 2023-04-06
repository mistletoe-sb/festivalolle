package com.joyous.festivalolle.bookmark.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joyous.festivalolle.bookmark.model.BookmarkVO;
import com.joyous.festivalolle.bookmark.service.IBookmarkService;
import com.joyous.festivalolle.member.model.MemberVO;
import com.joyous.festivalolle.util.status.AjaxResponseStatus;

// 북마크 컨트롤러 클래스
// 작성자 : 이수봉
@Controller
@RequestMapping("/bookmark")
public class BookmarkController {
	
	@Autowired
	private IBookmarkService bookmarkService;	// 서비스 객체 주입
	
	private static Logger logger = LoggerFactory.getLogger(BookmarkController.class);	// logger 객체 생성
	
	// 북마크 추가
	@PostMapping("/insert")
	@ResponseBody
	public AjaxResponseStatus insertBookmark(int festivalCode, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		
		// 세션 null 체크
		if(loginUser != null) {
			int memberCode = loginUser.getMemberCode();		// 회원 코드 참조
			
			// 북마크 여부 조회(한 회원이 같은 축제에 북마크 한 번만 가능)
			if(bookmarkService.selectBookmark(memberCode, festivalCode) == null) {
				// 조회 결과 없는 경우(select된 행이 0개) > 북마크 추가 가능
				BookmarkVO bookmarkVO = new BookmarkVO(loginUser.getMemberCode(), festivalCode);
				try {
					bookmarkService.insertBookmark(bookmarkVO);
					return AjaxResponseStatus.NORMAL_TRUE;
				} catch (Exception e) {
					logger.info(e.getMessage());
					e.printStackTrace();
					return AjaxResponseStatus.ERROR;
				}
			} else {
				// 조회 결과가 있는 경우(select된 행 존재) > 이미 북마크 된 축제입니다.
				logger.info("이미 북마크 된 축제입니다.");
				return AjaxResponseStatus.NORMAL_FALSE;
			}
		} else {
			logger.info("session is not found");
			return AjaxResponseStatus.NOT_SESSION;
		}
	}
	
	// 북마크 취소
	@PostMapping("/delete")
	@ResponseBody
	public AjaxResponseStatus deleteBookmark(int bookmarkCode, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		
		// 세션 null 체크
		if(loginUser != null) {
			try {
				bookmarkService.deleteBookmark(bookmarkCode, loginUser.getMemberCode());
				return AjaxResponseStatus.NORMAL_TRUE;
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
				return AjaxResponseStatus.ERROR;
			}
		} else {
			logger.info("session is not found");
			return AjaxResponseStatus.NOT_SESSION;
		}
	}
	
	// 북마크 여부 확인
	@GetMapping("/check")
	@ResponseBody
	public Map<String, Object> selectBookmark(int festivalCode, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		Map<String, Object> data = new HashMap<String, Object>();
		// 세션 null 체크
		if(loginUser != null) {
			try {
				BookmarkVO vo = bookmarkService.selectBookmark(loginUser.getMemberCode(), festivalCode);
				if(vo != null) {
					data.put("dataStat", AjaxResponseStatus.NORMAL_TRUE);
					data.put("bookmarkVO", vo);
				}else {
					data.put("dataStat", AjaxResponseStatus.NORMAL_FALSE);
				}
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
				data.put("dataStat", AjaxResponseStatus.ERROR);
			}
		} else {
			logger.info("session is not found");
			data.put("dataStat", AjaxResponseStatus.NOT_SESSION);
		}
		
		return data;
	}
	
	// 내 북마크 목록 조회
	@GetMapping("/list")
	@ResponseBody
	public List<BookmarkVO> selectBookmarkList(HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	// 세션에서 로그인 회원 정보 참조
		// 세션 null 체크
		if(loginUser != null) {
			try {
				return bookmarkService.selectBookmarkList(loginUser.getMemberCode());
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
		} else {
			logger.info("session is not found");
		}
		
		return null;
	}
}
