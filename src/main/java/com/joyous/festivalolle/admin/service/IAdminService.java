package com.joyous.festivalolle.admin.service;

import com.joyous.festivalolle.admin.model.AdminVO;

public interface IAdminService {

	//작성자 이기쁨
	//1. 관리자 로그인
	AdminVO adminLogin(String id, String password);
}
