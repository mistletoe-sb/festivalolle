package com.joyous.festivalolle.bookmark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joyous.festivalolle.bookmark.model.BookmarkVO;
import com.joyous.festivalolle.bookmark.repository.IBookmarkRepository;

// 북마크 service 구현 클래스
@Service
public class BookmarkService implements IBookmarkService {

	@Autowired
	private IBookmarkRepository bookmarkRepository;		// repository 객체 주입
	
	// 북마크 추가
	@Override
	@Transactional
	public void insertBookmark(BookmarkVO bookmarkVO) throws Exception {
		int check = bookmarkRepository.insertBookmark(bookmarkVO);
		if(check != 1) {
			throw new Exception("북마크 추가에 실패했습니다.");
		}
	}

	// 북마크 취소
	@Override
	@Transactional
	public void deleteBookmark(int bookmarkCode, int memberCode) throws Exception {
		int check = bookmarkRepository.deleteBookmark(bookmarkCode, memberCode);
		if(check != 1) {
			throw new Exception("북마크 취소에 실패했습니다.");
		}
	}

	// 북마크 여부 확인
	@Override
	public BookmarkVO selectBookmark(int memberCode, int festivalCode) {
		return bookmarkRepository.selectBookmark(memberCode, festivalCode);
	}

	// 내 북마크 목록 조회
	@Override
	public List<BookmarkVO> selectBookmarkList(int memberCode) {
		return bookmarkRepository.selectBookmarkList(memberCode);
	}

}
