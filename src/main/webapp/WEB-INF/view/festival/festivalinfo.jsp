<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>상세정보</title>
		<%-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/mobile.js'/>"></script> --%>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b65446e66b6e8b6a52d46722fe1fb6f&libraries=services"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<%-- 인덱스 메뉴(페이지 내 이동) 레이아웃 --%>
		<div class="index_menu">
			<table>
				<tr>
					<td>
						<a class="link_anchor" href="#top">TOP</a>
					</td>
					<td>
						<a class="link_anchor menuIndex">개 요</a>
					</td>
					<td>
						<a class="link_anchor infoIndex">상세정보</a>
					</td>
					<td>
						<a class="link_anchor foodIndex">주변업체</a>
					</td>
					<td>
						<a class="link_anchor reviewIndex">리 뷰</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="index_menu_empty"></div>
		<%-- 축제 상세정보 출력할 레이아웃 --%>
		<div class="festival_info_layout">
			<div class="festival_info_sub_title" id="fes_info_title">
				<div id="fes_title">
					<h3>${fesInfo[0].title}</h3>
				</div>
				<div id="fes_status">
					<button class="btn btn-secondary d-day_info">${statusMsg}</button>
				</div>
			</div>
			<div>
				<div class="icon_layout rating_img">
					<img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="평점">
				</div>
				<div class="icon_layout rating_txt">							
					<p>${fesInfo[0].rating}</p>
				</div>
			</div>
			<div>
				<div class="icon_layout place_img">
					<img src="<c:url value='/resources/img/icon/place_icon.png'/>" alt="장소">
				</div>
				<div class="icon_layout place_txt">							
					<p>${fesInfo[0].stateName} ${fesInfo[0].cityName}</p>
				</div>
			</div>
			<div id="carouselFestivalInfoImage" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<c:forEach var="fes" items="${fesInfo}" varStatus="stat">
						<c:set var="img" value="${fesInfoImages[stat.index]}"/>
				        <c:choose>
							<c:when test='${stat.index == 0}'>
								<div class="carousel-item active" data-bs-interval="8000">
									<c:choose>
										<c:when test="${img != null}">
											<img src="data:image:jpg;base64,${img}" class="d-block w-100 img_layout" alt="loading failed">
										</c:when>
										<c:otherwise>
											<img src="<c:url value='/resources/img/festest3.jpg'/>" class="d-block w-100 img_layout" alt="no image">
										</c:otherwise>
									</c:choose>
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item" data-bs-interval="8000">
									<c:choose>
										<c:when test="${img != null}">
											<img src="data:image:jpg;base64,${img}" class="d-block w-100 img_layout" alt="loading failed">
										</c:when>
										<c:otherwise>
											<img src="<c:url value='/resources/img/festest3.jpg'/>" class="d-block w-100 img_layout" alt="no image">
										</c:otherwise>
									</c:choose>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
			<div class="festival_info_menu_container layout_bottom_line" id="menu">
				<div class="festival_info_menu"><%-- 아이콘 div --%>
					<div class="festival_info_menu_empty"></div>
					<div class="icon_layout">
						<a class="link_anchor bookmarkAction">
							<img class="bookmark_img" src="<c:url value='/resources/img/icon/bookmark_icon_empty.png'/>" alt="북마크">
							<input type="hidden" class="fes_code" value="${fesInfo[0].festivalCode}">
							<br>북마크
						</a>
					</div>
					<div class="icon_layout">
						<a class="link_anchor" id="ticketModal">
							<img src="<c:url value='/resources/img/icon/ticket.png'/>" alt="구매">
							<br>구매
						</a>
					</div>
					<div class="icon_layout">
						<a class="link_anchor reviewIndex">
							<img src="<c:url value='/resources/img/icon/rating_icon_empty.png'/>" alt="리뷰">
							<br>리뷰
						</a>
					</div>
					<div class="festival_info_menu_empty"></div>
				</div>
				<div class="multi_line_text">
					<p>${fesInfo[0].detail}</p>
				</div>
				<div class="tag_layout">
					<p>${fesInfo[0].tags}</p>
				</div>
			</div>
			<div class="layout_bottom_line" id="info">
				<div class="festival_info_sub_title">
					<h3>상세정보</h3>
				</div>
				<div>
					<table class="detail_info">
						<tr>
							<th scope="row">기간</th>
							<td>${fesInfo[0].startDate} ~ ${fesInfo[0].endDate}</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>${fesInfo[0].address}</td>
						</tr>
						<tr>
							<th scope="row">요금</th>
							<c:choose>
								<c:when test='${fesInfo[0].fee == 0}'>
									<td>무료</td>
								</c:when>
								<c:otherwise>
									<td>${fesInfo[0].fee}원</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th scope="row">URL</th>
							<td>${fesInfo[0].url}</td>
						</tr>
						<tr>
							<th scope="row">담당기관</th>
							<td>${fesInfo[0].organizationName}</td>
						</tr>
						<tr>
							<th scope="row">문의</th>
							<td>${fesInfo[0].telephone}</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="layout_bottom_line" id="food">
				<div class="festival_info_sub_title">
					<h3>위치</h3>
				</div>
				<div>
					<div class="map_wrap" id="map_layout">
						<div id="kakaomap"></div>
					</div>
				</div>
				<div class="festival_info_sub_title">
					<h3>주변 음식점</h3>
				</div>
				<div>
					<div class="map_wrap" id="food_list_layout">
						<div id="placesListLayout" class="bg_white">
					        <hr><hr>
					        <ul id="placesList"></ul>
					    </div>
				        <a id="more_result" href="#" target="_blank">>> 더 많은 검색 결과를 보고 싶나요?</a>
					</div>
				</div>
			</div>
			<div class="layout_bottom_line" id="review">
				<div class="festival_info_sub_title">
					<h3>축제 리뷰 <span class="review_count">${fesInfo[0].reviewCount}</span>개</h3>
				</div>
				<div>
					<div class="icon_layout">							
						<p>전체 평점</p>
					</div>
					<div class="icon_layout rating_img">
						<img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="평점">
					</div>
					<div class="icon_layout rating_txt">							
						<p>${fesInfo[0].rating}</p>
					</div>
				</div>
				<div class="review_list_layout">
					<c:choose>
						<c:when test="${sessionScope.loginUser == null}">
							<div class="review_card_container">
								<div class="card">
									<div class="card-body">
										<div class="review_body">							
											<div class="multi_line_text">
												<textarea placeholder="로그인 후 이용 가능합니다."></textarea>
											</div>
										</div>
										<div class="review_btn_layout">							
											<p class="card-text review_login">등록</p>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div id="my_review"></div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<%@ include file="../mobilemenu/topbutton.jsp"%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
		<%-- 입장권 구매 모달 창 --%>
		<div class="ticket_modal_layout">
			<div class="fadeout_bottom_close fadeout_bottom_click">
				<img src="<c:url value='/resources/img/icon/back.png'/>" alt="close">
			</div>
			<div class="ticket_modal_body">
				<form id="ticketInsert" action="<c:url value='/ticket/insert'/>" method="post">
					<div class="modal_body_content">
						<div class="modal_body_content_title">입장인원</div>
						<div class="modal_body_content_main">
							<input type="number" id="headCount" name="headCount" min="1" max="99">
						</div>
						<div class="modal_body_content_sub">명</div>					
					</div>
					<div class="modal_body_content">
						<div class="modal_body_content_title">요금</div>
						<div class="modal_body_content_main">${fesInfo[0].fee}</div>
						<div class="modal_body_content_sub">원</div>					
					</div>
					<div class="modal_body_content">
						<div class="modal_body_content_title">결제금액</div>
						<div class="modal_body_content_main" id="paymentAmount"></div>
						<div class="modal_body_content_sub">원</div>					
					</div>
					<div class="modal_body_content">
						<div class="modal_body_btn modal_cancel fadeout_bottom_click">취소</div>
						<div class="modal_body_btn modal_submit" id="ticket_submit">구매</div>
					</div>
					<input type="hidden" name="festivalCode" value="${fesInfo[0].festivalCode}">
					<input type="hidden" id="fee" name="fee" value="${fesInfo[0].fee}">
				</form>
			</div>
		</div>
		<script type="text/javascript">		
			// 주변 음식점 찾기(카카오맵 API)
			var mapContainer = document.getElementById('kakaomap');		// 맵 레이아웃 레퍼런스
			var mapOptions = {
				center: new kakao.maps.LatLng(37.5838175, 126.9999694),	// 중심 좌표(위도, 경도)
				level: 4			// 확대, 축소 정도(레벨) -> 초기 생성 시의 확대 정도
			};
			var mapView = new kakao.maps.Map(mapContainer, mapOptions);	// 지도 생성 및 반환
			
			var markers = [];		// 마커 담을 배열
			var info = new kakao.maps.InfoWindow({zIndex:1});	// 정보 표시 객체 생성
			var searchObj = new kakao.maps.services.Places();	// 장소 검색 객체 생성
			var geoCoder = new kakao.maps.services.Geocoder();	// 주소-좌표 변환 객체 생성
			
			// 검색 키워드
			var keyword = '전남 순천시 국가정원1호길 47';
			//var fesAddress = ${fesInfo[0].address};
			
			// 주소로 좌표 검색
			geoCoder.addressSearch(keyword, function(result, status){
				if(status == kakao.maps.services.Status.OK){	// 정상적으로 검색 완료 시
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					// 결과값으로 받은 좌표를 이용해 마커 표시
					var centerMarker = new kakao.maps.Marker({
						map: mapView,
						position: coords
					});
					// 장소 설명 표시 객체 생성
					var info = new kakao.maps.InfoWindow({
						content: '<div class="festival_marker">${fesInfo[0].title}</div>'
						, zIndex: 1
					});
					// info window 마커 위에 표시
					info.open(mapView, centerMarker);
					// 지도 중심 위치를 마커 위치로 이동
					mapView.setCenter(coords);
				}
			});
			
			// 축제 장소 주변 음식점 검색
			keyword += ' 음식점';
			var searchOptions = {
				category_group_code: 'FD6',		// 카테고리 코드(음식점='FD6')
				location: mapView.getCenter()	// 기준 중심 좌표
			};
			searchObj.keywordSearch(keyword, function(data, status, page){
				if(status == kakao.maps.services.Status.OK){
					// 정상적으로 검색 완료 시 검색 목록과 마커 표시
					displayPlaces(data);
					// 더 많은 검색 결과 링크 설정(카카오맵 검색결과 창 새로 띄우기)
					$('#more_result').attr('href', 'https://map.kakao.com/link/search/' + keyword);
				}else if(status == kakao.maps.services.Status.ZERO_RESULT){
					console.log('음식점 검색 결과가 없습니다.');
					return;
				}else if(status === kakao.maps.services.Status.ERROR){
					console.log('음식점 검색 오류 발생');
				}
			}, searchOptions);
			
			function displayPlaces(places){
				var placeList = document.getElementById('placesList'),			// 검색 결과 목록(음식점, 카페) 표시 레이아웃 요소
				placeListLayout = document.getElementById('placesListLayout'),	// 장소 목록 표시 레이아웃 요소
				fragment = document.createDocumentFragment(),
				bounds = new kakao.maps.LatLngBounds(),
				fesPos = mapView.getCenter();
				
				for(var i = 0; i < places.length; i++){
					// 마커 생성하여 지도 표시
					var placePos = new kakao.maps.LatLng(places[i].y, places[i].x),	// 음식점 장소 좌표
					marker = addMarker(placePos), 
					item = getListItem(i, places[i]);	// 검색 결과 항목 Element를 생성

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정 >>
					// LatLngBounds 객체에 좌표 추가
					bounds.extend(placePos);

					// 마커와 검색결과 항목에 mouseover 했을때
					// 해당 장소에 인포윈도우에 장소명을 표시합니다
					// mouseout 했을 때는 인포윈도우를 닫습니다
					(function(marker, title){
						kakao.maps.event.addListener(marker, 'mouseover', function(){
							displayInfowindow(marker, title);
						});
						kakao.maps.event.addListener(marker, 'mouseout', function(){
							info.close();
						});

						item.onmouseover = function(){
							displayInfowindow(marker, title);
						};

						item.onmouseout = function(){
							info.close();
						};
					})(marker, places[i].place_name);

					fragment.appendChild(item);
				}

				// 검색결과 항목들을 검색결과 목록 Element에 추가
				placeList.appendChild(fragment);
				placeListLayout.scrollTop = 0;

				// 검색된 장소 위치를 기준으로 지도 범위 재설정
				mapView.setBounds(bounds);
				mapView.setLevel(5);
				mapView.setCenter(fesPos);
			}
			// 각 음식점 검색 결과로 Element를 만들어 반환하는 함수
			function getListItem(index, place){
				var el = document.createElement('li'),
				imgPath = "<c:url value='/resources/img/icon/place_link_icon.png'/>"
				itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
							'<div class="food_info">' +
							'   <h5>' + place.place_name + '</h5>';
				// 도로명 주소가 있으면 도로명 주소, 없으면 지번 주소 표시
				if (place.road_address_name){
					itemStr += '    <span>' + place.road_address_name + '</span>';
				}else{
					itemStr += '   <span class="jibun gray">' +  place.address_name  + '</span>'; 
				}
				itemStr += '  <span class="tel">' + place.phone  + '</span>' +
							'</div>';
				itemStr += '<a class="kakaolink link_anchor" href="' + place.place_url + '" target="_blank">';
				itemStr += '<img src="' + imgPath + '" alt="#"></a>';
				el.innerHTML = itemStr;
				el.className = 'item';
				
				return el;
			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수
			function addMarker(position){
				var marker = new kakao.maps.Marker({
					position: position, // 마커의 위치
				});
				marker.setMap(mapView);	// 지도 위에 마커 표시
				markers.push(marker);	// 배열에 생성된 마커 추가

				return marker;
			}

			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수
			// info window에 장소명 표시
			function displayInfowindow(marker, title) {
				var content = '<div class="festival_marker">' + title + '</div>';

				info.setContent(content);
				info.open(mapView, marker);
				mapView.setCenter(marker.getPosition());
			}
		</script>
	</body>
</html>