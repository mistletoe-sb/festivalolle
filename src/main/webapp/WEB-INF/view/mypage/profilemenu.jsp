<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
<!DOCTYPE html>



<html>

<style>
.mypagemenu{
	width:90%; 
	height : 2.0rem;
	margin: auto; 
	border-bottom: 0.1rem solid #C4C4C4; 
	margin-bottom: 0.7rem; 
	padding-bottom: 0.3rem;
	margin-top: 3rem;
	
}
.mypageimg{
	width:1.5rem;
	margin-right : 0.5rem;
}
.mypageimg2{
	width:1.2rem;
	margin-right : 0.5rem;
}
</style>
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
		
		<div style="width:80%;  margin: auto; margin-top: 10rem;" >
			<div class="mypagemenu" onclick="location.href='<c:url value='/memberupdateform/'/>'">
				<div>
					<div style="float:left;">
						<h5 style="margin:0">프로필 수정</h5>
					</div>
					<div class="icon" style="float:right;">
					<img class="mypageimg2" src="<c:url value='/resources/img/icon/arrow.png'/>" alt="ticket">
				</div>
				</div>
			</div>
			<div style="clear:both;"></div>
			<div style="clear:both;" class="mypagemenu" onclick="location.href='<c:url value='/passwordupdateform/'/>'">
				<div style="float:left;">
					<h5 style="margin:0">비밀번호 변경</h5>
				</div>
				<div class="icon" style="float:right;">
					<img class="mypageimg2" src="<c:url value='/resources/img/icon/arrow.png'/>" alt="ticket">
				</div>
			</div>
			<div style="clear:both;"></div>
			<div class="mypagemenu" onclick="location.href='<c:url value='/secessionmemberform/'/>'">
				<div style="float:left;">
					<h5 style="margin:0">탈퇴하기</h5>
				</div>
				<div class="icon" style="float:right;">
					<img class="mypageimg2" src="<c:url value='/resources/img/icon/arrow.png'/>" alt="ticket">
				</div>
			</div>
		</div>
		
		
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>