<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>축제올래</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.css" />
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>"/>
		<script src="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/mobile.js'/>"></script>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>

		<div class="recommend_list_layout">
			<div id="recommend_carousel" class="carousel slide" data-bs-ride="carousel">

				<div class="carousel-inner">
					<c:forEach var="fes" items="${recommendList}" varStatus="stat">
						<c:choose>
							<c:when test='${stat.index == 0}'>
								<div class="carousel-item active" data-bs-interval="8000">
									<div class="d-block w-100">
										<%@ include file="../mypage/festivalcard.jsp"%>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item" data-bs-interval="8000">
									<div class="d-block w-100">
										<%@ include file="../mypage/festivalcard.jsp"%>
									</div>
								</div>							
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>

		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>