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
	
	// 축제 일정 조회 Ajax(요소 존재 시 이벤트 바인딩)
	if($('#select_month').length){
		// 월 선택
		$('#select_month').on('change', function(){
			var month = $('#select_month').val();
			// AJAX 호출
			$.ajax({
				url: './calendar/select', 		// 요청 URL
				type: 'GET', 					// GET 방식으로 요청
				async: false,					// 동기 처리
				data: { month: month }, 		// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data) {
					// 응답 데이터 분류
					var locationList = data.locationList;		// 선택한 월에 축제가 있는 지역 목록
					var weekData = data.weekData;				// 각 주차별 축제 목록(Map<Integer, List<FestivalMainVO>>)
					var weekDataImages = data.weekDataImages;	// 각 주차별 축제 이미지 목록(Map<Integer, String[]>)
					if(locationList != null){
						$('#select_location').empty();			// 데이터 출력할 요소 비우기
						// 지역 목록 출력
						$("#select_location").append('<option value="전체" selected>전체</option>');
						$.each(locationList, function(index, item) {
							$("#select_location").append('<option value="' + item + '">' + item + '</option>');
						});
					}
					$('#calendar_list_layout').empty();		// 데이터 출력할 요소 비우기
					// 각 주차 별 축제 목록 출력
					$('#calendar_list_layout').append(printCalendar(month, weekData, weekDataImages, root));
					// 이벤트 바인딩
					calendar_event();
				},
				error: function() {
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
				}
			});
		});
	}
	if($('#select_month').length){
		// 지역 선택
		$('#select_location').on('change', function(){
			var month = $('#select_month').val();
			var location = $('#select_location').val();
			// AJAX 호출
			$.ajax({
				url: './calendar/select', 		// 요청 URL
				type: 'GET', 					// GET 방식으로 요청
				data: { month: month, 
						location: location }, 	// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data) {
					// 응답 데이터 분류
					var weekData = data.weekData;				// 각 주차별 축제 목록(Map<Integer, List<FestivalMainVO>>)
					var weekDataImages = data.weekDataImages;	// 각 주차별 축제 이미지 목록(Map<Integer, String[]>)
					$('#calendar_list_layout').empty();			// 데이터 출력할 요소 비우기
					// 각 주차 별 축제 목록 출력
					$('#calendar_list_layout').append(printCalendar(month, weekData, weekDataImages, root));
					// 이벤트 바인딩
					calendar_event();
				},
				error: function() {
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
				}
			});
		});
	}
	
	// 상세 정보 북마크 초기 설정
	if($('.bookmark_img').length){
		if($('.bookmark_img').length == 1){
			var fesNum = $('.fes_code').val();
			requestCheckBookmark(fesNum, root);
			requestChangeBookmark(root);
		}else{
			
		}
	}
	
	// 입장권 구매 모달 창 이벤트 바인딩
	if($('.ticket_modal_layout').length){
		// 모달 창 close
		$('.fadeout_bottom_click').on('click', function(){
			$('.ticket_modal_layout').css('animation', 'fadeout_tobottom 1s ease-out');
			$('.ticket_modal_layout').css('bottom', '-55vmax');
			$('#headCount').val('');
			$('#paymentAmount').text('');
			$(document).off('mouseup touchend');
		});
		// 모달 창 open
		$('#ticketModal').on('click', function(){
			$('.ticket_modal_layout').css('animation', 'fadein_frombottom 1s ease-out');
			$('.ticket_modal_layout').css('bottom', '8vmax');
			$('#headCount').val('1');
			$('#paymentAmount').text($('#fee').val());
			$('#headCount').focus();
			$(document).on('mouseup touchend', function (e){
				var container = $('.ticket_modal_layout');
				if(container.has(e.target).length === 0){
					$('.fadeout_bottom_click').click();
				}
			});
		});
		// 결제금액 계산
		$('#headCount').on('input', function(){
			/*var inputPattern1 = /^\d{1}$/
			var inputPattern2 = /^\d{2}$/
			var headCount = $('#headCount').val();
			if(!inputPattern1.test(headCount)||!inputPattern2.test(headCount)||headCount == 0){
				$('#headCount').val('');
			}*/
			$('#paymentAmount').text($('#headCount').val() * $('#fee').val());
		});
		// 입장권 생성
		$('#ticket_submit').on('click', function(){
			$('#ticketInsert').submit();
		});		
	}
	
	// id가 my_review인 요소가 존재할 경우 동작
	if($('#my_review').length){
		// 내 리뷰 요청 & 출력
		requestMyReview(root);
	}
	
	// 축제 리뷰 초기 로딩
	if($('.review_list_layout').length){
		var isReviewAlreadyInitLoad = false;
		$(window).on('scroll',function() {
			if(checkVisible($('#review')) && !isReviewAlreadyInitLoad) {
				var festivalCode = $('input[name="festivalCode"]').val();
				// AJAX 호출
				$.ajax({
					url: '../review/list', 					// 요청 URL
					type: 'GET', 							// GET 방식으로 요청
					data: { festivalCode: festivalCode },	// 서버로 보낼 데이터
					dataType: 'json',
					success: function(data) {
						// 리뷰 목록 출력
						$('.review_list_layout').append(printReviewList(data, root));
						// 이벤트 바인딩
						review_btn_event(root);
					},
					error: function() {
						// AJAX 요청이 실패한 경우 에러 처리
						console.log('데이터를 불러오는데 실패했습니다.');
					}
				});
				isReviewAlreadyInitLoad = true;
			}
		});		
	}
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
function printFestivalCard(fes, img, pageRoot){
	var appendHTML = '<div class="festival_card_container" onclick="location.href=';
	appendHTML += "'" + pageRoot + '/festival/info?festivalCode=' + fes.festivalCode + "'" + '">';
	appendHTML += '<div class="card">';
	appendHTML += '<div class="ratio">';
	if(img != null){
		appendHTML += '<img src="data:image:jpg;base64,' + img + '" class="card-img-top" alt="loading failed">';
	}else{
		appendHTML += '<img src="' + pageRoot + '/resources/img/festest3.jpg" class="card-img-top" alt="no image">';
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
function printCalendar(month, weekData, weekDataImages, pageRoot){
	var appendHTML = '';
	$.each(weekData, function(index, item){
		var images = weekDataImages[index];
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
		$.each(item, function(i, fes){
			appendHTML += printFestivalCard(fes, images[i], pageRoot);
		});
		appendHTML += '</div>';
	});
	return appendHTML;
}

// 북마크 여부 확인 요청
function requestCheckBookmark(festivalCode, pageRoot){
	// AJAX 호출
	$.ajax({
		url: '../bookmark/check', 	// 요청 URL
		type: 'GET', 				// GET 방식으로 요청
		data: { festivalCode: festivalCode },	// 서버로 보낼 데이터
		dataType: 'json',
		success: function(data) {
			var dataStat = data.dataStat;
			var bookmarkVO = data.bookmarkVO;
			var isBookmark = false;
			ajaxResponseExecuteFull(dataStat,
				function(){
					// NORMAL_TRUE 시
					console.log('북마크 된 축제');
					isBookmark = true;
				},
				function(){
					// NORMAL_FALSE 시
					console.log('북마크 안 된 축제');
					isBookmark = false;
				},
				function(){
					// ERROR 시
					console.log('북마크 조회에 실패했습니다.');
					isBookmark = false;
				},
				function(){
					// NOT_SESSION 시
					console.log('session not found');
					isBookmark = false;
				}
			);
			var selectorEl = '.fes_code[value="'+festivalCode+'"]';
			if(isBookmark){
				$(selectorEl).prev().attr('src', pageRoot + '/resources/img/icon/bookmark_icon.png');
				$(selectorEl).after('<input type="hidden" class="bookmark_code" value="' + bookmarkVO.bookmarkCode +'">');
			}else{
				$(selectorEl).prev().attr('src', pageRoot + '/resources/img/icon/bookmark_icon_empty.png');						
			}
			
		},
		error: function() {
			// AJAX 요청이 실패한 경우 에러 처리
			console.log('데이터를 불러오는데 실패했습니다.');
		}
	});
}

// 북마크 추가, 취소 이벤트 바인딩 함수
function requestChangeBookmark(pageRoot){
	$('.bookmarkAction').on('click', function(){
		if($(this).children('.bookmark_code').length){
			var bookmarkCode = $(this).children('.bookmark_code').val();
			// 북마크 된 상태이면 북마크 취소 실행
			$.ajax({
				url: '../bookmark/delete', 	// 요청 URL
				type: 'POST', 				// POST 방식으로 요청
				async: false,				// 동기 처리
				data: { bookmarkCode: bookmarkCode },	// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data) {
					ajaxResponseExecuteTriple(data,
						function(){
							// NORMAL_TRUE 시
							console.log('북마크 취소 완료');
							$(this).children('.bookmark_code').remove();	// 요소 제거
							$(this).children('.bookmark_img').attr('src', pageRoot + '/resources/img/icon/bookmark_icon_empty.png');
						}.bind(this),
						function(){
							// ERROR 시
							console.log('북마크 취소 실패');
						},
						function(){
							// NOT_SESSION 시
							console.log('session not found');
							location.replace(pageRoot + '/login');	// 로그인 페이지로 리다이렉트
						}
					);
				}.bind(this),
				error: function() {
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
				}
			});
		}else{
			// 북마크 안 된 상태이면 북마크 추가 실행
			var festivalCode = $(this).children('.fes_code').val();
			$.ajax({
				url: '../bookmark/insert', 	// 요청 URL
				type: 'POST', 				// POST 방식으로 요청
				async: false,				// 동기 처리
				data: { festivalCode: festivalCode },	// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data) {
					ajaxResponseExecuteFull(data,
						function(){
							// NORMAL_TRUE 시
							console.log('북마크 추가 완료');
							requestCheckBookmark(festivalCode, pageRoot)
						},
						function(){
							// NORMAL_FALSE 시
							console.log('이미 북마크 추가된 북마크입니다.');
						},
						function(){
							// ERROR 시
							console.log('북마크 추가 실패');
						},
						function(){
							// NOT_SESSION 시
							console.log('session not found');
							location.replace(pageRoot + '/login');	// 로그인 페이지로 리다이렉트
						}
					);
				},
				error: function() {
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
				}
			});
		}
	});
}

