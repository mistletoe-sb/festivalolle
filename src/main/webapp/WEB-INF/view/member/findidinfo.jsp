<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>아이디 찾기</title>
		 <!-- Custom fonts for this template-->
	    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">

	        
	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	</head>
	<body class="bg-gradient-primary-mobile">
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<%-- 내용 작성:이혜성 --%>
		<div class="p-5">
		<%--축제올래 로고 이미지 --%>
		<img src="<c:url value='/resources/img/mobile/festivalollelogo.png'/>" class="card-img-top" alt="축제올래 로고">
		
		<h6 class="text-center">고객님의 정보와 일치하는 아이디입니다.</h6><br>
			<form class="user" name="idinfofrm" action="./idinfo" method="GET"> 
				<div class="form-group">
					<input class="form-control form-control-user" type="text" id="idInfo" name="id" readonly value="${resultId.id}"><br>
					<a href="./login">
					<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="button" id="goLogin" value="로그인"></a>
				</div>
				<div class="text-center">
					비밀번호가 기억나지 않으시나요?
					<a href="./findpw"><br>> 비밀번호 찾기</a>
				</div>
			</form>
		</div>

		
				<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>