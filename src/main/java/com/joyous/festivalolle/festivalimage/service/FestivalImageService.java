package com.joyous.festivalolle.festivalimage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joyous.festivalolle.festivalimage.model.FestivalImageVO;
import com.joyous.festivalolle.festivalimage.repository.IFestivalImageRepository;

// 축제 이미지 서비스 구현 클래스
// 작성자 : 이수봉
@Service
public class FestivalImageService implements IFestivalImageService {

	@Autowired
	IFestivalImageRepository festivalImageRepository;	// repository 객체 주입
	
	// 축제 이미지 조회
	@Override
	public FestivalImageVO selectFestivalImage(int festivalCode) {
		return festivalImageRepository.selectFestivalImage(festivalCode);
	}

}
