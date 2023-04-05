package com.joyous.festivalolle.festival.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.portable.InputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festival.service.IFestivalService;

@Controller
@RequestMapping (value = "/admin")
public class FestivalController {
	
	
	@Autowired
	private IFestivalService festivalService;

	private String view_pos = "adminfestival/";		// 뷰 저장 위치

	private String loginAdmin = "loginAdmin";
/* =====================================================festivallist====================================================== */	
	@GetMapping("/festivallist")

	public String festivalList(Model model, HttpSession session) throws Exception {
		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		List<FestivalVO> selectFestivalList = festivalService.selectFestivalList(organizationCode);
		model.addAttribute("selectFestivalList", selectFestivalList);

		return view_pos + "adminfestivallist";
	}

/* =====================================================statusfestivallist====================================================== */		
	@GetMapping("/statusfestivallist")
	@ResponseBody
	public List<FestivalVO> selectFestivalList(Model model, HttpSession session) {				
		AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
		int organizationCode = adminVO.getOrganizationCode();
		List<FestivalVO> selectFestivalList = festivalService.selectFestivalList(organizationCode);
		return selectFestivalList;		
	}

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
			  System.out.println("date가 today보다 큽니다.(date > today)");
			}else if(startCompare < 0) {//시작후
				if (endCompare<0) {//끝난후
					vo.setStatus(3);
				}
				else {//끝나기전
					vo.setStatus(1);
				}
				
			  System.out.println("today가 date보다 큽니다.(date < today)");
			}else {//축제 당일
				vo.setStatus(1);
			  System.out.println("today와 date가 같습니다.(date = today)");
			}


			byte[] fileBytes = file.getBytes();
			System.out.println(fileBytes+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!완료");
			AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
			int organizationCode = adminVO.getOrganizationCode();
			String adminName = adminVO.getName();
			vo.setOrganizationCode(organizationCode);
			vo.setImage(fileBytes);
			vo.setThumbnail(fileBytes);
			vo.setAdminName(adminName);
			festivalService.insertFestival(vo);
			redirectAttributes.addFlashAttribute("message", "완료");
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!완료");
		}catch(RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!RuntimeException");
			e.printStackTrace();
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Exception");
		}
		return view_pos + "adminfestivallist";
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
	public String adminfestivalupdate(FestivalVO vo, RedirectAttributes redirectAttributes, HttpSession session, @RequestParam("file") MultipartFile file, @RequestParam(value="festivalCode", required=true) int festivalCode) {
		try {
			/*
			 * if(profile.getSize() != 0) { String profileURL = PATH + "\\" +
			 * profile.getBytes(); profile.transferTo(new File(profileURL));
			 * vo.setImage(profile.getBytes());//setMemberProfile(); }
			 */
			
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
			  System.out.println("date가 today보다 큽니다.(date > today)");
			}else if(startCompare < 0) {
				if (endCompare<0) {
					vo.setStatus(3);
				}
				else {
					vo.setStatus(1);
				}
				
			  System.out.println("today가 date보다 큽니다.(date < today)");
			}else {
				vo.setStatus(1);
			  System.out.println("today와 date가 같습니다.(date = today)");
			}

			
			byte[] fileBytes = file.getBytes();
			System.out.println(fileBytes+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!완료");
			AdminVO adminVO = (AdminVO) session.getAttribute(loginAdmin);
			int organizationCode = adminVO.getOrganizationCode();
			String adminName = adminVO.getName();
			vo.setFestivalCode(festivalCode);
			vo.setOrganizationCode(organizationCode);
			vo.setImage(fileBytes);
			vo.setThumbnail(fileBytes);
			vo.setAdminName(adminName);
			festivalService.updateFestival(vo);
			redirectAttributes.addFlashAttribute("message", "완료");
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!완료");
		}catch(RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!RuntimeException");
			e.printStackTrace();
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Exception");
		}
		return "redirect:/admin/adminfestivalinfo?festivalCode="+festivalCode;
	}
	
	/* =====================================================selectYearTitleList====================================================== */	
	@GetMapping("/selectYearTitleList")
	@ResponseBody
	public List<FestivalVO> selectYearTitleList(FestivalVO vo,Model model, HttpSession session, @RequestParam("titleyear") String titleyear) {				
		String titleyear2 = titleyear + "%";
		System.out.println(titleyear2);
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
		if (status == 0) {
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
			  System.out.println("date가 today보다 큽니다.(date > today)");
			}else if(startCompare < 0) {
				if (endCompare<0) {
					vo.setStatus(3);
				}
				else {
					vo.setStatus(1);
				}
				
			  System.out.println("today가 date보다 큽니다.(date < today)");
			}else {
				vo.setStatus(1);
			  System.out.println("today와 date가 같습니다.(date = today)");
			}
			
			festivalService.updateFestivalStatus(vo);
		}
	}

}
