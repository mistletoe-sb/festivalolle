<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<%-- 내용 삽입 --%>
		<h6 class="text-center">새로운 비밀번호로 재설정해주세요.</h6><br>
			<form class="user" name="changepwfrm" action="./changepw" method="POST"> 
				<div class="form-group">
					<input class="form-control form-control-user" type="password" id="newPassword" placeholder="새로운 비밀번호를 입력해주세요." name="password">
					<span id="PasswordChkAlert" style="color:red"></span>
				</div>
				<div class="form-group">
					<input class="form-control form-control-user" type="password" id="dupChk" placeholder="비밀번호 확인" size="16" required>
					<span id="dupChkAlert" style="color:red"></span>
				</div>
				<div class="form-group">
					<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="submit" id="changePw" value="비밀번호 변경">
				</div>
			</form>
<script type="text/javascript">
$(document).ready(function() {
	
	  $('#newPassword').on('change', function() {
		  var pw = $("#newPassword").val();
		  if(pw=""){
			$("#PasswordChkAlert").text("비밀번호가 동일하지 않습니다.");
		  }else{
			  $("#PasswordChkAlert").text('');  
		  }
	  });
	
	  $('#dupChk').on('change', function() {
	    var pw = $("#newPassword").val();
	    var pwChk = $("#dupChk").val();
		if (pw != pwChk) {
	      console.log('비밀번호 비동일')
	      $("#dupChkAlert").text("비밀번호가 동일하지 않습니다.");
	      return false;
	    } else {
	      console.log('비밀번호 동일')
	      $("#PasswordChkAlert").text('');
	      $("#dupChkAlert").text('');
	    }
	  });

	  $('#updatePw').on('click', function() {
	    console.log('비밀번호 변경확인');
	    var pw = $("#newPassword").val();
	    var pwChk = $("#dupChk").val();
	  if(pw=="" && pwChk==""){
		$("#PasswordChkAlert").text("비밀번호룰 입력해주세요.");
		$("#dupChkAlert").text("비밀번호를 재입력해주세요.");
		$("#newPassword").focus().val();
		return false;
	  }else if(pwChk==""){
		$("#dupChkAlert").text("비밀번호룰 재입력해주세요.");
		$("#PasswordChkAlert").text('');
		$("#dupChkAlert").focus().val();
		return false;
	  }else if(pw == pwChk){
	    alert("비밀번호가 변경되었습니다.");
	  }else{
		alert("비밀번호가 동일하지 않습니다.");
		 $("#newPassword").val('');
		 $("#dupChk").val('');
		 return false;
	  }
	});
 });


 
</script>