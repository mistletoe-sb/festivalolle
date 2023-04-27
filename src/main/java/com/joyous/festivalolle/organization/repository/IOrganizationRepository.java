package com.joyous.festivalolle.organization.repository;

import java.util.List;

// 작성자 : 이수봉
// 기관 테이블 레포지토리
public interface IOrganizationRepository {
	List<String> selectOrganizationNameList();	// 기관 목록 조회
}
