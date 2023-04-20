package com.joyous.festivalolle.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.admin.model.AdminVO;
import com.joyous.festivalolle.admin.model.PagingVO;


public interface IAdminRepository {
	//작성자 이기쁨
	//로그인
	AdminVO adminLogin(@Param("id") String id, @Param("password") String password);

	//관리자 등록
	int registerAdmin(AdminVO adminVO);
	
	//관리자 등록: 기관 코드 가져오기
	int organizationCode(@Param("organizationName") String organizationName);
	
	//아이디 찾기
	String findId(@Param("name") String name, @Param("telephone") String telephone);
			
	//시스템 관리자: 가입 승인 관리/리스트 출력
	List<AdminVO> getAdminList();
	
	//시스템 관리자: 기관 상세보기
	AdminVO getAdminList(@Param("id") String id);
	
	//시스템 관리자: 관리자 가입 승인
	int adminApproval(@Param("id") String id);
	
	//시스템 관리자: 관리자 검색
	List<AdminVO> adminSearch(@Param("keyword") String keyword);
	
	//관리자 등록 시 중복확인
	//1. 아이디 중복 체크
	//2. 이메일 중복 체크
	//3. 핸드폰 번호 중복 체크
	int overlapChk(AdminVO adminVO);
	
	//시스템 관리자 adminlist 전체 수(Pagination)
	//public List<AdminVO>getList(AdminVO searchVO);
	//public int getListCnt(AdminVO searchVO);
	
	// adminlist 전체 수 총 갯수
	public int countBoard(String keyword);

	// 페이징 처리 게시글 조회
	//public List<AdminVO> selectBoard(PagingVO vo);
	public List<AdminVO> selectBoard(Map<String,Object> map);
	
	//계정 인증용 인증번호 저장
	int insertVerifNum(@Param("tel") String tel, @Param("numStr") String numStr);
	
	
	
}
