<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>마이페이지</title>
		<style>
		.mypagemenu{
			width:90%; 
			height : 2.0rem;
			margin: auto; 
			border-bottom: 0.1rem solid #C4C4C4; 
			margin-bottom: 0.7rem; 
			padding-bottom: 0.3rem;
			margin-top: 0.5rem;
		}
		.mypageimg{
			width:1.5rem;
			margin-right : 0.5rem;
		}
		.mypageimg2{
			width:1.2rem;
			margin-right : 0.5rem;
		}
		#loading {
		 width: 100%;   
		 height: 100%;   
		 top: 0px;
		 left: 0px;
		 position: fixed;   
		 display: block;   
		 opacity: 0.7;   
		 background-color: #fff;   
		 z-index: 99;   
		 text-align: center; }  
		#loading-image {   
		 position: absolute;   
		 top: 50%;   
		 left: 50%;  
		 z-index: 100; } 
		</style>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>		
		<%-- 내용 삽입 --%>
		
		
		<div class="content title" style="width:90%; margin: auto; margin-top: 3rem; margin-bottom: 3rem;">
		<img src="<c:url value='/resources/img/mobile/festivalollelogo.png'/>" class="card-img-top" alt="축제올래 로고">
		</div>
		
		<div style="width:80%;  margin: auto;" >
			<div class="mypagemenu" onclick="location.href='<c:url value='/mypage/ticketlist'/>'">
				<div>
					<div class="icon" style="float:left;">
						<img class="mypageimg" src="<c:url value='/resources/img/icon/ticket.png'/>" alt="ticket">
					</div>
					<div style="float:left;">
						<h5 style="margin:0">구매내역</h5>
					</div>
					<div class="icon" style="float:right;">
						<img class="mypageimg2" src="<c:url value='/resources/img/icon/arrow.png'/>" alt="ticket">
					</div>
				</div>
			</div>
			<div style="clear:both;"></div>
			<div style="clear:both;" class="mypagemenu" onclick="location.href='<c:url value='/mypage/reviewlist'/>'">
				<div class="icon" style="float:left;">
					<img class="mypageimg" src="<c:url value='/resources/img/icon/review_icon.png'/>" alt="리뷰">
				</div>
				<div style="float:left;">
					<h5 style="margin:0">나의리뷰</h5>
				</div>
				<div class="icon" style="float:right;">
					<img class="mypageimg2" src="<c:url value='/resources/img/icon/arrow.png'/>" alt="ticket">
				</div>
			</div>
			<div style="clear:both;"></div>
			<div class="mypagemenu" onclick="location.href='<c:url value='/bookmark/list'/>'">
				<div class="icon" style="float:left;">
					<img class="mypageimg" src="<c:url value='/resources/img/icon/bookmark_icon_empty.png'/>" alt="북마크">
				</div>
				<div style="float:left;">
					<h5 style="margin:0"> 북마크 </h5>
				</div>
				<div class="icon" style="float:right;">
					<img class="mypageimg2" src="<c:url value='/resources/img/icon/arrow.png'/>" alt="ticket">
				</div>
			</div>
			<div style="clear:both;"></div>
			<div class="mypagemenu" onclick="location.href='<c:url value='/memberauthentication'/>'">
				<div class="icon" style="float:left;">
					<img class="mypageimg" src="<c:url value='/resources/img/icon/mypage.png'/>" href=" " alt="mypage">
				</div>
				<div style="float:left;">
					<h5 style="margin:0">회원정보</h5>
				</div>
				<div class="icon" style="float:right;">
					<img class="mypageimg2" src="<c:url value='/resources/img/icon/arrow.png'/>" alt="ticket">
				</div>
			</div>
			<div style="clear:both;"></div>
			<div class="mypagemenu" onclick="location.href='<c:url value='/logout'/>'">
				<div class="icon" style="float:left;">
					<img class="mypageimg" src="<c:url value='/resources/img/icon/logout.png'/>" href=" " alt="mypage">
				</div>
				<div style="float:left;">
					<h5 style="margin:0">로그아웃</h5>
				</div>
				<div class="icon" style="float:right;">
					<img class="mypageimg2" src="<c:url value='/resources/img/icon/arrow.png'/>" alt="ticket">
				</div>
		
			</div>
		</div>
		
		
		<%-- <div id="loading"><img id="loading-image" src="<c:url value='/resources/img/mobileicon/festivalolle.png'/>" alt="Loading..." /></div> --%>
		
		<%-- <script type="text/javascript">
			$(window).load(function() {     
			    $('#loading').hide();   
			   }); 
			</script> --%>
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>