// 내 리뷰 정보 Ajax 요청 함수
function requestMyReview(pageRoot){
	var festivalCode = $('input[name="festivalCode"]').val();
	// AJAX 호출
	$.ajax({
		url: '../review/myreview', 				// 요청 URL
		type: 'GET', 							// GET 방식으로 요청
		data: { festivalCode: festivalCode },	// 서버로 보낼 데이터
		dataType: 'json',
		success: function(data) {
			$('#my_review').empty();			// 요소 비우기
			// 리뷰 목록 출력
			$('#my_review').append(printMyReview(data, pageRoot));
			review_btn_event(pageRoot);
		},
		error: function() {
			// AJAX 요청이 실패한 경우 에러 처리
			console.log('데이터를 불러오는데 실패했습니다.');
		}
	});
}

// 내 리뷰 레이아웃 요소 생성
function printMyReview(myReview, pageRoot){
	var appendHTML = '<div class="review_card_container">';
	appendHTML += '<div class="card">';
	appendHTML += '<div class="card-body">';
	appendHTML += '<div class="review_body">';
	if(myReview.festivalReviewCode == -1){	// 축제 리뷰 코드가 -1인 경우(= 축제 입장권을 구매하지 않은 경우 > 리뷰 작성 불가)
		appendHTML += '<div class="multi_line_text">';
		appendHTML += '<textarea placeholder="축제 입장권 구매 후 작성 가능합니다."></textarea>';
		appendHTML += '</div>';
		appendHTML += '</div>';
		appendHTML += '<div class="review_btn_layout"><p class="card-text goto_ticket">등록</p>';
	}else{
		if(myReview.festivalReviewCode == 0){	// myReview의 축제 리뷰 코드가 0인 경우(= 작성한 리뷰가 없는 상태)
			appendHTML += '<div class="rating_layout">';
			for(var i = 1; i <= 5; i++){
				appendHTML += '<div class="icon_layout rating_img rating_clickable">';
				appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon_empty.png" alt="' + i + '">';
				appendHTML += '</div>';
			}
			appendHTML += '</div>';
			appendHTML += '<div class="multi_line_text">';
			appendHTML += '<textarea placeholder="리뷰를 작성해주세요."></textarea>';
			appendHTML += '</div>';
			appendHTML += '</div>';
			appendHTML += '<div class="review_btn_layout"><p class="card-text insert_review">등록</p>';
		}else{		// 작성한 리뷰가 있는 상태 > 표시
			appendHTML += '<div><p class="card-text">내가 쓴 리뷰</p></div>';
			appendHTML += '<div class="rating_layout">';
			for(var i = 1; i <= myReview.rating; i++){
				appendHTML += '<div class="icon_layout rating_img">';
				appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon.png" alt="' + i + '">';
				appendHTML += '</div>';
			}
			for(var j = myReview.rating + 1; j <= 5; j++){
				appendHTML += '<div class="icon_layout rating_img">';
				appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon_empty.png" alt="' + j + '">';
				appendHTML += '</div>';
			}
			appendHTML += '</div>';		
			appendHTML += '<div class="multi_line_text"><p>' + myReview.content + '</p></div>';
			appendHTML += '</div>';
			appendHTML += '<div class="review_btn_layout"><p class="card-text delete_review">삭제</p>';		
		}
	}
	appendHTML += '<input type="hidden" value="' + myReview.festivalReviewCode + '">';
	appendHTML += '</div></div></div></div>';
	
	return appendHTML;
}

