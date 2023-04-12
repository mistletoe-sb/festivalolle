package com.joyous.festivalolle.admin.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.admin.model.PagingVO;
import com.joyous.festivalolle.admin.service.IAdminService;

@Controller
public class SystemController {
	
	private final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	IAdminService adminService;
	
	//List<AdminVO> adminList = adminService.getAdminList();
	
	//시스템 관리자 페이지로 이동: 관리자 목록 출력
	//@GetMapping(value="/system/adminlist")
	//public String login(Model model, HttpSession session) {
	//	List<AdminVO> adminList = adminService.getAdminList();
	//	model.addAttribute("adminList", adminList);
	//	return "system/adminlist";	
	//}
	
	//시스템 관리자: 관리자 상세보기
	
	
	@PostMapping(value="/system/admindetail")	  
	@ResponseBody 
	public AdminVO adminDetail(String id, Model model, HttpSession session, Locale locale) {
		logger.info("디테일 보러 왔다!");
		AdminVO adminDetail = new AdminVO(); 
		adminDetail = adminService.getAdminList(id); 
		logger.info(id);
		logger.info(adminDetail.getId(), locale);  
				  
		return adminDetail;	  
	}
	
	@PostMapping(value="/system/approval")	
	@ResponseBody
	public String adminApproval(String id, Locale locale) {
		adminService.adminApproval(id);
		
		return (adminService.adminApproval(id) == 1)? "ok":"fail";
		
	}
	
	/*
	 * @PostMapping(value="/system/search")
	 * 
	 * @ResponseBody public Map<String, Object> adminSearch(@RequestBody Map<String,
	 * Object> paramMap) throws Exception{ List<Map<String, Object>> resultList =
	 * adminService.adminSearch(paramMap); paramMap.put("resultList", resultList);
	 * 
	 * return paramMap; }
	 */
	
	
	  @PostMapping(value="/system/search")	  
	  @ResponseBody 
	  public List<AdminVO> adminSearch(String keyword, Locale locale) {
		  List<AdminVO> adminList = adminService.getAdminList();
		  adminList = adminService.adminSearch(keyword);
	  
		  return adminList; 
	  }
	 
	  
	  /*
	  @GetMapping("/system/adminlist")
	  public String boardList(PagingVO vo, String keyword, Model model
	  		, @RequestParam(value="nowPage", required=false)String nowPage
	  		, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
	  	
	  	int total = adminService.countBoard(keyword);
	  	if (nowPage == null && cntPerPage == null) {
	  		nowPage = "1";
	  		cntPerPage = "10";
	  	} else if (nowPage == null) {
	  		nowPage = "1";
	  	} else if (cntPerPage == null) { 
	  		cntPerPage = "10";
	  	}
	  	vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	  	
	  	Map<String,Object> map = new HashMap<String,Object>();	//매퍼에 넘겨줄 map
	  	map.put("start", vo.getStart());
	  	map.put("end", vo.getEnd());
	  	map.put("keyword", keyword);
		  
	  	
	  	
	  	model.addAttribute("paging", vo);
	  	model.addAttribute("viewAll", adminService.selectBoard(map));
	  	return "system/adminlist2";
	  }
	  */
	  
	  
	  
	  @GetMapping("/system/adminlist")
	  public String boardList() {
		  return "system/adminlist2";
	  }
	  
	  

	  //페이징처리
	  @PostMapping(value="/system/adminlist")	  
	  @ResponseBody 
	  public Map<String, Object> adminPaging(String nowPage, String cntPerPage, String keyword, PagingVO vo, Locale locale) {
		  
		  Map<String,Object> map = new HashMap<String,Object>();	//매퍼에 넘겨줄 map
		  Map<String, Object> result = new HashMap<String, Object>();	//DB에서 검색해 온 결과 담아줄 result	 
		  int total = adminService.countBoard(keyword);
		  
		  if (nowPage == null && cntPerPage == null) {
		  		nowPage = "1";
		  		cntPerPage = "10";
		  	} else if (nowPage == null) {
		  		nowPage = "1";
		  	} else if (cntPerPage == null) { 
		  		cntPerPage = "10";
		  	}
		  
		  	
		  
		  
		  	vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		  	//model.addAttribute("paging", vo);
		  	//model.addAttribute("viewAll", adminService.selectBoard(vo));
		  	//return "system/adminlist2";
		  	
		  
		  //List<AdminVO> adminList = adminService.getAdminList();
		  //adminList = adminService.adminSearch(keyword);
		  
		  logger.info("컨트롤러에서 받음" + keyword);		 
		  map.put("start", vo.getStart());
		  map.put("end", vo.getEnd());
		  map.put("keyword", keyword);
		  
		  
		  List<AdminVO> viewAll = adminService.selectBoard(map);
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
