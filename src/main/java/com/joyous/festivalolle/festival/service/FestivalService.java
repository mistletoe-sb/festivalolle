package com.joyous.festivalolle.festival.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.joyous.festivalolle.festival.model.FestivalVO;
import com.joyous.festivalolle.festival.repository.IFestivalRepository;

@Service
public class FestivalService implements IFestivalService {
	
	@Autowired
	private IFestivalRepository festivalRepository;	// FestivalRepository 객체
	
	@Override
	public List<FestivalVO> selectFestivalList(int organizationCode) {
		return festivalRepository.selectFestivalList(organizationCode);
	}

	
	@Override
	public int countFestival(int organizationCode) {
		return festivalRepository.countFestival(organizationCode);
	}

	@Override
	public int countTotalPage(int organizationCode, int pageLimit) {
		int totalRecord = this.countFestival(organizationCode);
		int totalPage;
		
		if (totalRecord % pageLimit == 0){	// 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 나머지가 0으로 몫이 딱 맞아 떨어질 경우.
	     	totalPage = totalRecord/pageLimit;	// 총 페이지는 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 값.
	     	Math.floor(totalPage); 
		}
		else{	// 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 나머지가 0이 아닐 경우.
		   totalPage = totalRecord/pageLimit;
		   Math.floor(totalPage);
		   totalPage = totalPage + 1;	// 총 페이지는 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 몫 + 1.
		}
		return totalPage;
	}

	@Override
	public List<FestivalVO> selectFestivalList(int organizationCode , int pageLimit, int nowPage) {
		
		int totalRecord = this.countFestival(organizationCode);
		int beforeFestivalCount = (nowPage - 1) * pageLimit;
		int indexFestivalCount = beforeFestivalCount + 1;
				
		List<FestivalVO> totalFestivalList = festivalRepository.selectFestivalList(organizationCode);
		
		List<FestivalVO> resultFestivalList = new ArrayList<FestivalVO>(pageLimit);
		
		while(true) {
			if(indexFestivalCount < (beforeFestivalCount + pageLimit) && indexFestivalCount <= totalRecord) {	// index값이 총 게시글수보다 작고 출력될 게시글 번호+9보다 작을 때까지 indexBoardCount에 +1하여 while문 진행
				resultFestivalList.add(totalFestivalList.get(indexFestivalCount-1));
				indexFestivalCount++;
			} else {
				break;	// index값이 게시글 번호+9에 도달하면 while문 탈출.
			}
		}
		
		return resultFestivalList;
	}
	
	@Override
	public List<FestivalVO> selectStatusFestivalList(FestivalVO vo) {
		return festivalRepository.selectStatusFestivalList(vo);
	}

	@Override
	public FestivalVO selectFestivalInfo(FestivalVO vo) {
		// TODO Auto-generated method stub
		return festivalRepository.selectFestivalInfo(vo);
	}

	@Override
	public void insertFestival(FestivalVO vo) {
		festivalRepository.insertFestival(vo);
		festivalRepository.insertFestivalImage(vo);
	}
	
	@Override
	public void updateFestivalImage(FestivalVO vo) {
		festivalRepository.updateFestivalImage(vo);
	}

	@Override
	public void updateFestival(FestivalVO vo) {
		festivalRepository.updateFestival(vo);
		

	}

	@Override
	public void updateFestivalStatus(FestivalVO vo) {
		festivalRepository.updateFestivalStatus(vo);
		
	}

	@Override
	public List<FestivalVO> selectYearTitleList(FestivalVO vo) {
		return festivalRepository.selectYearTitleList(vo);
	}

	@Override
	public List<FestivalVO> selectYearFestival(FestivalVO vo) {
		return festivalRepository.selectYearFestival(vo);
	}

	@Override
	public List<FestivalVO> selectFestivalSearch(int organizationCode,String festivalKeyword, String tableBox) {
		return festivalRepository.selectFestivalSearch(organizationCode,festivalKeyword, tableBox);
	}

	



}
