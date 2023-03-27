<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Joyous</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="<c:url value='/resources/css/homepage-mobile.css'/>" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
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
		<%-- 축제 상세정보 출력할 레이아웃 --%>
		<div class="festival_info_layout">
			<div>
				<h3>${fesInfo[0].title}</h3>
				<button></button>
			</div>
			<div>
				<div class="icon_layout">
					<img src="<c:url value='/resources/img/rating_icon.jpg'/>" alt="평점">
				</div>
				<div class="icon_layout">							
					<p>${fesInfo[0].rating}</p>
				</div>
			</div>
			<div>
				<div class="icon_layout">
					<img src="<c:url value='/resources/img/place_icon.jpg'/>" alt="장소">
				</div>
				<div class="icon_layout">							
					<p>${fesInfo[0].stateName} ${fesInfo[0].cityName}</p>
				</div>
			</div>
			<div class="swiper-container info_swiper">
			    <div class="swiper-wrapper">
					<c:forEach var="fes" items="${fesInfo}" varStatus="stat">
				        <div class="swiper-slide">
							<img src="${fes.image}" class="img_layout" alt="image">
						</div>
					</c:forEach>
			    </div>
			    <div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			    <div class="swiper-pagination"></div>
			</div>
			<div>
				<div><%-- 아이콘 div --%>
					<div class="icon_layout">
						<img src="<c:url value='/resources/img/bookmark_icon.jpg'/>" alt="북마크">
						<br>
						<p>북마크</p>
					</div>
					<div class="icon_layout">
						<img src="<c:url value='/resources/img/ticket_icon.jpg'/>" alt="구매">
						<br>
						<p>구매</p>
					</div>
					<div class="icon_layout">
						<img src="<c:url value='/resources/img/review_icon.jpg'/>" alt="리뷰">
						<br>
						<p>리뷰</p>
					</div>
				</div>
			</div>
			<div>
				<p class="multi_line_text">${fesInfo[0].detail}</p>
			</div>
			<div>
				<p class="tag_layout">${fesInfo[0].tags}</p>
			</div>
			<div>
				<div>
					<table>
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
							<td>${fesInfo[0].organizationCode}</td>
						</tr>
						<tr>
							<th scope="row">문의</th>
							<td>${fesInfo[0].telephone}</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div>
				<h3>주변 음식점</h3>
			</div>
			<div>
				<%-- 지도 API 사용 --%>
			</div>
			
			<div>
				<h3>리뷰 N개</h3>
			</div>
			<div>
				<div class="icon_layout">							
					<p>전체 평점</p>
				</div>
				<div class="icon_layout">
					<img src="<c:url value='/resources/img/rating_icon.jpg'/>" alt="평점">
				</div>
				<div class="icon_layout">							
					<p>${fesInfo[0].rating}</p>
				</div>
			</div>
			<div>
				<c:forEach var="review" items="${reviewList}" varStatus="stat">
					
				</c:forEach>
			</div>
		</div>
		<%@ include file="../mobilebottom.jsp"%>
	</body>
</html>