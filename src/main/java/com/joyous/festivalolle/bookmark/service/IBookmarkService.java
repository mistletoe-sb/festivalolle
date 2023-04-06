package com.joyous.festivalolle.bookmark.service;

import java.util.List;

import com.joyous.festivalolle.bookmark.model.BookmarkVO;

// 북마크 service 인터페이스
public interface IBookmarkService {
	void insertBookmark(BookmarkVO bookmarkVO) throws Exception;				// 북마크 추가
	void deleteBookmark(int bookmarkCode, int memberCode) throws Exception;		// 북마크 취소
	BookmarkVO selectBookmark(int memberCode, int festivalCode);				// 북마크 여부 확인
	List<BookmarkVO> selectBookmarkList(int memberCode);						// 내 북마크 목록 조회
}
