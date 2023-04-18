<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="mobilemenu/mobileinclude.jsp"%>
		<title>축제올래</title>
	</head>
	<body>
		<c:if test="${not empty isInit}">
			<div id="festivalolle"><img src="<c:url value='/resources/img/festivalolle.png'/>" alt="festivalolle"></div>
		</c:if>
		<%@ include file="mobilemenu/mobiletop.jsp"%>
		<%-- 추천목록 출력할 레이아웃 --%>
		<div class="recommend_list_layout">
			<div id="recommend_carousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<div class="indicator_background">
						<c:forEach var="item" items="${recommendList}" varStatus="page">
							<c:choose>
								<c:when test='${page.index == 0}'>
									<button type="button" data-bs-target="#recommend_carousel" data-bs-slide-to="${page.index}" class="active" aria-current="true"></button>
								</c:when>
								<c:otherwise>
									<button type="button" data-bs-target="#recommend_carousel" data-bs-slide-to="${page.index}"></button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
				<div class="carousel-inner">
					<c:forEach var="fes" items="${recommendList}" varStatus="stat">
						<c:choose>
							<c:when test='${stat.index == 0}'>
								<div class="carousel-item active" data-bs-interval="8000">
									<div class="d-block w-100 recommend_div"
									onclick="location.href='<c:url value="/festival/info?festivalCode=${fes.festivalCode}"/>'">
										<img src="<c:url value='/resources/img/mobile/empty_image.png'/>" class="recommend_img" alt="${fes.festivalCode}">				  	
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item" data-bs-interval="8000">
									<div class="d-block w-100 recommend_div"
									onclick="location.href='<c:url value="/festival/info?festivalCode=${fes.festivalCode}"/>'">
										<img src="<c:url value='/resources/img/mobile/empty_image.png'/>" class="recommend_img" alt="${fes.festivalCode}">				  	
									</div>
								</div>							
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>
		<%-- 카테고리별 축제 목록 출력할 레이아웃 --%>
		<div class="default_horizontal_layout">
			<div class="category_title">
				<div>
					<h3>이번 주 HOT</h3>
				</div>
			</div>
		</div>
		<div class="default_horizontal_layout">
			<div class="category_title">
				<div>
					<h3>축제 NOW</h3>
				</div>
			</div>
		</div>
		<div class="default_horizontal_layout">
			<div class="category_title">
				<div>
					<h3>COMING SOON</h3>
				</div>
			</div>
		</div>
		<%@ include file="mobilemenu/mobilebottom.jsp"%>
	</body>
</html>