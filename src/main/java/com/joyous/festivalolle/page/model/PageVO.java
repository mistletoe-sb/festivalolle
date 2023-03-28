package com.joyous.festivalolle.page.model;

public class PageVO {
	
	private int pageNum;						// 현재 페이지
	
	private int pageSize;						// 페이지당 수량
	
	private int size ;							// 현재 페이지 수
	
	private long startRow;						// 현재 페이지의 첫 번째 요소가 데이터베이스에 있는 줄 번호
	
	private long endRow;						// 현재 페이지의 마지막 요소가 데이터베이스에 있는 줄 번호
	
	private int pages;							// 전체 페이지 수
	
	private int prePage;						// 이전 페이지
	
	private int nextPage;						// 다음 페이지
	
	private boolean isFirstPage = false;		// 첫 페이지인지 여부
	
	private boolean isLastPage = false;			// 마지막 페이지인지 여부
	
	private boolean hasPreviousPage = false;	// 이전 페이지가 있는지 여부
	
	private boolean hasNextPage = false;		// 다음 페이지가 있는지 여부
	
	private int navigatePages;					// 내비게이션 페이지 번호
	
	private int [ ] navigatepageNums;			// 모든 내비게이션 페이지 번호
	
	private int navigateFirstPage;  			// 내비게이션 바의 첫 페이지
		
	private int navigateLastPage;			//내비게이션 바의 마지막 페이지
}

