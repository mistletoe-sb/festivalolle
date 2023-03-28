package com.joyous.festivalolle.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.admin.model.AdminVO;
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

}