// 리뷰 목록 레이아웃 요소 생성
function printReviewList(reviewList, pageRoot){
	var appendHTML = '';
	$.each(reviewList, function(index, item){
		appendHTML += '<div class="review_card_container">';
		appendHTML += '<div class="card">';
		appendHTML += '<div class="card-body">';
		appendHTML += '<div class="review_body">';
		appendHTML += '<div><p class="card-text">' + item.id + '</p></div>';
		appendHTML += '<div class="rating_layout">';
		for(var i = 1; i <= item.rating; i++){
			appendHTML += '<div class="icon_layout rating_img">';
			appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon.png" alt="' + i + '">';
			appendHTML += '</div>';
		}
		for(var j = item.rating + 1; j <= 5; j++){
			appendHTML += '<div class="icon_layout rating_img">';
			appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon_empty.png" alt="' + j + '">';
			appendHTML += '</div>';
		}
		appendHTML += '</div>';
		appendHTML += '<div class="multi_line_text"><p>' + item.content + '</p></div>';
		appendHTML += '</div>';
		appendHTML += '<div class="review_btn_layout"><p class="card-text report_review">신고</p>';
		appendHTML += '<input type="hidden" value="' + item.festivalReviewCode + '">';
		appendHTML += '</div></div></div></div>';
	});
	return appendHTML;
}

