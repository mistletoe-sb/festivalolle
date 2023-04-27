package com.joyous.festivalolle.organization.model;

import lombok.Data;

// 기관 테이블 정보
@Data
public class OrganizationVO {
	private int organizationCode;		// 기관코드
	private String organizationName;	// 기관명
	private String address;				// 기관 주소
}
