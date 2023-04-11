package com.joyous.festivalolle.admin.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.admin.service.IAdminService;

@Controller
public class SystemController {
	
	private final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	IAdminService adminService;
	
	//List<AdminVO> adminList = adminService.getAdminList();
	
	//시스템 관리자 페이지로 이동: 관리자 목록 출력
	@GetMapping(value="/system/adminlist")
	public String login(Model model, HttpSession session) {
		List<AdminVO> adminList = adminService.getAdminList();
		model.addAttribute("adminList", adminList);
		return "system/adminlist";	
	}
	
	//시스템 관리자: 관리자 상세보기
	
	
	@PostMapping(value="/system/admindetail")	  
	@ResponseBody 
	public AdminVO adminDetail(String id, Model model, HttpSession session, Locale locale) {
	  
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
	 
	  //@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	  @GetMapping(value="/admin/adminlist")
	  public String list(@ModelAttribute("searchVO") AdminVO searchVO, HttpServletRequest request, Model model) throws UnsupportedEncodingException {
	      
	      Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
	      if(null != inputFlashMap) {
	          
	          model.addAttribute("msg",(String) inputFlashMap.get("msg"));
	          
	      }
	      
	      //페이징[s]
	      Pagination pagination = new Pagination();
	      pagination.setCurrentPageNo(searchVO.getPageIndex());
	      pagination.setRecordCountPerPage(searchVO.getPageUnit());
	      pagination.setPageSize(searchVO.getPageSize());
	      
	      searchVO.setFirstIndex(pagination.getFirstRecordIndex());
	      searchVO.setRecordCountPerPage(pagination.getRecordCountPerPage());
	      
	      List<AdminVO> boardList = adminService.getList(searchVO);
	      int totCnt = adminService.getListCnt(searchVO);
	      
	      pagination.setTotalRecordCount(totCnt);
	      
	      searchVO.setEndDate(pagination.getLastPageNoOnPageList());
	      searchVO.setStartDate(pagination.getFirstPageNoOnPageList());
	      searchVO.setPrev(pagination.getXprev());
	      searchVO.setNext(pagination.getXnext());
	      
	      model.addAttribute("boardList",boardList);
	      model.addAttribute("totCnt",totCnt);
	      model.addAttribute("totalPageCnt",(int)Math.ceil(totCnt / (double)searchVO.getPageUnit()));
	      model.addAttribute("pagination",pagination);
	      //페이징[e]
	      
	      //searchVO.setQustr();
	      
	      return "/board/list";
	  }

 

	

	
	
}
