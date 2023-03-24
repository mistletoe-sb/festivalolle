package com.joyous.festivalolle.admin.service;

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

}
