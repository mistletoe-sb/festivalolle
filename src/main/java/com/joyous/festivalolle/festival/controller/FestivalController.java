package com.joyous.festivalolle.festival.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.admin.model.PagingVO;
import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festival.repository.IFestivalRepository;
import com.joyous.festivalolle.festival.service.IFestivalService;

@Controller
@RequestMapping (value = "/admin")
public class FestivalController {
	
	private final Logger logger = LoggerFactory.getLogger(FestivalController.class);
	
	@Autowired
	private IFestivalService festivalService;
	
	@Autowired
	private IFestivalRepository festivalRepository;

	private String view_pos = "adminfestival/";		// 뷰 저장 위치

	private String loginAdmin = "loginAdmin";
	
	private String paging = "10";
/* =====================================================festivallist====================================================== */	
	@GetMapping("/festivallist")

	public String festivalList(Model model, HttpSession session) throws Exception {

		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		List<FestivalVO> festivalList = festivalService.selectFestivalList(organizationCode);
		model.addAttribute("festivallist", festivalList);

		return view_pos + "adminfestivallist";
	}

/* =====================================================statusfestivallist====================================================== */		
	/*	@GetMapping("/statusfestivallist")
	@ResponseBody
	public List<FestivalVO> selectFestivalList(@RequestParam(value="nowPage", required=false, defaultValue="1") int nowPage, Model model, HttpSession session) {				

		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		int festivalCount = festivalService.countFestival(organizationCode);
		List<FestivalVO> festivalList = festivalService.selectFestivalList(organizationCode);
		int totalPage = festivalService.countTotalPage(organizationCode, paging);
		return festivalList;		
	}
 */	
/* =====================================================festivastatusllist====================================================== */		
	@GetMapping("/festivastatusllist")
	@ResponseBody
	public List<FestivalVO> festivastatusllist(FestivalVO vo,Model model, HttpSession session, @RequestParam("status") int status) {				

		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		if(status == 5) {
			List<FestivalVO> selectFestivalList = festivalService.selectFestivalList(organizationCode);
			return selectFestivalList;	
		} else {
			vo.setOrganizationCode(organizationCode);
			vo.setStatus(status);
			List<FestivalVO> selectStatusFestivalList = festivalService.selectStatusFestivalList(vo);
			return selectStatusFestivalList;	
		}
	}

/* =====================================================adminfestivalinfo====================================================== */		
	@GetMapping("/adminfestivalinfo") 
	public String adminfestivalinfo(HttpServletResponse response, FestivalVO vo,Model model, HttpSession session, @RequestParam(value="festivalCode", required=true) int festivalCode) {

		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		vo.setOrganizationCode(organizationCode);
		vo.setFestivalCode(festivalCode);
		FestivalVO selectFestivalInfo = festivalService.selectFestivalInfo(vo);
		byte[] getImage = selectFestivalInfo.getImage();
		String img;
		model.addAttribute("adminfestivalinfo", selectFestivalInfo);
		if(getImage == null) {
			img = "1";
		} else {
			img = Base64.getEncoder().encodeToString(selectFestivalInfo.getImage());
		}
		
		model.addAttribute("img", img);
		
		return view_pos + "adminfestivalinfo";
	}
	
	/*@GetMapping("/adminfestivalinfo") 
	public String adminfestivalinfo(HttpServletResponse response, FestivalVO vo,Model model, HttpSession session, @RequestParam(value="festivalCode", required=true) int festivalCode) {
		AdminVO adminVO = (AdminVO) session.getAttribute("loginUser");
		int organizationCode = adminVO.getOrganizationCode();
		vo.setOrganizationCode(organizationCode);
		vo.setFestivalCode(festivalCode);
		FestivalVO selectFestivalInfo = festivalService.selectFestivalInfo(vo);

		
		model.addAttribute("adminfestivalinfo", selectFestivalInfo);
		return view_pos + "adminfestivalinfo";
	}*/
	
	/* =====================================================festivastatusllist====================================================== */	
	@GetMapping("/festivalinsertform") 
	public String festivalInsertform(Model model, HttpSession session) {
		return view_pos + "adminfestivalinsert";
	}

