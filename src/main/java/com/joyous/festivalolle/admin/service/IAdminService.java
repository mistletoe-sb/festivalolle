package com.joyous.festivalolle.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.admin.model.AdminVO;

public interface IAdminService {

	//작성자 이기쁨
	//1. 관리자 로그인
	AdminVO adminLogin(String id, String password);
	
	//관리자 등록
	int registerAdmin(AdminVO adminVO);
	
	//관리자 등록: 기관 코드 가져오기
	int organizationCode(String organizationName);
	
	//시스템 관리자: 가입 승인 관리
	List<AdminVO> getAdminList();
	
	//시스템 관리자: 기관 상세보기
	AdminVO getAdminList(String id);
	
}
