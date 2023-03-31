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
		$('.normal_top').attr('hidden', true);
		$('.search_top').attr('hidden', false);
	});
	$('.search_close').on('click', function(){
		$('.search_top').attr('hidden', true);
		$('.normal_top').attr('hidden', false);
	});
	
	$('.folding_active[value="hide"]').next().css('margin-bottom', '1.5vh');
	// 주차별 목록 표시/숨김
	$('.week_bar').on('click', function(){
		if($('.folding_active[value="active"]').next().get(0) == $(this).get(0)){
			$(this).css('margin-bottom', '1.5vh');
			$(this).next().attr('hidden', true);
			$(this).prev().val('hide');
		} else{
			$('.folding_active[value="active"]').next().css('margin-bottom', '1.5vh');
			$('.folding_active[value="active"]').next().next().attr('hidden', true);
			$('.folding_active[value="active"]').val('hide');
			$(this).next().attr('hidden', false);
			$(this).css('margin-bottom', '4.05vh');
			$(this).prev().val('active');
		}
	});
	
	// 축제 일정 조회 Ajax
	// 월 선택
	$('#select_month').on('change', function(){
		
		// AJAX 호출
		$.ajax({
			url: './select', 				// 요청 URL
			type: 'GET', 					// GET 방식으로 요청
			data: { month: titleyear }, 	// 서버로 보낼 데이터
			dataType: 'json',
			success: function(data) {
				// 응답 데이터 분류
				var locationList = data.locationList;	// 선택한 월에 축제가 있는 지역 목록
				var weekData = data.weekData;			// 각 주차별 축제 목록(Map<Integer, List<FestivalMainVO>>)
				if(locationList != null){
					$('#select_location').empty();		// 데이터 출력할 요소 비우기
					$("#select_location").append('<option value="전체" selected>전체</option>');
					$.each(locationList, function(index, item) {
						$("#select_location").append('<option value="' + item + '">' + item + '</option>');
					});
				}
				$('#calendar_list_layout').empty();
				$.each(weekData, function(index, item) {
					$("#select_location").append('<option value="' + item + '">' + item + '</option>');
				});
			},
			error: function() {
				// AJAX 요청이 실패한 경우 에러 처리
				alert('데이터를 불러오는데 실패했습니다.');
			}
		});
	});
	// 지역 선택
});

function setWeekData(){
	$("#titleList").empty();
	var titleyear = $(this).val();
}