	/* =====================================================festivalinsert====================================================== */	
	@PostMapping("/festivalinsert")
	public String festivalInsert(FestivalVO vo, HttpSession session, Model model, RedirectAttributes redirectAttributes, @RequestParam("file") MultipartFile file) {
		try {
			//오늘날짜 yyyy-MM-dd로 생성
			String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
			 
			//yyyy-MM-dd 포맷 설정
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			 
			//비교할 date와 today를데이터 포맷으로 변경
			Date startDate = new Date(dateFormat.parse(vo.getStartDate()).getTime()); 
			Date endDate = new Date(dateFormat.parse(vo.getEndDate()).getTime());
			Date today = new Date(dateFormat.parse(todayfm).getTime());
			 
			//compareTo메서드를 통한 날짜비교
			int startCompare = startDate.compareTo(today); 
			int endCompare = endDate.compareTo(today); 
			 
			//조건문
			if(startCompare > 0) {
				vo.setStatus(2);//시작전
			} else if(startCompare < 0) {//시작후
				if(endCompare<0) {//끝난후
					vo.setStatus(3);
				}
				else {//끝나기전
					vo.setStatus(1);
				}
			} else {//축제 당일
				vo.setStatus(1);
			}

			byte[] fileBytes = file.getBytes();

			AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
			int organizationCode = adminVO.getOrganizationCode();
			String adminName = adminVO.getName();
			vo.setOrganizationCode(organizationCode);
			vo.setImage(fileBytes);
			vo.setThumbnail(fileBytes);
			vo.setAdminName(adminName);
			festivalService.insertFestival(vo);
			redirectAttributes.addFlashAttribute("message", "완료");
		} catch(RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/admin/festivallist";
	}
	
	/* =====================================================adminfestivalupdateform====================================================== */	
	@GetMapping("/adminfestivalupdateform") 
	public String adminfestivalupdateform(HttpServletResponse response, FestivalVO vo,Model model, HttpSession session, @RequestParam(value="festivalCode", required=true) int festivalCode) {

		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		vo.setOrganizationCode(organizationCode);
		vo.setFestivalCode(festivalCode);
		FestivalVO selectFestivalInfo = festivalService.selectFestivalInfo(vo);

		
		model.addAttribute("adminfestivalinfo", selectFestivalInfo);
		byte[] getImage = selectFestivalInfo.getImage();
		String img;
		model.addAttribute("adminfestivalinfo", selectFestivalInfo);
		if(getImage == null) {
			img = "1";
		} else {
			img = Base64.getEncoder().encodeToString(selectFestivalInfo.getImage());
		}
		
		model.addAttribute("img", img);
		
		return view_pos + "adminfestivalupdate";
	}
	
	/* =====================================================adminfestivalupdate====================================================== */	
	@PostMapping("/adminfestivalupdate")
	public String adminfestivalupdate(FestivalVO vo, RedirectAttributes redirectAttributes, HttpSession session, @RequestParam("file") MultipartFile file, 
			@RequestParam(value="festivalCode", required=true) int festivalCode) {
		try {
			/*
			 * if(profile.getSize() != 0) { String profileURL = PATH + "\\" +
			 * profile.getBytes(); profile.transferTo(new File(profileURL));
			 * vo.setImage(profile.getBytes());//setMemberProfile(); }
			 */

			int imgstatus = (int) vo.getRating();
			//오늘날짜 yyyy-MM-dd로 생성
			String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
			 
			//yyyy-MM-dd 포맷 설정
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			 
			//비교할 date와 today를데이터 포맷으로 변경
			Date startDate = new Date(dateFormat.parse(vo.getStartDate()).getTime()); 
			Date endDate = new Date(dateFormat.parse(vo.getEndDate()).getTime());
			Date today = new Date(dateFormat.parse(todayfm).getTime());
			 
			//compareTo메서드를 통한 날짜비교
			int startCompare = startDate.compareTo(today); 
			int endCompare = endDate.compareTo(today); 
			 
			//조건문
			if(startCompare > 0) {
				vo.setStatus(2);

			} else if(startCompare < 0) {
				if(endCompare<0) {
					vo.setStatus(3);
				}
				else {
					vo.setStatus(1);
				}
			} else {
				vo.setStatus(1);
			}
			
			byte[] fileBytes = file.getBytes();

			AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
			int organizationCode = adminVO.getOrganizationCode();
			String adminName = adminVO.getName();
			vo.setFestivalCode(festivalCode);
			vo.setOrganizationCode(organizationCode);
			vo.setAdminName(adminName);

			logger.info("^ file"+file.getSize());
			logger.info("^ getImage"+vo.getImage());
			
			if(imgstatus==0) {
				vo.setImage(fileBytes);
				vo.setThumbnail(fileBytes);
				festivalRepository.insertFestivalImage(vo);
			} else {
				if(file.getSize()==0) {
					
				} else {
					vo.setImage(fileBytes);
					vo.setThumbnail(fileBytes);
					festivalService.updateFestivalImage(vo);
				}
			}
			festivalService.updateFestival(vo);
			
			redirectAttributes.addFlashAttribute("message", "완료");
		} catch(RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/admin/adminfestivalinfo?festivalCode="+festivalCode;
	}
	
	/* =====================================================selectYearTitleList====================================================== */	
	@GetMapping("/selectYearTitleList")
	@ResponseBody
	public List<FestivalVO> selectYearTitleList(FestivalVO vo,Model model, HttpSession session, @RequestParam("titleyear") String titleyear) {				
		String titleyear2 = titleyear + "%";

		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		vo.setOrganizationCode(organizationCode);
		vo.setStartDate(titleyear2);
		List<FestivalVO> selectYearTitleList = festivalService.selectYearTitleList(vo);
		return selectYearTitleList;	
	}
	
	/* =====================================================selectYearFestival====================================================== */	
	@GetMapping("/selectYearFestival")
	@ResponseBody
	public List<FestivalVO> selectYearFestival(FestivalVO vo,Model model, HttpSession session, @RequestParam("festivalCode") int festivalCode)  {				
			
		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		vo.setOrganizationCode(organizationCode);
		vo.setFestivalCode(festivalCode);
		List<FestivalVO> selectYearTitleList = festivalService.selectYearFestival(vo);
		return selectYearTitleList;	
	}
	/* =====================================================festivalSearch====================================================== */	
	@GetMapping("/festivalSearch")
	@ResponseBody
	public List<FestivalVO> festivalSearch(Model model, HttpSession session, @RequestParam("festivalKeyword") String festivalKeyword, @RequestParam("tableBox") String tableBox)  {				
		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		List<FestivalVO> festivalSearch = festivalService.selectFestivalSearch(organizationCode,festivalKeyword,tableBox);
		return festivalSearch;	
	}
/*	
	@RequestMapping("/getByteImage")
	public ResponseEntity<byte[]> getBinaryFile(FestivalVO vo,@PathVariable long fileid, HttpServletRequest req, HttpServletResponse res, Model model){
		final HttpHeaders headers = new HttpHeaders();
		
		java.io.InputStream is = null;
		
		try {
			byte[] imgFile = (byte[]) vo.getImage();
			is = new ByteArrayInputStream(imgFile);
			PrintWriter os = res.getWriter();
			int binaryRead;
			while ((binaryRead = is.read()) != -1) {
				os.write(binaryRead);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (is != null)
				try {is.close();}
			catch(IOException ex) {}
		}
		
		return new ResponseEntity<byte[]>(headers, HttpStatus.OK);
	}
*/
	
	/* =====================================================getFestivalImage====================================================== */	
	@RequestMapping("/image/{id}")
	public ResponseEntity<byte[]> getFestivalImage(FestivalVO vo,@PathVariable int id, HttpSession session) {

		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		vo.setOrganizationCode(organizationCode);
		vo.setFestivalCode(id);
	    FestivalVO festival = festivalService.selectFestivalInfo(vo);
	    byte[] imgFile = festival.getImage();
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.IMAGE_JPEG);
	    headers.setContentLength(imgFile.length);
	    return new ResponseEntity<byte[]>(imgFile, headers, HttpStatus.OK);
	}
	
	/* =====================================================updateFestivalStatus====================================================== */	
	@GetMapping("/updateFestivalStatus") 
	void updateFestivalStatus(FestivalVO vo, @RequestParam("status") int status, @RequestParam("organizationCode") int organizationCode, @RequestParam("festivalCode") int festivalCode, @RequestParam("start") String start, @RequestParam("end") String end) throws ParseException {
		vo.setOrganizationCode(organizationCode);
		vo.setFestivalCode(festivalCode);
		if(status == 0) {
			vo.setStatus(0);
			festivalService.updateFestivalStatus(vo);
		} else {
			//오늘날짜 yyyy-MM-dd로 생성
			String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
			 
			//yyyy-MM-dd 포맷 설정
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			 
			//비교할 date와 today를데이터 포맷으로 변경
			Date startDate = new Date(dateFormat.parse(start).getTime()); 
			Date endDate = new Date(dateFormat.parse(end).getTime());
			Date today = new Date(dateFormat.parse(todayfm).getTime());
			 
			//compareTo메서드를 통한 날짜비교
			int startCompare = startDate.compareTo(today); 
			int endCompare = endDate.compareTo(today); 
			 
			//조건문
			if(startCompare > 0) {
				vo.setStatus(2);
			} else if(startCompare < 0) {
				if (endCompare<0) {
					vo.setStatus(3);
				}
				else {
					vo.setStatus(1);
				}
			} else {
				vo.setStatus(1);
			}
			festivalService.updateFestivalStatus(vo);
		}
	}
	
	/* =====================================================festivallistpaging====================================================== */	

	//페이징처리
	@PostMapping(value="/festivallistpaging")	  
	@ResponseBody 
	public Map<String, Object> adminPaging(HttpSession session, String nowPage, String cntPerPage, String radioInput, String titleListInput, String tableBoxInput, String searchInput, PagingVO vo, Locale locale) {
	
		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		Map<String,Object> map = new HashMap<String,Object>();	//매퍼에 넘겨줄 map
		Map<String, Object> result = new HashMap<String, Object>();	//DB에서 검색해 온 결과 담아줄 result	 
		int total = festivalService.countFestival(organizationCode,radioInput, titleListInput, tableBoxInput, searchInput);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = paging;
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = paging;
		}
		logger.info("^ total"+total);
		logger.info("^ nowPage"+Integer.parseInt(nowPage));
		logger.info("^ cntPerPage"+Integer.parseInt(cntPerPage));
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//model.addAttribute("paging", vo);
		//model.addAttribute("viewAll", adminService.selectBoard(vo));
		//return "system/adminlist2";
		//List<AdminVO> adminList = adminService.getAdminList();
		//adminList = adminService.adminSearch(keyword);
  	 
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		map.put("organizationCode", organizationCode);
		map.put("radioInput", radioInput);
		map.put("titleListInput", titleListInput);
		map.put("tableBoxInput", tableBoxInput);
		map.put("searchInput", searchInput);
  
		List<FestivalVO> viewAll = festivalService.selectMapFestivalList(map);
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