// 리뷰 카드 내 버튼 이벤트 등록
function review_btn_event(pageRoot){
	// 로그인 하지 않은 상태에서 등록 버튼 클릭 시
	if($('.review_login').length){
		$('.review_login').off('click').on('click', function(){
			location.href = pageRoot + '/login';	// 로그인 페이지로 이동
		});
	}
	// 입장권 구매하지 않은 상태에서 등록 버튼 클릭 시
	if($('.goto_ticket').length){
		$('.goto_ticket').off('click').on('click', function(){
			$('.menuIndex').click();	// 입장권 구매 위치로 스크롤 이동
		});
	}
	// 정상적인 리뷰 등록 이벤트
	if($('.insert_review').length){
		$('.insert_review').off('click').on('click', function(){
			var festivalCode = $('input[name="festivalCode"]').val();
			var content = $('#my_review textarea').val();
			var rating = $('.rating_check').length;
			// post 요청할 데이터 JSON 타입으로 가공
			var param = {'festivalCode':festivalCode,'content':content,'rating':rating };
			// AJAX 호출
			$.ajax({
				url: '../review/insert', 			// 요청 URL
				type: 'POST', 						// POST 방식으로 요청
				async: false,						// 동기 처리
				contentType: 'application/json',
				data: JSON.stringify(param),		// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data) {
					if(data){
						alert('등록이 완료되었습니다.');
						requestMyReview(pageRoot);		// 내 리뷰 다시 조회(Ajax 요청)
					}else{
						console.log('리뷰 등록에 실패했습니다.');
					}
				},
				error: function() {
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
				}
			});
		});
	}
	// 리뷰 신고 시 이벤트
	if($('.report_review').length){
		$('.report_review').off('click').on('click', function(){
			var festivalReviewCode = $(this).next().val();
			// AJAX 호출
			$.ajax({
				url: '../review/report', 	// 요청 URL
				type: 'POST', 				// POST 방식으로 요청
				async: false,				// 동기 처리
				data: { festivalReviewCode: festivalReviewCode },	// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data) {
					ajaxResponseExecuteTriple(data,
						function(){
							// NORMAL_TRUE 시
							alert('신고 처리되었습니다.');
							$(this).closest('.review_card_container').remove();		// 해당 리뷰 숨김
						}.bind(this),
						function(){
							// ERROR 시
							console.log('신고 처리에 실패했습니다.');
						},
						function(){
							// NOT_SESSION 시
							location.replace(pageRoot + '/login');	// 로그인 페이지로 리다이렉트
						}
					);
				}.bind(this),
				error: function() {
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
				}
			});
		});
	}
	// 리뷰 삭제 시
	if($('.delete_review').length){
		$('.delete_review').off('click').on('click', function(){
			var festivalReviewCode = $(this).next().val();
			// AJAX 호출
			$.ajax({
				url: '../review/delete', 	// 요청 URL
				type: 'POST', 				// POST 방식으로 요청
				async: false,				// 동기 처리
				data: { festivalReviewCode: festivalReviewCode },	// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data) {
					if(data){
						alert('삭제가 완료되었습니다.');
						requestMyReview(pageRoot);		// 내 리뷰 다시 조회(Ajax 요청)
					}else{
						console.log('리뷰 삭제에 실패했습니다.');
					}
				},
				error: function() {
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
				}
			});
		});
	}
	// 평점 부여 이벤트
	if($('.rating_clickable').length){
		$('.rating_clickable').off('click').on('click', function(){
			$(this).prevAll().children('img').attr('src', pageRoot + '/resources/img/icon/rating_icon.png');
			$(this).prevAll().children('img').attr('class', 'rating_check');
			$(this).children('img').attr('src', pageRoot + '/resources/img/icon/rating_icon.png');
			$(this).children('img').attr('class', 'rating_check');
			$(this).nextAll().children('img').attr('src', pageRoot + '/resources/img/icon/rating_icon_empty.png');
			$(this).nextAll().children('img').attr('class', '');
		});
	}
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

