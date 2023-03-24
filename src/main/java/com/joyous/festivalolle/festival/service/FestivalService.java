package com.joyous.festivalolle.festival.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public FestivalVO selectFestivalInfo(int festivalCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFestival(FestivalVO vo) {
		festivalRepository.insertFestival(vo);
		festivalRepository.insertFestivalImage(vo);

	}

	@Override
	public void updateFestival(FestivalVO vo) {
		// TODO Auto-generated method stub

	}

}
