package com.joyous.festivalolle.bookmark.model;

import lombok.Data;

// 북마크 VO
@Data
public class BookmarkVO {
	private int bookmarkCode;	// 북마크 코드
	private int memberCode;		// 회원 코드
	private int festivalCode;	// 축제 코드
}
