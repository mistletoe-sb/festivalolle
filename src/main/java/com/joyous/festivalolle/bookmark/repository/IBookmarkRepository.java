package com.joyous.festivalolle.bookmark.repository;

import org.apache.ibatis.annotations.Param;

import com.joyous.festivalolle.bookmark.model.BookmarkVO;

// 북마크 repository 인터페이스
public interface IBookmarkRepository {
	int insertBookmark(BookmarkVO bookmarkVO);				// 북마크 추가
	int deleteBookmark(@Param("bookmarkCode") int bookmarkCode,
					@Param("memberCode") int memberCode);	// 북마크 제거
	BookmarkVO selectBookmark(@Param("bookmarkCode") int bookmarkCode,
							@Param("memberCode") int memberCode);	// 북마크 여부 조회
}
