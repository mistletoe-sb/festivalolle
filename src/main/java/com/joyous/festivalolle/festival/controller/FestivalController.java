package com.joyous.festivalolle.festival.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festival.service.IFestivalService;

@Controller
@RequestMapping (value = "/admin")
public class FestivalController {
	
	
	@Autowired
	private IFestivalService festivalService;

	private String view_pos = "adminfestival/";		// 뷰 저장 위치
	
	@GetMapping("/festivallist")
	public String festivalList(Model model, HttpSession session) throws Exception {
//		ManagerVO vo = (ManagerVO)session.getAttribute("loginManager");
//		int managerLevel = vo.getManagerLevel();
		int organizationCode = 1;//(String)session.getAttribute("organizationCode");
		model.addAttribute("selectFestivalList", festivalService.selectFestivalList(1));
		/*
		List<String> areaList = festivalService.getAreaList();
		
		for(String area : areaList){
		    System.out.println(area);
		}*/
		

	
		return view_pos + "adminfestivallist";
	}
	
	@GetMapping("/festivalinsertform") 
	public String festivalInsertform(Model model, HttpSession session) {
		return view_pos + "adminfestivalinsert";
	}
	@ResponseBody
	@PostMapping("/festivalinsert")
	public String festivalInsert(FestivalVO vo, RedirectAttributes redirectAttributes, @RequestParam("file") MultipartFile file) {
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
				vo.setOrganizationCode(2);
			  System.out.println("date가 today보다 큽니다.(date > today)");
			}else if(startCompare < 0) {
				if (endCompare<0) {
					vo.setOrganizationCode(3);
				}
				else {
					vo.setOrganizationCode(1);
				}
				
			  System.out.println("today가 date보다 큽니다.(date < today)");
			}else {
				vo.setOrganizationCode(1);
			  System.out.println("today와 date가 같습니다.(date = today)");
			}

			
			byte[] fileBytes = file.getBytes();
			System.out.println(fileBytes+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!완료");
			vo.setImage(fileBytes);
			vo.setThumbnail(fileBytes);
			vo.setAdminName("담당자1");
			vo.setStatus(1);
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

}
