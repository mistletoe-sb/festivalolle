package com.joyous.festivalolle.organization.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.organization.repository.IOrganizationRepository;

// 작성자 : 이수봉
// 기관 테이블 서비스 구현
@Service
public class OrganizationService implements IOrganizationService {

	@Autowired
	IOrganizationRepository organizationRepository;		// repository 객체 주입
	
	// 기관 목록 조회
	@Override
	public List<String> selectOrganizationNameList() {
		return organizationRepository.selectOrganizationNameList();
	}

}
