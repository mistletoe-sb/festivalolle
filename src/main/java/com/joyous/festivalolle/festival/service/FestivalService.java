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
		return festivalRepository.selectFestivalList(organizationCode);
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

	@Override
	public List<FestivalVO> selectFestivalSearch(int organizationCode,String festivalKeyword, String tableBox) {
		return festivalRepository.selectFestivalSearch(organizationCode,festivalKeyword, tableBox);
	}


}
