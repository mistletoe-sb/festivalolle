<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>마이 페이지</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.css" />
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile_member.css'/>"/>
		<script src="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/mobile.js'/>"></script>
		
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>		
		<%-- 내용 삽입 --%>
		
		<div class="content title">
		
		
		<img src="<c:url value='/resources/img/mobile/festivalollelogo_mobile.png'/>" class="card-img-top" alt="축제올래 로고">
		
		<div class="icon">
		<%-- <img src="<c:url value='/resources/img/icon/ticket.png'/>" alt="ticket"> --%>
		</div>
		<a href="<c:url value='/mypage/ticketlist'/>">구매 내역</a>
		
		<div class="icon">
		<%-- <img src="<c:url value='/resources/img/icon/rating_icon_empty.png'/>" alt="리뷰"> --%>
		</div>
		<a href="<c:url value='/mypage/reviewlist'/>">나의 리뷰</a>
		
		<div class="icon">
		<%-- <img src="<c:url value='/resources/img/icon/bookmark_icon_empty.png'/>" alt="북마크"> --%>
		</div>
		<a href="forgot-password.html">북마크</a>
		
		<div class="icon">
		<%-- <img src="<c:url value='/resources/img/icon/mypage.png'/>" href=" " alt="mypage"> --%>
		</div>
		<a href="forgot-password.html">회원 정보</a>
		
		
		<br>
		<br>
		<br>
		<br>
		<br>
		<a href="<c:url value='/logout'/>">로그 아웃</a>
		
		
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>