<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>아이디 찾기</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.css" />
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile_member.css'/>"/>
		<script src="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/mobile.js'/>"></script>
		<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">

	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	</head>
	<body>
	<%-- 내용 작성: 이혜성 --%>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<div class="p-5">
		<%--축제올래 로고 이미지 --%>
		<img src="<c:url value='/resources/img/mobile/festivalollelogo_mobile.png'/>" class="card-img-top" alt="축제올래 로고">
			
				<div>
					<h6 class="text-center">회원정보의 전화번호를 입력해주세요.</h6><br>
				</div>
				<div>
					<form class="user" name="loginfrm">                                                            
						<div class="form-group">															
							<label style="padding-right: 30px;">이름</label>
							<input class="form-control form-control-user" type="text" id="name">
							<input type="hidden" id="nameAlert"><br>
						</div>
						<div class="form-group">
							<label >전화번호</label>
							<input class="form-control form-control-user" type="text" id="mobile"placeholder="하이픈(-)과 함께 작성해주세요.">
							<input type="hidden" id="mobileAlert"><br>
							<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="submit" id="auth" value="다음">
						</div> 	
					</form>
				</div>
			</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#name").on('change',function(){
		var name = $("#name").val();
		if(name == ""){
			$("#nameAlert").text("이름을 입력하세요.");
			$("#nameAlert").css("color", "red");
			$("#nameAlert").val('');
			$("#nameAlert").val('');
				return false;
				}else{
					return true;
			}
		});
	
	$("#mobile").on('change',function(){
		var mobile = $("#mobile").val();
		if(mobile == ""){
			$("#mobileAlert").text("전화번호를 입력하세요.");
			$("#mobileAlert").css("color", "red");
			$("#mobileAlert").val('');
			$("#mobileAlert").val('');
				return false;
				}else{
					return true;
			}
		});
	
	$("#auth").on('click',function(){
		var auth = $("#auth").val();
		if(mobile == ""){
			return false;
		}else if(조건:회원 정보랑 같아야 함){
			location.href="./idinfo"
			return true;
		}
	});
}
</script>
		
		
		

		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>