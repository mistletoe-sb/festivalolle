<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>마이페이지</title>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>		
		<%-- 내용 삽입 --%>
		<div class="content title" style="width:90%; margin: auto; margin-top: 3rem; margin-bottom: 3rem;">
			<img src="<c:url value='/resources/img/mobile/festivalollelogo.png'/>" class="card-img-top" alt="축제올래 로고">
		</div>
		<div class="mypage_menu_layout">
			<div class="mypage_menu" onclick="location.href='<c:url value='/mypage/ticketlist'/>'">
				<div class="icon_layout mypage_title">
					<img src="<c:url value='/resources/img/icon/ticket.png'/>" alt="ticket">
					<span>구매내역</span>
				</div>
				<div class="icon_layout">
					<i class="fa-solid fa-angle-right"></i>
				</div>
			</div>
			<div class="mypage_menu" onclick="location.href='<c:url value='/mypage/reviewlist'/>'">
				<div class="icon_layout mypage_title">
					<img src="<c:url value='/resources/img/icon/review_icon.png'/>" alt="리뷰">
					<span>나의리뷰</span>
				</div>
				<div class="icon_layout">
					<i class="fa-solid fa-angle-right"></i>
				</div>
			</div>
			<div class="mypage_menu" onclick="location.href='<c:url value='/bookmark/list'/>'">
				<div class="icon_layout mypage_title">
					<img src="<c:url value='/resources/img/icon/bookmark_icon_empty.png'/>" alt="북마크">
					<span>북마크</span>
				</div>
				<div class="icon_layout">
					<i class="fa-solid fa-angle-right"></i>
				</div>
			</div>
			<div class="mypage_menu" onclick="location.href='<c:url value='/memberauthentication'/>'">
				<div class="icon_layout mypage_title">
					<img src="<c:url value='/resources/img/icon/mypage.png'/>" alt="mypage">
					<span>회원정보</span>
				</div>
				<div class="icon_layout">
					<i class="fa-solid fa-angle-right"></i>
				</div>
			</div>
			<div class="mypage_menu" onclick="location.href='<c:url value='/logout'/>'">
				<div class="icon_layout mypage_title">
					<img src="<c:url value='/resources/img/icon/logout.png'/>" alt="mypage">
					<span>로그아웃</span>
				</div>
				<div class="icon_layout">
					<i class="fa-solid fa-angle-right"></i>
				</div>
			</div>
			<div id="sysTel">축제올래 서비스 관련 문의 : <a href="tel:010-3736-3907">010-3736-3907</a></div>
		</div>
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>