// 해당 요소가 화면에 보이는지 확인
function checkVisible(checkElement){
	var viewportHeight = $(window).height();	// Viewport Height
	var scrolltop = $(window).scrollTop();		// Scroll Top
	var y = $(checkElement).offset().top;				// Element Top
	var elementHeight = $(checkElement).height();		// Element Height
    
    return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
}

// Ajax 응답 데이터에 따라 선택적으로 함수 실행하는 함수
function ajaxResponseExecuteFull(data, trueCallback, falseCallback, errorCallback, notSessionCallback){
	switch(data){
		case 'NORMAL_TRUE':
			trueCallback();
			break;
		case 'NORMAL_FALSE':
			falseCallback();
			break;
		case 'ERROR':
			errorCallback();
			break;
		case 'NOT_SESSION':
			notSessionCallback();
			break;
	}
}
// Ajax 응답 데이터에 따라 선택적으로 함수 실행하는 함수
function ajaxResponseExecuteTriple(data, trueCallback, errorCallback, notSessionCallback){
	switch(data){
		case 'NORMAL_TRUE':
			trueCallback();
			break;
		case 'ERROR':
			errorCallback();
			break;
		case 'NOT_SESSION':
			notSessionCallback();
			break;
	}
}
// Ajax 응답 데이터에 따라 선택적으로 함수 실행하는 함수
function ajaxResponseExecuteDual(data, trueCallback, falseCallback){
	switch(data){
		case 'NORMAL_TRUE':
			trueCallback();
			break;
		case 'NORMAL_FALSE':
			falseCallback();
			break;
	}
}