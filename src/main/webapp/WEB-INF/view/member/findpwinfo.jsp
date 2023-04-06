<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>비밀번호 변경</title>
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
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">

	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	</head>
	<body class="bg-gradient-primary-mobile">
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<%-- 내용 작성: 이혜성 --%>
		<div class="p-5">
		<h6 class="text-center">새로운 비밀번호로 재설정해주세요.</h6><br>
			<form class="user" name="updatepwfrm" action="./updatepw" method="POST"> 
				<div class="form-group">
					<input class="form-control form-control-user" type="password" id="newPassword" placeholder="새로운 비밀번호를 입력해주세요."><br>
					<span id="PasswordChekAlert" name="password"></span>
					<input class="form-control form-control-user" type="password" id="dupChek" placeholder="비밀번호 확인" size="16" required><br>
					<span id="dupChekAlert"></span>
					<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="submit" id="updatePw" value="비밀번호 변경">
				</div>
			</form>
		</div>
<script type="text/javascript">
$(document).ready(function() {
		$('#newPassword').on('change',function(){
			var pw = $("#newPassword").val();
			var pwChk = $("#dupChek").val();
			if(pw == ""||pw.length < 16){
				$("#PasswordChekAlert").text("비밀번호를 16자 이상 설정해주세요.");
				$("#PasswordChekAlert").css("color", "red");
				$("#newPassword").val('');
				$("#dupChek").val('');
				return false;
				}else if(pw.length = 16){
			$("#PasswordChekAlert").text('');
				}
			}else if(pw != pwChk){
					$("#dupChekAlert").text("비밀번호가 동일하지 않습니다.");
					$("#dupChekAlert").css("color", "red");
					$("#dupChek").val('');
					$("#dupChek").focus();
					return false;
				}else{
					$("#dupChekAlert").text("비밀번호가 동일합니다.");
					$("#dupChekAlert").css("color", "green");
					
					$('#updatePw').on('click',function(){
						alert("비밀번호가 변경되었습니다.");
						window.location.href ="./login"
					});
					return true;
				}
		});
		

});
</script>


		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
</body>
</html>