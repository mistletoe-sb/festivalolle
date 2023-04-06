<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>비밀번호 찾기</title>
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
			<h6 class="text-center">찾는 비밀번호의 아이디를 입력해주세요.</h6><br>
				<form class="user" name="findpwfrm" action="./findpw" method="POST"> 
					<div class="form-group">
						<label>아이디</label>
						<input class="form-control form-control-user" type="text" id="id" name="id" placeholder="아이디 입력">
						<span id="alertId" style="color:red"></span>
						<br><input type="submit" class="btn btn-primary btn-user btn-block btn-primary-mobile" id="findPwNext" value="다음">
					</div>
					<div class="text-center">
						아이디가 기억나지 않으시나요?
						<a href="./findid"><br>> 아이디 찾기</a>
					</div>
				</form>
			</div>		
<script type="text/javascript">
$(document).ready(function() {	
	$("#findPwNext").on('click', function(){
		var id = $("#id").val();
		  if (id == ""){	
			$("#alertId").text("아이디를 입력해주세요.");
			$("#alertId").css("color", "red");
		    return false;
		  }else{
			$("#alertId").val('');
			return true;
		  }
	});
});

</script>




		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>