<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Joyous</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
		<%--
		<link rel="stylesheet" href="<c:url value='/resources/css/swiper.min.css'/>" />
		<script src="<c:url value='/resources/js/swiper.esm.browser.bundle.min.js'/>"></script>
		--%>
		
		<link rel="stylesheet" href="<c:url value='/resources/css/homepage-mobile.css'/>"/>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<%-- <script src="https://code.jquery.com/jquery-latest.min.js"></script> --%>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script>
			var recommendSwiper = new Swiper('.main_swiper', {
				direction: 'horizontal',	// 수평방향
				loop: true,					// 루프 기능(반복 사용)
				autoplay: {					// 자동 스크롤링
					delay: 2500,			// 2.5초
					disableOnInteraction: false,
				},
				pagination : { // 페이징 설정
					el : '.swiper-pagination',
					clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
				},
				navigation : { // 네비게이션 설정
					nextEl : '.swiper-button-next',
					prevEl : '.swiper-button-prev',
				},
				enabled: false
			});
			var defaultSwiper = new Swiper('.vertical_swiper', {
				direction: 'vertical',		// 수직방향
				enabled: false,
			});
		</script>
		<style type="text/css">
			.swipe_layout {
				position: relative;
				width: 83vmin;
				height: 40vmax;
				border: 10px solid #000;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
			}
			.swiper-slide {
			}
		</style>
	</head>
	<body>
		<%-- 추천목록 출력할 레이아웃 --%>
		<div class="recommend_list_layout">
			<div class="swiper-container main_swiper">
			    <div class="swiper-wrapper">
			        <div class="swiper-slide">Slide 1<br>내용1이 들어갑니다.</div>
			        <div class="swiper-slide">Slide 2<br>내용2가 들어갑니다.</div>
			        <div class="swiper-slide">Slide 3<br>내용3이 들어갑니다.</div>
			    </div>
			    <div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			    <div class="swiper-pagination"></div>
			</div>
			<%--
			<div class="swipe_layout">
				<p class="ptoRight">오른쪽에서 왼쪽으로</p>
				<p class="ptoLeft">왼쪽에서 오른쪽으로</p>
			</div>
			--%>
		</div>
		<%-- 기본목록(진행 중인 축제) 출력할 레이아웃 --%>
		<div class="default_list_layout">
			<div class="swiper-container vertical_swiper">
			    <div class="swiper-wrapper">
			        <div class="swiper-slide">
						<c:forEach var="fes" items="${defaultList}" varStatus="stat">
							<div class="dailystory_card_container" style="display: inline-block;"
								 onclick="location.href='<c:url value="/festival/info/${fes.festivalCode}"/>'">
								<div class="card">
									<div class="ratio">
										<c:choose>
											<c:when test='${(fes.fileName != null) && (fes.fileName != "")}'>
												<img src="<c:url value='/resources/img/${fes.fileName}'/>" class="card-img-top" alt="image">				  	
											</c:when>
											<c:otherwise>
												<img src="<c:url value='/resources/img/default_thumbnail.jpg'/>" class="card-img-top" alt="기본 썸네일">				  	
											</c:otherwise>
										</c:choose>
									</div>
									<div class="card-body">
										<div style="display: inline-block; width: 85%">							
											<p class="card-text">
												${fes.stateName} ${fes.cityName}
											</p>
										</div>
									    <div class="icon_layout">
											<img src="<c:url value='/resources/img/rating_icon.jpg'/>" alt="평점">
										</div>
										<div class="icon_layout">							
											<p class="card-text">
												${fes.rating}
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
			    </div>
			</div>
		</div>
		<%@ include file="mobilebottom.jsp"%>
	</body>
</html>