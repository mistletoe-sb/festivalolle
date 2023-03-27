<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Joyous</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
		new Swiper('.main_swiper', {
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
		/*
			// 마우스 스와이프
			var mstartX = 0, mendX = 0;
			$(".swipe_layout").on('mousedown',function(event){
				mstartX = event.pageX;
			});
			$(".swipe_layout").on('mouseup',function(event){
				mendX=event.pageX;
				if(mstartX-mendX>50){
					$(".swipe_layout ptoLeft").fadeOut(300);
					$(".swipe_layout ptoRight").fadeIn(300);     
				}else if(mendX-mstartX>50){
					$(".swipe_layout ptoRight").fadeOut(300);
					$(".swipe_layout ptoLeft").fadeIn(300);     
				}else if(mstartX-mendX<50 || mendX-mstartX<50 ){
					$(".swipe_layout ptoRight, .swipe_layout ptoLeft").fadeOut(300);
				}
			});
			// 터치 스와이프
			var startX, endX;
			$(".swipe_layout").on('touchstart',function(event){
				startX = event.originalEvent.changedTouches[0].screenX;
			});
			$(".swipe_layout").on('touchend',function(event){
				endX = event.originalEvent.changedTouches[0].screenX;
				if(startX-endX>50){
					$(".swipe_layout ptoLeft").fadeOut(300);
					$(".swipe_layout ptoRight").fadeIn(300);     
				}else if(endX-startX>50){
					$(".swipe_layout ptoRight").fadeOut(300);
					$(".swipe_layout ptoLeft").fadeIn(300);     
				}else if(startX-endX<50 || endX-startX<50 ){
					$(".swipe_layout ptoRight, .swipe_layout ptoLeft").fadeOut(300);
				}
			});
		*/
		</script>
		<style type="text/css">
			/* 북마크 */
			body {
				position: relative;
				background: rgb(255, 255, 255);
				font-size: 16px;
			}
			.recommend_list_layout {
				width: 100%;
				height: 60vmax;
				padding-top: 3vmax;
				padding-bottom: 6vmax;
				justify-content: center;
				align-items: center;
				text-align: center;
				display: flex;
			}
			.default_list_layout {
				width: 100%;
				padding: 0vmin 8.3vmin;
			}
			.dailystory_card_container {
				display: inline-block;
				width: 83vmin;
				cursor: pointer;
				margin-bottom: 8.3vmin;
			}
			.card {
				border: 0.1rem solid rgb(242, 242, 242);
				border-radius: 1rem;
			}
			.card-body {
				padding-top: 8px;
			}
			.ratio {
				--bs-aspect-ratio: 120%;
			}
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
			.swipe_layout p {display:none}
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
						    <div style="display: inline-block;">
								<img src="<c:url value='/resources/img/rating_icon.jpg'/>" alt="평점 아이콘">
							</div>
							<div style="display: inline-block;">							
								<p class="card-text">
									${fes.rating}
								</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</body>
</html>