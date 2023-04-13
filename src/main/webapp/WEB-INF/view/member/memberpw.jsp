<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>마이 페이지</title>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>		
		<%-- 내용 삽입 --%>
		
		<div class="content title">
		
		
		<img src="<c:url value='/resources/img/mobile/festivalollelogo_mobile.png'/>" class="card-img-top" alt="축제올래 로고">
		
		<div class="icon">
		<img src="<c:url value='/resources/img/icon/ticket.png'/>" alt="ticket">
		</div>
		<a href="forgot-password.html">구매 내역</a>
		
		<div class="icon">
		<img src="<c:url value='/resources/img/icon/rating_icon_empty.png'/>" alt="리뷰">
		</div>
		<a href="forgot-password.html">나의 리뷰</a>
		
		<div class="icon">
		<img src="<c:url value='/resources/img/icon/bookmark_icon_empty.png'/>" alt="북마크">
		</div>
		<a href="forgot-password.html">북마크</a>
		
		<div class="icon">
		<img src="<c:url value='/resources/img/icon/mypage.png'/>" href=" " alt="mypage">
		</div>
		<a href="forgot-password.html">회원 정보</a>
		
		
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>