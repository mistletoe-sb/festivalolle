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
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11"+organizationCode);
		return festivalRepository.selectFestivalList(organizationCode);
	}
	
	@Override
	public List<FestivalVO> selectStatusFestivalList(FestivalVO vo) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!22"+vo.getOrganizationCode());
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
	public void updateFestival(FestivalVO vo) {
		festivalRepository.updateFestival(vo);
		festivalRepository.updateFestivalImage(vo);

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


}
