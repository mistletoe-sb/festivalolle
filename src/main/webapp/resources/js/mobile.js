/**
 * 모바일(사용자) 화면에서 사용하는 js파일
 */
$(document).ready(function(){
	var root = $('#rootContext').val();					// context root
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
	
	// 페이지 내 이동 이벤트 바인딩
	moveToIndex();
	
	// 축제 일정 화면 각 주차 별 목록 보기 이벤트 바인딩
	calendar_event();
	
	// 축제 일정 조회 Ajax
	// 월 선택
	$('#select_month').on('change', function(){
		var month = $('#select_month').val();
		// AJAX 호출
		$.ajax({
			url: './calendar/select', 		// 요청 URL
			type: 'GET', 					// GET 방식으로 요청
			data: { month: month }, 		// 서버로 보낼 데이터
			dataType: 'json',
			success: function(data) {
				// 응답 데이터 분류
				var locationList = data.locationList;	// 선택한 월에 축제가 있는 지역 목록
				var weekData = data.weekData;			// 각 주차별 축제 목록(Map<Integer, List<FestivalMainVO>>)
				if(locationList != null){
					$('#select_location').empty();		// 데이터 출력할 요소 비우기
					// 지역 목록 출력
					$("#select_location").append('<option value="전체" selected>전체</option>');
					$.each(locationList, function(index, item) {
						$("#select_location").append('<option value="' + item + '">' + item + '</option>');
					});
				}
				$('#calendar_list_layout').empty();		// 데이터 출력할 요소 비우기
				// 각 주차 별 축제 목록 출력
				$('#calendar_list_layout').append(printCalendar(month, weekData, root));
				// 이벤트 바인딩
				calendar_event();
			},
			error: function() {
				// AJAX 요청이 실패한 경우 에러 처리
				alert('데이터를 불러오는데 실패했습니다.');
			}
		});
	});
	// 지역 선택
	$('#select_location').on('change', function(){
		var month = $('#select_month').val();
		var location = $('#select_location').val();
		// AJAX 호출
		$.ajax({
			url: './calendar/select', 		// 요청 URL
			type: 'GET', 					// GET 방식으로 요청
			data: { month: month, 
					location: location}, 	// 서버로 보낼 데이터
			dataType: 'json',
			success: function(data) {
				// 응답 데이터 분류
				var weekData = data.weekData;			// 각 주차별 축제 목록(Map<Integer, List<FestivalMainVO>>)
				$('#calendar_list_layout').empty();		// 데이터 출력할 요소 비우기
				// 각 주차 별 축제 목록 출력
				$('#calendar_list_layout').append(printCalendar(month, weekData, root));
				// 이벤트 바인딩
				calendar_event();
			},
			error: function() {
				// AJAX 요청이 실패한 경우 에러 처리
				alert('데이터를 불러오는데 실패했습니다.');
			}
		});
	});
	
	// 입장권 구매 모달 창 이벤트 바인딩
	// 모달 창 close
	$('.fadeout_bottom_click').on('click', function(){
		$('.ticket_modal_layout').css('animation', 'fadeout_tobottom 1s ease-out');
		$('.ticket_modal_layout').css('bottom', '-55vmax');
		$('#headCount').val('');
		$('#paymentAmount').text('');
	});
	// 모달 창 open
	$('#ticketModal').on('click', function(){
		$('.ticket_modal_layout').css('animation', 'fadein_frombottom 1s ease-out');
		$('.ticket_modal_layout').css('bottom', '8vmax');
		$('#headCount').val('1');
		$('#paymentAmount').text($('#ticketFee').text());
	});
	// 결제금액 계산
	$('#headCount').on('input', function(){
		$('#paymentAmount').text($('#headCount').val() * $('#ticketFee').text());
	});
});

// 축제 일정 화면 각 주차 별 목록 보기 이벤트 바인딩
function calendar_event(){
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
}

// 카드 형식(세로) 축제 정보 레이아웃 요소 생성
function printFestivalCard(fes, pageRoot){
	var appendHTML = '<div class="festival_card_container" onclick="location.href=';
	appendHTML += "'" + pageRoot + '/festival/info?festivalCode=' + fes.festivalCode + "'" + '">';
	appendHTML += '<div class="card">';
	appendHTML += '<div class="ratio">';
	if(fes.fileName != null && fes.fileName != ""){
		appendHTML += '<img src="' + pageRoot + '/resources/img/' + fes.fileName + '" class="card-img-top" alt="image">';
	}else{
		appendHTML += '<img src="' + pageRoot + '/resources/img/festest3.jpg" class="card-img-top" alt="기본 썸네일">';
	}
	appendHTML += '</div>';
	appendHTML += '<div class="card-body">';
	appendHTML += '<div class="festival_location">';
	appendHTML += '<p class="card-text">' + fes.stateName + ' ' + fes.cityName + '</p></div>';
	appendHTML += '<div class="icon_layout rating_img">';
	appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon.png" alt="평점">';
	appendHTML += '</div>';
	appendHTML += '<div class="icon_layout rating_txt">';
	appendHTML += '<p class="card-text">' + fes.rating + '</p>';
	appendHTML += '</div></div></div></div>';
	
	return appendHTML;
}

// 주차 별 축제 일정 정보 레이아웃 요소 생성
function printCalendar(month, weekData, pageRoot){
	var appendHTML = '';
	$.each(weekData, function(index, item) {
		if(index == 1){
			appendHTML += '<input class="folding_active" type="hidden" value="active">';
		}else{
			appendHTML += '<input class="folding_active" type="hidden" value="hide">';
		}
		appendHTML += '<div class="week_bar">';
		appendHTML += '<h3>' + month + '월 ' + index + '주</h3>';
		appendHTML += '</div>';
		if(index == 1){
			appendHTML += '<div class="default_list_layout folding_space">';
		}else{
			appendHTML += '<div class="default_list_layout folding_space" hidden="true">';
		}
		$.each(item, function(i, fes) {
			appendHTML += printFestivalCard(fes, pageRoot);
		});
		appendHTML += '</div>';
	});
	return appendHTML;
}

// 페이지 내 특정 위치로 이동(축제 상세 정보 화면)
function moveToIndex(){
	var margin_space = $(window).height()*0.13;
	$('.menuIndex').click(function(){
		var offset = $('#menu').offset(); //선택한 태그의 위치를 반환
        $('html').animate({scrollTop : offset.top - margin_space}, 0);
	});
	$('.infoIndex').click(function(){
		var offset = $('#info').offset(); //선택한 태그의 위치를 반환
        $('html').animate({scrollTop : offset.top - margin_space}, 0);
	});
	$('.foodIndex').click(function(){
		var offset = $('#food').offset(); //선택한 태그의 위치를 반환
        $('html').animate({scrollTop : offset.top - margin_space}, 0);
	});
	$('.reviewIndex').click(function(){
		var offset = $('#review').offset(); //선택한 태그의 위치를 반환
        $('html').animate({scrollTop : offset.top - margin_space}, 0);
	});
}