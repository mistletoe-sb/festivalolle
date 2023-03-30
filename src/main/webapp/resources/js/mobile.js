/**
 * 모바일(사용자) 화면에서 사용하는 js파일
 */
$(document).ready(function(){
	$('.page_title > p').text($('title').text());		// 페이지 제목을 top메뉴에 출력
	
	// bottom메뉴 클릭 시 누른 듯한 효과 부여(mousedown/mouseup, touchstart/touchend)
	$('.bottom_menu>div').on('mousedown', function(){
		$(this).css('box-shadow', '3px 3px 2px 1px #0000001A inset');
	});
	$('.bottom_menu>div').on('mouseup', function(){
		$(this).css('box-shadow', 'none');
	});
	$('.bottom_menu>div').on('touchstart', function(){
		$(this).css('box-shadow', '3px 3px 2px 1px #0000001A inset');
	});
	$('.bottom_menu>div').on('touchend', function(){
		$(this).css('box-shadow', 'none');
	});
	
	// top메뉴 검색 버튼 이벤트
	$('#search_btn').on('click', function(){
		$('.normal_top').attr("hidden", true);
		$('.search_top').attr("hidden", false);
	});
	$('.search_close').on('click', function(){
		$('.search_top').attr("hidden", true);
		$('.normal_top').attr("hidden", false);
	});
});
