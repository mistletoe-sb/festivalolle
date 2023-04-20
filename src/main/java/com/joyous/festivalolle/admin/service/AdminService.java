package com.joyous.festivalolle.admin.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.admin.controller.NaverSENSXXX;
import com.joyous.festivalolle.admin.controller.NaverSENS2;
import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.admin.model.PagingVO;
import com.joyous.festivalolle.admin.repository.IAdminRepository;

@Service
public class AdminService implements IAdminService {
	
	//작성자: 이기쁨
	@Autowired
	@Qualifier("IAdminRepository")
	IAdminRepository adminRepository;
	
	
	//관리자 로그인
	@Override
	public AdminVO adminLogin(String id, String password) {
		return adminRepository.adminLogin(id, password);	
	}
	
	//관리자 등록
	@Override
	public int registerAdmin(AdminVO adminVO) {
		return adminRepository.registerAdmin(adminVO);
	}
	
	//관리자 등록: 기관 코드 가져오기
	@Override
	public int organizationCode(String organizationName) {
		return adminRepository.organizationCode(organizationName);
	}
	
	//아이디 찾기
	@Override
	public String findId(String name, String telephone) {
		return adminRepository.findId(name, telephone);
	}
	
	//시스템 관리자: 가입 승인 관리
	@Override
	public List<AdminVO> getAdminList() {
		return adminRepository.getAdminList();
	}
	
	//시스템 관리자: 기관 상세보기
	@Override
	public AdminVO getAdminList(String id) {
		return adminRepository.getAdminList(id);
	}
	
	//시스템 관리자: 관리자 가입 승인
	@Override
	public int adminApproval(String id) {
		return adminRepository.adminApproval(id);
	}
	
	//시스템 관리자: 관리자 검색
	//@Override
	//public List<Map<String, Object>> adminSearch(Map<String, Object> paramMap) throws Exception{
	//	return adminRepository.adminSearch(paramMap);
	//}
	
	//시스템 관리자: 관리자 검색
	@Override
	public List<AdminVO> adminSearch(String keyword) {
		return adminRepository.adminSearch(keyword);
	}
	
	//관리자 등록 시 중복확인
	@Override
	public int overlapChk(AdminVO adminVO) {	
		return adminRepository.overlapChk(adminVO);
	}

		
	//난수 생성
	public String sendRandomMessage(String tel) {
	    NaverSENS2 sens = new NaverSENS2();
	    Random rand = new Random();
	    String numStr = "";
	    for (int i = 0; i < 6; i++) {
	        String ran = Integer.toString(rand.nextInt(10));
	        numStr += ran;
	    }
	    System.out.println("회원가입 문자 인증 => " + numStr);

	    sens.sendSMS(tel, numStr);

	    return numStr;
	}
	
	public int insertVerifNum(String tel, String numStr) {
		return adminRepository.insertVerifNum(tel, numStr);
	}
	
	

	
	// adminlist 전체 수 총 갯수
	public int countBoard(String keyword) {
		return adminRepository.countBoard(keyword);
	}

	// 페이징 처리 게시글 조회
	public List<AdminVO> selectBoard(Map<String,Object> map) {
		return adminRepository.selectBoard(map);
		
	}
	
	
	
	
}
