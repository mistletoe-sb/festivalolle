<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<style>
		    #preview-image {
		  		object-fit: cover;
				width: 100%;
				height: 100%;

	</style>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>구매 내역</title>
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
		<div class="container-fluid">
				<div class="card mb-3" style="max-width: 540px; ">
					<div class="row g-0">
						<div class="col-md-4">
							<c:choose>
								<c:when test="${img == '1'}">
										<img id="preview-image" class="img-thumbnail" src="<c:url value='/resources/img/null_png.png'/>">
								</c:when>
								<c:otherwise>
										<img id="preview-image" class="img-thumbnail" src="data:image:jpg;base64,${img}"/ aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">${adminfestivalinfo.title}</h5>
								<p class="card-text">유효기간 : ${adminfestivalinfo.startDate} ~ ${adminfestivalinfo.endDate}</p>
								<p class="card-text"><small class="text-muted">
									구매 일자 : ${adminfestivalinfo.purchaseTime}<br>
									구매자 이름 : ${adminfestivalinfo.name}<br>
									전화번호 : ${adminfestivalinfo.mobile}</small>
								</p>
								<p class="card-text"><small class="text-muted">
									금액 : ${adminfestivalinfo.fee}원<br>
									수량 : ${adminfestivalinfo.headCount}개<br>
									총 결제금액 : ${adminfestivalinfo.fee * adminfestivalinfo.headCount}원</small>
								</p>
							</div>
						</div>
					</div>
				</div>
		</div>

		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>