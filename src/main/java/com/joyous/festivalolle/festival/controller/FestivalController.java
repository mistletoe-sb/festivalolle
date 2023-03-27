package com.joyous.festivalolle.festival.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festival.service.IFestivalService;

@Controller
public class FestivalController {
	@Autowired
	private IFestivalService festivalService;

	private String view_pos = "admin/";		// 뷰 저장 위치
	
	@GetMapping(value="/admin/festivallist")
	public String festivalList(Model model, HttpSession session) {
//		ManagerVO vo = (ManagerVO)session.getAttribute("loginManager");
//		int managerLevel = vo.getManagerLevel();
		int organizationCode = 1;//(String)session.getAttribute("organizationCode");
		model.addAttribute("selectFestivalList", festivalService.selectFestivalList(1));
		return view_pos + "adminfestivallist";
	}
	
	@GetMapping(value="/admin/festivalinsertform") 
	public String festivalInsertform(Model model, HttpSession session) {
		return view_pos + "adminfestivalinsert";
	}
	
	@PostMapping(value="/admin/festivalinsert")
	public String festivalInsert(FestivalVO vo, RedirectAttributes redirectAttributes, @RequestParam MultipartFile profile) {
		try {
			/*
			 * if(profile.getSize() != 0) { String profileURL = PATH + "\\" +
			 * profile.getBytes(); profile.transferTo(new File(profileURL));
			 * vo.setImage(profile.getBytes());//setMemberProfile(); }
			 */
			vo.setAdminName("담당자1");
			vo.setOrganizationCode(1);
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
		return "redirect:/admin/festivallist";
	}

}
