/**
 * 모바일(사용자) 화면에서 사용하는 js파일
 */
$(document).ready(function(){
	var root = $('#rootContext').val();			// context root
	var pageTitle = $('title').text();			// 페이지 타이틀
	$('.page_title > p').text(pageTitle);		// 페이지 제목을 top메뉴에 출력
	
	// 페이지 이동 시 로딩 시작
	$(window).on('beforeunload', function(){
		$('.loading_img').css('top', '0px');
		$('.loading_img').css('height', '100%');
		$('.loading_img').css('background-color', '#FFFFFF99');
		$('.loading_img').attr('hidden', false);		
		//$('html').scrollTop(0);
	});
	// 페이지 로드 완료 시 로딩 종료
	$(window).on('pageshow', function(){
		$('.loading_img').css('bottom', '8.5vmax');
		$('.loading_img').css('height', '5vmax');
		$('.loading_img').css('background-color', 'none');
		$('.loading_img').attr('hidden', true);
	});
	
	$('.bottom_menu>div').on('click', function(){
		if($('.selected_bottom_menu').length){
			$('.selected_bottom_menu').attr('class', '');
		}
		$(this).attr('class', 'selected_bottom_menu');
	});
	// bottom메뉴 클릭 시 누른 듯한 효과 부여(mousedown/mouseup, touchstart/touchend)
	/*$('.bottom_menu>div').on('mousedown', function(){
		//$(this).css('box-shadow', '3px 3px 2px 1px #0000001A inset');
		$(this).attr('class', 'selected_bottom_menu');
	});
	$('.bottom_menu>div').on('mouseup', function(){
		//$(this).css('box-shadow', 'none');
		$(this).attr('class', '');
	});
	$('.bottom_menu>div').on('touchstart', function(){
		//$(this).css('box-shadow', '3px 3px 2px 1px #0000001A inset');
		$(this).attr('class', 'selected_bottom_menu');
	});
	$('.bottom_menu>div').on('touchend', function(){
		//$(this).css('box-shadow', 'none');
		$(this).attr('class', '');
	});*/
	
	// top메뉴 검색 버튼 이벤트
	$('#search_btn').on('click', function(){
		$('.normal_top').attr('hidden', true);
		$('.search_box').css('animation', 'open_search 0.7s ease-out');
		$('.search_top').attr('hidden', false);
		setTimeout(function(){
			$('.search_input[name="keyword"]').focus();
		}, 700);
		$(document).on('mouseup touchend', function (e){
			var container = $('.top_menu');
			if(container.has(e.target).length === 0){
				$('.search_box').css('animation', 'close_search 0.7s ease-out');
				setTimeout(function(){
					$('.search_top').attr('hidden', true);			
					$('.normal_top').attr('hidden', false);
				}, 550);
			}
		});
	});
	$('#searchSubmit').on('click', function(e){
		e.preventDefault();
		console.log('empty keyword');
		if($.trim($('.search_input[name="keyword"]').val()) != ''){
			$('#searchForm').submit();
		}
	});
	// top메뉴 뒤로가기 버튼 이벤트 및 bottom 메뉴 클릭 효과 설정
	var isDefaultBack = true;
	switch(pageTitle){
		case '축제올래':
			isDefaultBack = false;
			$('#back_button').attr('hidden', true);
			$('#homeBtn').attr('class', 'selected_bottom_menu');
			break;
		case '축제일정':
			isDefaultBack = false;
			$('#back_button').attr('hidden', true);
			$('#calendarQuick').attr('class', 'selected_bottom_menu');
			break;
		case '입장권':
			$('#ticketQuick').attr('class', 'selected_bottom_menu');
			break;
		case '북마크':
			$('#bookmarkQuick').attr('class', 'selected_bottom_menu');
			break;
		case '로그인':
		case '마이페이지':
			$('#mypageQuick').attr('class', 'selected_bottom_menu');
			break;
		default:
			break;
	}
	if(isDefaultBack){
		$('#back_button').on('click', function(){
			history.back();				
		});		
	}
	
	// 페이지 내 이동 이벤트 바인딩
	if($('.index_menu')){
		moveToIndex();		
	}
	
	// 축제 일정 화면 이벤트 바인딩
	week_event(root);
	
	// 이미지 로드
	initImageLoad(root);
	
	// 메인 화면 카테고리별 축제 목록 출력(Ajax 요청)
	if($('.default_horizontal_layout>.category_title').length){
		// 출력할 카테고리 개수
		var categoryTitle = $('.default_horizontal_layout .category_title');
		$.each(categoryTitle, function(index, item){
			$(item).children().prepend('<div class="title_label"></div>');
			var category = index + 1;
			// AJAX 호출
			$.ajax({
				url: root + '/categorylist',	// 요청 URL
				type: 'GET', 					// GET 방식으로 요청
				data: {category: category},		// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data){
					// 응답 데이터 분류
					var fesList = data.fesList;		// 축제 목록
					//var fesImages = data.fesImages;	// 축제 이미지 목록
					if(data.dataStatus == 'NORMAL_TRUE'){	// 조회된 데이터가 있는 경우
						// 전체보기 클릭 시 이동할 URL(onclick 속성값)
						var onClickAttr = "location.href='" + root + '/festival/list?category=' + category + '&title=' + $(item).children().children('h3').text() + "'";
						// 카테고리 컨테이너 생성
						var appendHTML = '<div class="goto_list" onclick="' + onClickAttr + '">';
						appendHTML += '<div class="icon_layout"><p>더보기</p></div>';
						//appendHTML += '<div class="icon_layout"><img src="' + root + '/resources/img/icon/arrow.png" alt="goto"></div>';
						appendHTML += '<div class="icon_layout"><i class="fa-solid fa-angle-right"></i></div>';
						appendHTML += '</div>'
						$(item).append(appendHTML);
						var categoryContainer = '<div class="horizontal_container">';
						categoryContainer += '<div class="horizontal_empty"></div>';
						// 축제 목록
						$.each(fesList, function(i, fes){
							categoryContainer += printFestivalCard(fes, root);
						});
						categoryContainer += '<div class="goto_list horizontal_goto" onclick="' + onClickAttr + '">';
						categoryContainer += '<div class="icon_layout black_circle">';
						//categoryContainer += '<img src="' + root + '/resources/img/icon/arrow.png" alt="goto">';
						categoryContainer += '<i class="fa-solid fa-angle-right"></i>';
						categoryContainer += '</div>';
						categoryContainer += '<div class="icon_layout"><p>더보기</p></div></div></div>';
						$(item).after(categoryContainer);						
					}else{	// 조회된 데이터가 없는 경우
						var categoryContainer = '<div class="horizontal_container">';
						categoryContainer += '<div class="horizontal_empty"></div>';
						//categoryContainer += '<div><h4>축제가 없습니다.</h4></div></div>';
						categoryContainer += '<div class="no_result"><img src="' + root + '/resources/img/mobile/festival_none.png" alt="none"></div></div>';
						$(item).after(categoryContainer);
					}
					$.each(fesList, function(indexValue, fes){
						imageLoad(fes.festivalCode, root);
					});
				},
				error: function(){
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
				}
			});
		});
	}
	
	// 축제 일정 조회 Ajax(요소 존재 시 이벤트 바인딩)
	if($('#select_month').length){
		// 월 선택
		$('#select_month').on('change', function(){
			var month = $('#select_month').val();
			var periodStart = $('.selected_week~.week_start').val();
			var periodEnd = $('.selected_week~.week_end').val();
			// AJAX 호출
			$.ajax({
				url: root + '/festival/calendar/select',	// 요청 URL
				type: 'GET', 				// GET 방식으로 요청
				async: false,				// 동기 처리
				data: {month: month,
					   periodStart: periodStart,
					   periodEnd: periodEnd}, 		// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data){
					// 응답 데이터 분류
					var weekData = data.weekData;				// 주차 정보(주차 시작일, 종료일 >> LocalDate[][])
					var locationList = data.locationList;		// 선택한 월에 축제가 있는 지역 목록
					var fesList = data.fesList;					// 축제 목록
					//var fesImages = data.fesImages;				// 축제 이미지 목록
					if(locationList != null){
						// 데이터 출력할 요소 비우기
						$('#week_menu').empty();
						$('#select_location').empty();
						// 주차 정보 출력
						$.each(weekData, function(index, item){
							var appendHTML = '<div class="horizontal_menu_item">';
							if(index == 0){
								appendHTML += '<p class="selected_week">' + (index + 1) + '주차</p>'
							}else{
								appendHTML += '<p>' + (index + 1) + '주차</p>'								
							}
							appendHTML += '<input type="hidden" class="week_start" value="' + item[0] + '">'
							appendHTML += '<input type="hidden" class="week_end" value="' + item[1] + '">'
							appendHTML += '</div>'
							$('#week_menu').append(appendHTML);
						});
						// 지역 목록 출력
						$("#select_location").append('<option value="전국" selected>전국</option>');
						$.each(locationList, function(index, item){
							$("#select_location").append('<option value="' + item + '">' + item + '</option>');
						});
					}
					$('.default_list_2x_layout').empty();
					if(fesList.length == 0){
						var appendHTML = '<div class="no_result">';
						appendHTML += '<img src="' + root + '/resources/img/mobile/festival_none.png" alt="none"></div>';
						$('.default_list_2x_layout').append(appendHTML);
					}else{
						$.each(fesList, function(index, item){
							$('.default_list_2x_layout').append(printFestivalCard(item, root));
							imageLoad(item.festivalCode, root);
						});
					}
					// 이벤트 바인딩
					week_event(root);
				},
				error: function(){
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
			var periodStart = $('.selected_week~.week_start').val();
			var periodEnd = $('.selected_week~.week_end').val();
			// AJAX 호출
			$.ajax({
				url: root + '/festival/calendar/select', 	// 요청 URL
				type: 'GET', 								// GET 방식으로 요청
				data: {month: month, location: location,
					   periodStart: periodStart,
					   periodEnd: periodEnd}, 				// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data){
					// 응답 데이터 분류
					var fesList = data.fesList;					// 축제 목록
					//var fesImages = data.fesImages;				// 축제 이미지 목록
					$('.default_list_2x_layout').empty();
					if(fesList.length == 0){
						var appendHTML = '<div class="no_result">';
						appendHTML += '<img src="' + root + '/resources/img/mobile/festival_none.png" alt="none"></div>';
						$('.default_list_2x_layout').append(appendHTML);
					}else{
						$.each(fesList, function(index, item){
							$('.default_list_2x_layout').append(printFestivalCard(item, root));
							imageLoad(item.festivalCode, root);
						});
					}
				},
				error: function(){
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
		}
	}
	// 북마크 목록 초기 설정
	if($('title').text() == '북마크'){
		var fesCard = $('.festival_card_container');
		// 각 축제마다 북마크 이미지 삽입
		$.each(fesCard, function(index, item){
			var fesNum = $(item).children('.festival_code').val();
			printBookmark(fesNum, item, root);
		});
		requestChangeBookmark(root);
	}
	
	// 입장권 구매 모달 창 이벤트 바인딩
	if($('.ticket_modal_layout').length){
		// 구매 모달 창 닫는 함수 정의
		function closeModal(){
			$('.ticket_modal_layout').css('animation', 'fadeout_tobottom 1s ease-out');
			$('.ticket_modal_layout').css('bottom', '-55vmax');
			$('#headCount').val('');
			$('#paymentAmount').text('');
			$(document).off('mouseup touchend');
		}
		// 모달 창 close
		$('.fadeout_bottom_click').on('click', function(){
			closeModal();
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
					closeModal();
				}
			});
		});
		// 결제금액 계산
		$('#headCount').on('keyup', function(){
			var inputValue = $('#headCount').val();	// 입력된 값
			if(!(/^\d$/.test(inputValue))){	// 입력값이 숫자가 아니면
				$('#headCount').val(inputValue.replace(/[^0-9]/g, ''));	// 숫자가 아닌 값 제거
			}
			if(inputValue == ''){
				$('#headCountHint').text('입장인원은 1~99명까지 입력 가능합니다.');
			}else{
				var inputNum = parseInt(inputValue);
				// 입력값이 범위 밖인 경우 알림 & 값 변경
				if(inputNum >= 100){
					$('#headCountHint').text('입장인원은 1~99명까지 입력 가능합니다.');
					$('#headCount').val(99);
				}else if(inputNum <= 0){
					$('#headCountHint').text('입장인원은 1~99명까지 입력 가능합니다.');
					$('#headCount').val(0);					
				}else{	// 입력값이 범위 내인 경우 알림 지우기
					$('#headCountHint').text('');
				}				
			}
			$('#paymentAmount').text($('#headCount').val() * $('#fee').val());
		});
		// 입장권 생성
		$('#ticket_submit').on('click', function(){
			var inputValue = $('#headCount').val();	// 입력된 값
			var status = $('#fes_status>button').attr('id').replace('fesStat_','');
			//console.log(status);
			if(status == 0){
				swal({text: "비공개 처리된 축제입니다.\n구매를 취소하고, 홈화면으로 이동합니다.", icon: "warning", button: "확인"})
				.then(function(){
					location.replace(root + '/home');
				});
			}else if(status == 3){
				swal({text: "이미 종료된 축제입니다.", icon: "warning", button: "확인"})
				.then(function(){
					closeModal();
					$('html').animate({scrollTop : 0}, 0);
				});
			}else if(status == 1 || status == 2){
				if(inputValue != ''){
					var inputNum = parseInt(inputValue);
					if(inputNum < 100 && inputNum > 0){	// 범위 내인 경우 submit
						$('#ticketInsert').submit();
					}else{
						$('#headCountHint').text('입장인원은 1~99명까지 입력 가능합니다.');
						$('#headCount').focus();
					}
				}else{
					$('#headCountHint').text('입장인원은 1~99명까지 입력 가능합니다.');
					$('#headCount').focus();
				}				
			}
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
		$(window).on('scroll',function(){
			if(checkVisible($('#review')) && !isReviewAlreadyInitLoad){
				var paramData = {'festivalCode':$('.fes_code').val(), 'lastReviewCode':'0'}
				// AJAX 호출
				$.ajax({
					url: root + '/review/list',			// 요청 URL
					type: 'POST', 						// POST 방식으로 요청
					contentType: 'application/json',	// Json 타입으로 데이터 전송
					data: JSON.stringify(paramData),	// 서버로 보낼 데이터
					dataType: 'json',
					success: function(data){
						if(data.dataStatus == 'NORMAL_TRUE'){							
							var reviewList = data.festivalReviewList;
							// 리뷰 목록 출력
							$.each(reviewList, function(index, item){
								$('.review_list_layout').append(printReview(item, root));
							});
							// 이벤트 바인딩
							review_btn_event(root);
						}
					},
					error: function(){
						// AJAX 요청이 실패한 경우 에러 처리
						console.log('데이터를 불러오는데 실패했습니다.');
					}
				});
				isReviewAlreadyInitLoad = true;
			}
		});		
	}
	
	// 스크롤이 바닥에 다다를 시 페이징 목록 Ajax 요청
	var isMoreData = true;	// 불러올 데이터가 더 있는지 여부
	var isAjaxPossible = true;	// Ajax 통신 가능한 상태인지(중복 데이터 로딩 방지)
	$(window).on('scroll',function(){
		if($('.index_menu').length){
			scrollPositionCheck();
		}
		if(isMoreData && isAjaxPossible){
			var scrollTop = $(window).scrollTop();		// scroll top
			var viewportHeight = $(window).height();	// viewport height
			var scrollHeight = $(document).height();	// available scroll height
			var menuHeight = $('.bottom_menu').height();	// bottom menu height
			if(scrollTop + viewportHeight + menuHeight >= scrollHeight){	// 스크롤이 바닥에 다다를 시
				var requestUrl = '';										// 요청 URL
				var paramData = {};	// 요청 데이터
				var appendPoint;	// 축제 목록을 추가할 지점
				switch(pageTitle){
					/*case '축제올래':
						requestUrl = root + '/home/more';
						paramData = {'lastFestivalCode':$('.festival_code').last().val()};
						appendPoint = $('.default_list_layout');
						break;*/
					case '이번 주 HOT':
					case '축제 NOW':
					case 'COMING SOON':
						requestUrl = root + '/festival/list/more';
						paramData = {'lastFestivalCode':$('.festival_code').last().val(), 'category':$('#category').val()};
						appendPoint = $('.default_list_2x_layout');
						break;
					case '축제검색':
						requestUrl = root + '/festival/search/more';
						paramData = {'lastFestivalCode':$('.festival_code').last().val(), 'keyword':$('#searched').val()};
						appendPoint = $('.default_list_2x_layout');
						break;
					case '축제일정':
						requestUrl = root + '/festival/calendar/more';
						paramData = {'lastFestivalCode':$('.festival_code').last().val(), 'location':$('#select_location').val(), 'periodStart':$('.selected_week~.week_start').val(), 'periodEnd':$('.selected_week~.week_end').val()};
						appendPoint = $('.default_list_2x_layout');
					case '상세정보':
						requestUrl = root + '/review/list/more';
						paramData = {'festivalCode':$('.fes_code').val(), 'lastReviewCode':$('.review_code').last().val()};
						appendPoint = $('.review_list_layout');
						break;
					case '북마크':
						requestUrl = root + '/bookmark/list/more';
						paramData = {'lastBookmarkCode':$('.bookmark_code').last().val()};
						appendPoint = $('.default_list_2x_layout');
						break;
					default:
						isAjaxPossible = false;
						break;
				}
				if(isMoreData && isAjaxPossible){	
					//console.log('possible');				
					// AJAX 호출
					$.ajax({
						url: requestUrl, 			// 요청 URL
						type: 'POST', 				// POST 방식으로 요청
						async: false,				// 동기 처리
						contentType: 'application/json',	// Json 타입으로 데이터 전송
						data: JSON.stringify(paramData),	// 서버로 보낼 데이터
						dataType: 'json',
						beforeSend: function(){
							startLoading();	// 로딩 이미지 출력
						},
						success: function(data){
							isAjaxPossible = false;
							if(data.dataStatus == 'NORMAL_TRUE'){	// 정상적인 데이터 응답
								var dataClass = data.dataClass;
								if(dataClass == 'festival'){		// 응답 데이터가 축제 목록일 경우
									var fes = data.fesList;
									//var fesImages = data.fesImages;
									$.each(fes, function(index, item){
										appendPoint.append(printFestivalCard(item, root));
										imageLoad(item.festivalCode, root);
										//console.log(item.festivalCode);
										if(data.dataOption == 'bookmark'){	// 옵션이 북마크인 경우
											var fesCard = $('.festival_card_container').last();
											// 북마크 이미지 삽입
											printBookmark(item.festivalCode, fesCard, root);
										}
									});
									if(data.dataOption == 'bookmark'){	// 옵션이 북마크인 경우
										requestChangeBookmark(root);	// 북마크 이벤트 바인딩
									}
									if(fes.length == 0){
										console.log('조회할 데이터가 없습니다.');
										isMoreData = false;
									}									
								}else if(dataClass == 'review'){	// 응답 데이터가 리뷰 목록일 경우
									var review = data.festivalReviewList;
									$.each(review, function(index, item){
										appendPoint.append(printReview(item, root));
										//console.log(item.festivalReviewCode);
									});
									review_btn_event(root);	// 리뷰 버튼 이벤트 바인딩
									if(review.length == 0){
										console.log('조회할 데이터가 없습니다.');
										isMoreData = false;
									}
								}
							}else{
								console.log('불러올 목록이 없습니다.');
								isMoreData = false;
							}
						},
						error: function(){
							// AJAX 요청이 실패한 경우 에러 처리
							console.log('데이터를 불러오는데 실패했습니다.');
							endLoading();	// 로딩 이미지 숨김
						}, 
						complete: function(){
							console.log('comp');
							isAjaxPossible = true;
							endLoading();	// 로딩 이미지 숨김
						}
					});
				}
			}
		}
	});
	// 홈 화면 로딩 이미지 이벤트
	if($('#festivalolle').length){
		setTimeout(function(){
			$('#festivalolle').remove();			
		}, 3000);
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
		}else{
			$('.folding_active[value="active"]').next().css('margin-bottom', '1.5vh');
			$('.folding_active[value="active"]').next().next().attr('hidden', true);
			$('.folding_active[value="active"]').val('hide');
			$(this).next().attr('hidden', false);
			$(this).css('margin-bottom', '4.05vh');
			$(this).prev().val('active');
		}
	});
}

// 축제 일정 화면 각 주차 선택 이벤트 바인딩
function week_event(pageRoot){
	if($('#week_menu').length){
		// 주차 선택
		$('.horizontal_menu_item').on('click', function(){
			$('.selected_week').attr('class', '');
			$(this).children('p').attr('class', 'selected_week');
			var month = $('#select_month').val();
			var location = $('#select_location').val();
			var periodStart = $('.selected_week~.week_start').val();
			var periodEnd = $('.selected_week~.week_end').val();
			// AJAX 호출
			$.ajax({
				url: pageRoot + '/festival/calendar/select', // 요청 URL
				type: 'GET', 								 // GET 방식으로 요청
				data: {month: month, location: location,
					   periodStart: periodStart,
					   periodEnd: periodEnd}, 				 // 서버로 보낼 데이터
				dataType: 'json',
				success: function(data){
					// 응답 데이터 분류
					var fesList = data.fesList;					// 축제 목록
					//var fesImages = data.fesImages;				// 축제 이미지 목록
					$('.default_list_2x_layout').empty();
					if(fesList.length == 0){
						var appendHTML = '<div class="no_result">';
						appendHTML += '<img src="' + pageRoot + '/resources/img/mobile/festival_none.png" alt="none"></div>';
						$('.default_list_2x_layout').append(appendHTML);
					}else{
						$.each(fesList, function(index, item){
							$('.default_list_2x_layout').append(printFestivalCard(item, pageRoot));
							imageLoad(item.festivalCode, pageRoot);
							//console.log(item.festivalCode);
						});
					}
					$('html').animate({scrollTop : 0}, 0);
				},
				error: function(){
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
				}
			});
		});
	}
}

// 북마크 이미지 요소 생성
function printBookmark(fesNum, item, pageRoot){
	var appendHTML = '<div class="mybookmark bookmarkAction">';
	//appendHTML += '<img class="bookmark_img" src="' + pageRoot + '/resources/img/icon/bookmark_icon.png" alt="북마크">';
	appendHTML += '<i class="fa-solid fa-heart bookmark_img"></i>';
	appendHTML += '<input type="hidden" class="fes_code" value="' + fesNum + '">';
	appendHTML += '</div>';
	$(item).append(appendHTML);
	requestCheckBookmark(fesNum, pageRoot);
}

// 카드 형식(세로) 축제 정보 레이아웃 요소 생성
function printFestivalCard(fes, pageRoot){
	var appendHTML = '<div class="festival_card_container" onclick="location.href=';
	appendHTML += "'" + pageRoot + '/festival/info?festivalCode=' + fes.festivalCode + "'" + '">';
	appendHTML += '<input type="hidden" class="festival_code" value="' + fes.festivalCode + '">';
	appendHTML += '<div class="card">';
	appendHTML += '<div class="ratio">';
	/*if(img != null){
		appendHTML += '<img src="data:image:jpg;base64,' + img + '" class="card-img-top" alt="' + fes.festivalCode + '">';
	}else{
		appendHTML += '<img src="' + pageRoot + '/resources/img/festest3.jpg" class="card-img-top" alt="no image">';
	}*/
	appendHTML += '<img src="' + pageRoot + '/resources/img/mobile/empty_image.png" class="card-img-top" alt="' + fes.festivalCode + '">';
	appendHTML += '</div>';
	appendHTML += '<div class="card-body">';
	appendHTML += '<div class="festival_title">';
	appendHTML += '<p class="card-text text-truncate">' + fes.title + '</p></div>';
	appendHTML += '<div class="festival_sub"><div class="festival_location">';
	appendHTML += '<p class="card-text text-truncate">' + fes.stateName + ' ' + fes.cityName + '</p></div>';
	appendHTML += '<div class="card_rating"><div class="icon_layout rating_img">';
	//appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon.png" alt="평점">';
	appendHTML += '<i class="fa-solid fa-star fill_star"></i>';
	appendHTML += '</div>';
	appendHTML += '<div class="icon_layout rating_txt">';
	var rating = parseFloat(fes.rating).toFixed(1);
	if(rating == 0){
		appendHTML += '<p class="card-text no_rating">평점없음</p>';		
	}else{
		appendHTML += '<p class="card-text">' + rating + '</p>';		
	}
	appendHTML += '</div></div></div></div></div></div>';
	return appendHTML;
}

// 주차 별 축제 일정 정보 레이아웃 요소 생성
/*function printCalendar(month, weekData, weekDataImages, pageRoot){
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
}*/

// 북마크 여부 확인 요청
function requestCheckBookmark(festivalCode, pageRoot){
	// AJAX 호출
	$.ajax({
		url: pageRoot + '/bookmark/check', 	// 요청 URL
		type: 'GET', 						// GET 방식으로 요청
		data: {festivalCode: festivalCode},	// 서버로 보낼 데이터
		dataType: 'json',
		success: function(data){
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
				//$(selectorEl).prev().attr('src', pageRoot + '/resources/img/icon/bookmark_icon.png');
				$(selectorEl).prev().css('color', '#F15600');
				$(selectorEl).after('<input type="hidden" class="bookmark_code" value="' + bookmarkVO.bookmarkCode +'">');
			}else{
				//$(selectorEl).prev().attr('src', pageRoot + '/resources/img/icon/bookmark_icon_empty.png');						
				$(selectorEl).prev().css('color', '#848484');						
			}
			
		},
		error: function(){
			// AJAX 요청이 실패한 경우 에러 처리
			console.log('데이터를 불러오는데 실패했습니다.');
		}
	});
}

// 북마크 추가, 취소 이벤트 바인딩 함수
function requestChangeBookmark(pageRoot){
	$('.bookmarkAction').on('click', function(e){
		e.stopPropagation();
		if($(this).children('.bookmark_code').length){
			var bookmarkCode = $(this).children('.bookmark_code').val();
			// 북마크 된 상태이면 북마크 취소 실행
			$.ajax({
				url: pageRoot + '/bookmark/delete', // 요청 URL
				type: 'POST', 						// POST 방식으로 요청
				async: false,						// 동기 처리
				data: {bookmarkCode: bookmarkCode},	// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data){
					ajaxResponseExecuteTriple(data,
						function(){
							// NORMAL_TRUE 시
							console.log('북마크 취소 완료');
							$(this).children('.bookmark_code').remove();	// 요소 제거
							//$(this).children('.bookmark_img').attr('src', pageRoot + '/resources/img/icon/bookmark_icon_empty.png');
							$(this).children('.bookmark_img').css('color', '#848484');
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
				error: function(){
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
				}
			});
		}else{
			// 북마크 안 된 상태이면 북마크 추가 실행
			var festivalCode = $(this).children('.fes_code').val();
			$.ajax({
				url: pageRoot + '/bookmark/insert',	// 요청 URL
				type: 'POST', 						// POST 방식으로 요청
				async: false,						// 동기 처리
				data: {festivalCode: festivalCode},	// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data){
					ajaxResponseExecuteFull(data,
						function(){
							// NORMAL_TRUE 시
							console.log('북마크 추가 완료');
							requestCheckBookmark(festivalCode, pageRoot);
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
				error: function(){
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
		url: pageRoot + '/review/myreview', 	// 요청 URL
		type: 'GET', 							// GET 방식으로 요청
		data: {festivalCode: festivalCode},		// 서버로 보낼 데이터
		dataType: 'json',
		success: function(data){
			$('#my_review').empty();			// 요소 비우기
			// 리뷰 목록 출력
			$('#my_review').append(printMyReview(data, pageRoot));
			review_btn_event(pageRoot);
		},
		error: function(){
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
			appendHTML += '<div class="review_sub">';
			appendHTML += '<div class="rating_layout">';
			for(var i = 1; i <= 5; i++){
				appendHTML += '<div class="icon_layout rating_img rating_clickable">';
				//appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon_empty.png" alt="' + i + '">';
				appendHTML += '<i class="fa-solid fa-star empty_star"></i>';
				appendHTML += '</div>';
			}
			appendHTML += '</div></div>';
			appendHTML += '<div class="multi_line_text">';
			appendHTML += '<textarea class="write_area" placeholder="리뷰를 작성해주세요.(100자 이내)"></textarea>';
			appendHTML += '<div id="writeCount"><p></p></div>';
			appendHTML += '</div>';
			appendHTML += '</div>';
			appendHTML += '<div class="review_btn_layout"><p class="card-text insert_review">등록</p>';
		}else{		// 작성한 리뷰가 있는 상태 > 표시
			appendHTML += '<div class="review_name"><p class="card-text">내가 쓴 리뷰</p></div>';
			appendHTML += '<div class="review_sub">';
			appendHTML += '<div class="rating_layout">';
			for(var i = 1; i <= myReview.rating; i++){
				appendHTML += '<div class="icon_layout rating_img">';
				//appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon.png" alt="fill">';
				appendHTML += '<i class="fa-solid fa-star fill_star"></i>';
				appendHTML += '</div>';
			}
			for(var j = myReview.rating + 1; j <= 5; j++){
				appendHTML += '<div class="icon_layout rating_img">';
				//appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon_empty.png" alt="empty">';
				appendHTML += '<i class="fa-solid fa-star empty_star"></i>';
				appendHTML += '</div>';
			}
			appendHTML += '</div>';		
			appendHTML += '<div class="day_for_write"><p>' + timeForToday(myReview.writeDate) + '</p></div>';
			appendHTML += '</div>';		
			if(myReview.status != 2){	// 정상 표시되는 리뷰 + 신고된 리뷰(블라인드 처리되기 전)
				appendHTML += '<div class="multi_line_text"><p class="review_content">' + myReview.content + '</p></div>';
			}else{		// 블라인드 처리된 리뷰
				appendHTML += '<div class="multi_line_text"><p class="review_blind">블라인드 처리된 리뷰입니다.</p></div>';
			}
			appendHTML += '</div>';
			appendHTML += '<div class="review_btn_layout"><p class="card-text delete_review">삭제</p>';		
		}
	}
	appendHTML += '<input type="hidden" value="' + myReview.festivalReviewCode + '">';
	appendHTML += '</div></div></div></div>';
	
	return appendHTML;
}

// 리뷰 목록 레이아웃 요소 생성
function printReview(item, pageRoot){
	var appendHTML = '';
	appendHTML += '<div class="review_card_container">';
	appendHTML += '<div class="card">';
	appendHTML += '<div class="card-body">';
	appendHTML += '<div class="review_body">';
	appendHTML += '<div class="review_name"><p class="card-text">' + item.id + '</p></div>';
	appendHTML += '<div class="review_sub">';
	appendHTML += '<div class="rating_layout">';
	for(var i = 1; i <= item.rating; i++){
		appendHTML += '<div class="icon_layout rating_img">';
		//appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon.png" alt="' + i + '">';
		appendHTML += '<i class="fa-solid fa-star fill_star"></i>';		
		appendHTML += '</div>';
	}
	for(var j = item.rating + 1; j <= 5; j++){
		appendHTML += '<div class="icon_layout rating_img">';
		//appendHTML += '<img src="' + pageRoot + '/resources/img/icon/rating_icon_empty.png" alt="' + j + '">';
		appendHTML += '<i class="fa-solid fa-star empty_star"></i>';
		appendHTML += '</div>';
	}
	appendHTML += '</div>';
	appendHTML += '<div class="day_for_write"><p>' + timeForToday(item.writeDate) + '</p></div>';
	appendHTML += '</div>';
	appendHTML += '<div class="multi_line_text"><p class="review_content">' + item.content + '</p></div>';
	appendHTML += '</div>';
	appendHTML += '<div class="review_btn_layout"><p class="card-text report_review">신고</p>';
	appendHTML += '<input type="hidden" class="review_code" value="' + item.festivalReviewCode + '">';
	appendHTML += '</div></div></div></div>';
		
	return appendHTML;
}

// 리뷰 작성 후 경과시간 계산
function timeForToday(value){
	var today = new Date();				// 오늘 날짜
	var timeValue = new Date(value);	// 리뷰 작성일자
	var betweenTimeDay = Math.floor((today.getTime() - timeValue.getTime()) / (1000*60*60*24));	// 일 단위로 계산
	var result = '';	// 결과값 받을 변수 선언
	if(betweenTimeDay < 1){				// 하루가 안 지났을 경우
		result = '오늘';
	}else if(betweenTimeDay < 30){		// 1달이 안 지났을 경우
		result = betweenTimeDay + "일 전";
	}else if(betweenTimeDay < 365) {	// 1년이 안 지났을 경우
		result = Math.floor(betweenTimeDay/30) + "달 전";
	} else {	// 1년이 지난 경우
		result = Math.floor(betweenTimeDay/365) + "년 전";
	}
	return result;//결과값 저장
}

// 리뷰 카드 내 버튼 이벤트 등록
function review_btn_event(pageRoot){
	var reviewMaxLength = 100;
	// 로그인 하지 않은 상태에서 등록 버튼 클릭 시
	if($('.review_login').length){
		$('.review_login').off('click').on('click', function(){
			location.href = pageRoot + '/login';	// 로그인 페이지로 이동
		});
	}
	// 입장권 구매하지 않은 상태에서 등록 버튼 클릭 시
	if($('.goto_ticket').length){
		$('.goto_ticket').off('click').on('click', function(){
			swal({text: "리뷰 작성은 입장권 구매 후 가능합니다.", icon: "info", button: "확인"});
			$('.menuIndex').click();	// 입장권 구매 위치로 스크롤 이동
		});
	}
	// 정상적인 리뷰 등록 이벤트
	if($('.insert_review').length){
		$('.insert_review').off('click').on('click', function(){
			var rating = $('.rating_check').length;
			if(rating >= 1 && rating <= 5){	// 평점이 정상적으로 선택된 경우
				var festivalCode = $('input[name="festivalCode"]').val();
				var content = $('.write_area').val();
				if(content.length <= reviewMaxLength){	// 리뷰 내용이 100자 이내인 경우
					if(content == '' || content.length == 0){
						content = ' ';
					}
					// post 요청할 데이터 JSON 타입으로 가공
					var param = {'festivalCode':festivalCode,'content':content,'rating':rating};
					// AJAX 호출
					$.ajax({
						url: pageRoot + '/review/insert', 	// 요청 URL
						type: 'POST', 						// POST 방식으로 요청
						async: false,						// 동기 처리
						contentType: 'application/json',
						data: JSON.stringify(param),		// 서버로 보낼 데이터
						dataType: 'json',
						success: function(data){
							if(data){
								//swal({text: "리뷰 등록이 완료되었습니다.", icon: "success", button: "확인"});
								requestMyReview(pageRoot);		// 내 리뷰 다시 조회(Ajax 요청)
								var prevCount = parseInt($('.review_count').text());	// 리뷰 등록 전 리뷰 수
								var prevRating = parseFloat($('.rating_value').val());	// 리뷰 등록 전 평점
								var currentCount = prevCount + 1;			// 리뷰 등록 후 리뷰 수
								var currentRating = parseFloat(((prevCount * prevRating)) + rating)/currentCount;
								currentRating = currentRating.toFixed(1);
								$('.rating_txt p').text(currentRating);
								$('.rating_value').val(currentRating);
								$('.review_count').text(currentCount);
								if(prevCount == 0){
									$('.rating_txt p').attr('class', 'card-text');
								}
							}else{
								console.log('리뷰 등록에 실패했습니다.');
								swal({text: "리뷰가 정상적으로 등록되지 못했습니다.", icon: "error", button: "확인"});
							}
						},
						error: function(){
							// AJAX 요청이 실패한 경우 에러 처리
							console.log('데이터를 불러오는데 실패했습니다.');
							swal({text: "리뷰가 정상적으로 등록되지 못했습니다.", icon: "error", button: "확인"});
						}
					});
				}else{	// 리뷰 내용이 100자를 초과하는 경우
					swal({text: "리뷰는 " + reviewMaxLength + "자 이내로 작성해야 합니다.", icon: "warning", button: "확인"})
					.then(function(){
						$('.write_area').focus();
					});
				}
			}else{	// 평점이 정상적으로 선택되지 않은 경우
				swal({text: "평점을 선택해주세요!", icon: "warning", button: "확인"})
				.then(function(){
					$('#my_review .rating_layout').css('outline', '0.15rem solid #000000A6');
					$('#my_review .rating_layout').css('border-radius', '0.25rem');
				});
			}
		});
	}
	// 리뷰 신고 시 이벤트
	if($('.report_review').length){
		$('.report_review').off('click').on('click', function(){
			var festivalReviewCode = $(this).next().val();
			// AJAX 호출
			$.ajax({
				url: pageRoot + '/review/report', 	// 요청 URL
				type: 'POST', 				// POST 방식으로 요청
				async: false,				// 동기 처리
				data: {festivalReviewCode: festivalReviewCode},	// 서버로 보낼 데이터
				dataType: 'json',
				success: function(data){
					ajaxResponseExecuteTriple(data,
						function(){
							// NORMAL_TRUE 시
							swal({text: "신고 처리되었습니다.", icon: "success", button: "확인"});
							$(this).closest('.review_card_container').remove();		// 해당 리뷰 숨김
						}.bind(this),
						function(){
							// ERROR 시
							console.log('신고 처리에 실패했습니다.');
							swal({text: "신고 처리에 실패했습니다.", icon: "error", button: "확인"});
						},
						function(){
							// NOT_SESSION 시
							location.replace(pageRoot + '/login');	// 로그인 페이지로 리다이렉트
						}
					);
				}.bind(this),
				error: function(){
					// AJAX 요청이 실패한 경우 에러 처리
					console.log('데이터를 불러오는데 실패했습니다.');
					swal({text: "신고 처리에 실패했습니다.", icon: "error", button: "확인"});
				}
			});
		});
	}
	// 리뷰 삭제 시
	if($('.delete_review').length){
		$('.delete_review').off('click').on('click', function(){
			var el = $(this);
			swal({text: "삭제하시겠습니까?", icon: "warning", buttons: ["취소","확인"]}).then(function(value){
				if(value){
					var festivalReviewCode = $(el).next().val();
					var rating = $('img[alt="fill"]').length;
					// AJAX 호출
					$.ajax({
						url: pageRoot + '/review/delete', 	// 요청 URL
						type: 'POST', 				// POST 방식으로 요청
						async: false,				// 동기 처리
						data: {festivalReviewCode: festivalReviewCode},	// 서버로 보낼 데이터
						dataType: 'json',
						success: function(data){
							if(data){
								//swal({text: "삭제가 완료되었습니다.", icon: "success", button: "확인"});
								requestMyReview(pageRoot);		// 내 리뷰 다시 조회(Ajax 요청)
								var prevCount = parseInt($('.review_count').text());	// 리뷰 삭제 전 리뷰 수
								var prevRating = parseFloat($('.rating_value').val());	// 리뷰 삭제 전 평점
								var currentCount = prevCount - 1;			// 리뷰 삭제 후 리뷰 수
								if(currentCount == 0){	// 리뷰 수가 0개가 된 경우
									$('.rating_txt p').text('평점없음');
									$('.rating_txt p').attr('class', 'card-text no_rating');
									$('.rating_value').val(0.0);
								}else{
									var currentRating = parseFloat(((prevCount * prevRating) - rating), 1)/currentCount;
									currentRating = currentRating.toFixed(1);
									$('.rating_txt p').text(currentRating);
									$('.rating_value').val(currentRating);
								}
								$('.review_count').text(currentCount);
							}else{
								console.log('리뷰 삭제에 실패했습니다.');
								swal({text: "리뷰가 정상적으로 삭제되지 못했습니다.", icon: "error", button: "확인"});
							}
						},
						error: function(){
							// AJAX 요청이 실패한 경우 에러 처리
							console.log('데이터를 불러오는데 실패했습니다.');
							swal({text: "리뷰가 정상적으로 삭제되지 못했습니다.", icon: "error", button: "확인"});
						}
					});
				}else{}
			});
		});
	}
	// 평점 부여 이벤트
	if($('.rating_clickable').length){
		$('.rating_clickable').off('click').on('click', function(){
			$(this).prevAll().children('i').attr('class', 'fa-solid fa-star fill_star rating_check');
			$(this).children('i').attr('class', 'fa-solid fa-star fill_star rating_check');
			$(this).nextAll().children('i').attr('class', 'fa-solid fa-star empty_star');
			$('#my_review .rating_layout').css('outline', 'none');
			/* 리소스 이미지 사용할 경우
			$(this).prevAll().children('img').attr('src', pageRoot + '/resources/img/icon/rating_icon.png');
			$(this).prevAll().children('img').attr('class', 'rating_check');
			$(this).children('img').attr('src', pageRoot + '/resources/img/icon/rating_icon.png');
			$(this).children('img').attr('class', 'rating_check');
			$(this).nextAll().children('img').attr('src', pageRoot + '/resources/img/icon/rating_icon_empty.png');
			$(this).nextAll().children('img').attr('class', '');
			$('#my_review .rating_layout').css('outline', 'none');
			*/
		});
	}
	// 리뷰 작성란 이벤트
	if($('.write_area').length){
		// 글자 수 확인
		$('.write_area').off('input').on('input', function(){
			var content = $('.write_area').val();
			// 글자 수 표시
			if(content.length == 0 || content == ''){
				$('#writeCount p').text('0/' + reviewMaxLength + '자');
			}else{
				$('#writeCount p').text(content.length + '/' + reviewMaxLength + '자');
			}
			// 글자 수 제한(100자 이내)
			if(content.length > reviewMaxLength){
				$('.write_area').val(content.substring(0, reviewMaxLength));
				$('#writeCount p').text($('.write_area').val().length + '/' + reviewMaxLength + '자');
				swal({text: "리뷰는 " + reviewMaxLength + "자 이내로 작성해야 합니다.", icon: "warning", button: "확인"})
				.then(function(){
					$('.write_area').focus();
				});
			}
		});
		// 포커스 시 글자 수 확인 가능
		$('.write_area').off('focus').on('focus', function(){
			$('#writeCount p').attr('hidden', false);
		});
		// 포커스 해제 시 글자 수 확인 불가
		$('.write_area').off('blur').on('blur', function(){
			$('#writeCount p').attr('hidden', true);
		});
	}
}

// 페이지 내 특정 위치로 이동(축제 상세 정보 화면)
function moveToIndex(){
	var margin_space = $(window).height()*0.13;
	$('.menuIndex').click(function(){
		var offset = $('#menu').offset(); //선택한 태그의 위치를 반환
        $('html').animate({scrollTop : (offset.top*0.6) - margin_space}, 0);
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

// 상세페이지 인덱스 메뉴 스크롤 위치에 따른 이벤트
function scrollPositionCheck(){
	function selectedStyle(element){
		if($('#selected_menu').length){
			$('#selected_menu').attr('id', '');
		}
		$(element).attr('id', 'selected_menu');
		console.log('this position');
	}
	var scrolltop = $(window).scrollTop();		// Scroll Top
	var margin_space = $(window).height()*0.13;
	var menuPos = $('#menu').offset().top-margin_space;
	var infoPos = $('#info').offset().top-margin_space;
	var foodPos = $('#food').offset().top-margin_space;
	var reviewPos = $('#review').offset().top-margin_space;
	switch(scrolltop){
		case 0:
			selectedStyle($('.topIndex').parent('td'));
			break;
		case menuPos:
			selectedStyle($('.menuIndex').parent('td'));
			break;
		case infoPos:
			selectedStyle($('.infoIndex').parent('td'));
			break;
		case foodPos:
			selectedStyle($('.foodIndex').parent('td'));
			break;
		case reviewPos:
			selectedStyle($('.reviewIndex').parent('td'));
			break;
	}
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

// Ajax 시 로딩 이미지 출력
function startLoading(){
	$('.loading_img').attr('hidden', false);
}
// Ajax 시 로딩 이미지 제거
function endLoading(){
	$('.loading_img').attr('hidden', true);
}

// 이미지 파일 Ajax 요청
function imageLoad(festivalCode, pageRoot){
	//console.log(festivalCode);
	// AJAX 호출
	$.ajax({
		url: pageRoot + '/image',	// 요청 URL
		type: 'GET',				// GET 방식으로 요청
		data: {festivalCode: festivalCode},
		dataType: 'text',
		success: function(data){
			var imageSelector = 'img[alt="' + festivalCode + '"]';
			if(data != ''){
				$(imageSelector).attr('src', data);
			}else{
				$(imageSelector).attr('src', pageRoot + '/resources/img/no_image.png');
			}
		},
		error: function(){
			// AJAX 요청이 실패한 경우 에러 처리
			console.log('데이터를 불러오는데 실패했습니다.');
		}
	});
}

function initImageLoad(pageRoot){
	//console.log('img load + ' + $('.festival_card_container .card-img-top, .recommend_img').length);
	if($('.festival_card_container .card-img-top, .recommend_img').length){
		var images = $('.card-img-top, .recommend_img');
		// 각 요소 별 이미지 로드
		$.each(images, function(index, item){
			var festivalCode = $(item).attr('alt');
			imageLoad(festivalCode, pageRoot);
		});
	}
}