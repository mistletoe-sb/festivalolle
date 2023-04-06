<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>회원탈퇴</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.css" />
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile_member.css'/>"/>
		<script src="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/mobile.js'/>"></script>
		 <!-- Custom fonts for this template-->
	    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	</head>
	<body>
	<%-- 내용 작성:이혜성 --%>
	<%@ include file="../mobilemenu/mobiletop.jsp"%>
	<div class="p-5">
		<%--축제올래 로고 이미지 --%>
			<img src="<c:url value='/resources/img/mobile/festivalollelogo_mobile.png'/>" class="card-img-top" alt="축제올래 로고">
			<h5 class="text-center">탈퇴를 계속 진행 하시겠습니까?</h5><br><br>
			<h6>반드시 확인 해주세요!</h6><br>
			<div class="form-group">
				<ol>
					<li>탈퇴를 진행하시려면 비밀번호를 재확인 하여야 합니다.</li>
					<li>탈퇴 이후 게시물 삭제가 불가능하니 민감한 정보는 미리 삭제 후 탈퇴해주시기 바랍니다.</li>
					<li>탈퇴 이후 해당 계정으로는 재가입이 불가능합니다.</li>
					<li>추가 문의 사항은 탈퇴 이전 QnA로 문의 바랍니다.</li>
				</ol>
			</div>
			<form class="user" name="updatepwfrm" action="./secession" method="POST"> 
			<div class="form-group">
				<input class="form-control form-control-user" type="password" id="password" placeholder="비밀번호" name="password">
			</div>
			<div class="form-group">
				<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="submit" id="findMember" value="다음">
			</div>
		</form>
	</div>
</body>
</html>