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
	        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
					<form class="user" name="findidfrm" action="./checkacount" method="POST">                                                 
						<div class="form-group">															
							<input class="form-control form-control-user" type="text" id="name" name="name" placeholder="이름">
							<span id="nameAlert" style="color:red" ></span>
						</div>
						<div class="form-group">
							<input class="form-control form-control-user" type="text" id="mobile" name="mobile" placeholder="010-****-****">
							<span id="mobileAlert" style="color:red"></span>
						</div>
						<div class="form-group">
							<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="submit" id="auth" value="다음">
						</div>
					</form>
				</div>
			</div>
			
<c:if test= "${message != null && message != ''}">
   <script>
   swal('입력오류!', "${message}", 'error');
   </script>
</c:if>
<script type="text/javascript">
$(document).ready(function() {

	$("#name").on('change', function() {
		 var name = $("#name").val();
		 if(name=''){
			$("#nameAlert").text("이름을 입력하세요.");
		 }else{
		 	$("#nameAlert").text('');
		 }
	});
	
	$("#mobile").on('change', function() {
		 var mobile = $("#mobile").val();
		 if(mobile=''){
			$("#mobileAlert").text("이름을 입력하세요.");
		 }else{
		 	$("#mobileAlert").text('');
		 }
	});
	
	$("#auth").on('click', function() {
		    var name = $("#name").val();
		    var mobile = $("#mobile").val();
		    

		    if (name == "" && mobile == "") {
		        $("#nameAlert").text("이름을 입력하세요.");
		        $("#mobileAlert").text("전화번호를 입력하세요.");
		        return false;
		    }else if(name == ""){
		    	$("#nameAlert").text("이름을 입력하세요.");
		        $("#mobileAlert").text('');
		        return false;
		    }else if(mobile == ""){
		    	$("#mobileAlert").text("전화번호를 입력하세요.");
		    	$("#nameAlert").text('');
		    	return false;
		    }else{
		    	$("#nameAlert").text('');
		    	$("#mobileAlert").text('');
		    	return true;
		        }
		});
});
</script>
		
 
		

		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>