<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="mobilemenu/mobileinclude.jsp"%>
		<title>축제올래</title>
		<%-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.css" />
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>"/>
		<script src="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/mobile.js'/>"></script> --%>
	</head>
	<body>
		<%@ include file="mobilemenu/mobiletop.jsp"%>
		<%-- 추천목록 출력할 레이아웃 --%>
		<div class="recommend_list_layout">
			<div id="recommend_carousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
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
				<div class="carousel-inner">
					<c:forEach var="fes" items="${recommendList}" varStatus="stat">
						<c:set var="img" value="${recommendListImages[stat.index]}"/>
						<c:choose>
							<c:when test='${stat.index == 0}'>
								<div class="carousel-item active" data-bs-interval="8000">
									<div class="d-block w-100 recommend_div"
									onclick="location.href='<c:url value="/festival/info?festivalCode=${fes.festivalCode}"/>'">
										<%-- <img src="data:image:jpg;base64,${img}" class="recommend_img" alt="loading failed">	 --%>			  	
										<%-- <img src="<c:url value='/image/${fes.festivalCode}'/>" class="recommend_img" alt="${fes.festivalCode}">	 --%>			  	
										<img src="#" class="recommend_img" alt="${fes.festivalCode}">				  	
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item" data-bs-interval="8000">
									<div class="d-block w-100 recommend_div"
									onclick="location.href='<c:url value="/festival/info?festivalCode=${fes.festivalCode}"/>'">
										<%-- <img src="data:image:jpg;base64,${img}" class="recommend_img" alt="${fes.festivalCode}"> --%>				  	
										<img src="#" class="recommend_img" alt="${fes.festivalCode}">				  	
									</div>
								</div>							
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>
		<%-- 기본목록(진행 중인 축제) 출력할 레이아웃 --%>
		<div class="default_list_layout">
			<div>
				<h3>진행 중인 축제</h3>
			</div>
			<c:forEach var="fes" items="${defaultList}" varStatus="stat">
				<c:set var="img" value="${defaultListImages[stat.index]}"/>
				<%@ include file="festival/festivalcard.jsp"%>
			</c:forEach>
		</div>
		<%-- <div class="default_horizontal_layout">
			<div class="category_title">
				<h3>이번 주 HOT 축제</h3>
			</div>
			<div class="horizontal_container" style="overflow-x: overlay;width:100vmin;display:flex;">
				<c:forEach var="fes" items="${defaultList}" varStatus="stat">
					<c:set var="img" value="${defaultListImages[stat.index]}"/>
						<div style="width: 84vmin;">
							<%@ include file="festival/festivalcard.jsp"%>
						</div>
				</c:forEach>
			</div>
		</div> --%>
		<%@ include file="mobilemenu/mobilebottom.jsp"%>
	</body>
</html>