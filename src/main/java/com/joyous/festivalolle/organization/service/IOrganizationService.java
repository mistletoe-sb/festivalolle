package com.joyous.festivalolle.organization.service;

import java.util.List;

// 작성자 : 이수봉
// 기관 테이블 서비스
public interface IOrganizationService {
	List<String> selectOrganizationNameList();	// 기관 목록 조회
}
