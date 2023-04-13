<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>비밀번호 변경</title>
		 <!-- Custom fonts for this template-->
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
		<%--축제올래 로고 이미지 --%>
		<img src="<c:url value='/resources/img/mobile/festivalollelogo_mobile.png'/>" class="card-img-top" alt="축제올래 로고">
		
		<h6 class="text-center">새로운 비밀번호로 재설정해주세요.</h6><br>
			<form class="user" name="updatepwfrm" action="./updatepw" method="POST"> 
				<div class="form-group">
					<input class="form-control form-control-user" type="password" id="newPassword" placeholder="새로운 비밀번호를 입력해주세요." name="password">
					<span id="PasswordChekAlert" style="color:red"></span>
				</div>
				<div class="form-group">
					<input class="form-control form-control-user" type="password" id="dupChek" placeholder="비밀번호 확인" size="16" required>
					<span id="dupChekAlert" style="color:red"></span>
				</div>
				<div class="form-group">
					<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="submit" id="updatePw" value="비밀번호 변경">
				</div>
			</form>
		</div>
<script type="text/javascript">
$(document).ready(function() {
	
	  $('#newPassword').on('change', function() {
		  var pw = $("#newPassword").val();
		  if(pw=""){
			$("#PasswordChekAlert").text("비밀번호가 동일하지 않습니다.");
		  }else{
			  $("#PasswordChekAlert").text('');  
		  }
	  });
	
	  $('#dupChek').on('change', function() {
	    var pw = $("#newPassword").val();
	    var pwChk = $("#dupChek").val();
		if (pw != pwChk) {
	      console.log('비밀번호 비동일')
	      $("#dupChekAlert").text("비밀번호가 동일하지 않습니다.");
	      return false;
	    } else {
	      console.log('비밀번호 동일')
	      $("#PasswordChekAlert").text('');
	      $("#dupChekAlert").text('');
	    }
	  });

	  $('#updatePw').on('click', function() {
	    console.log('비밀번호 변경확인');
	    var pw = $("#newPassword").val();
	    var pwChk = $("#dupChek").val();
	  if(pw=="" && pwChk==""){
		$("#PasswordChekAlert").text("비밀번호룰 입력해주세요.");
		$("#dupChekAlert").text("비밀번호를 재입력해주세요.");
		$("#newPassword").focus().val();
		return false;
	  }else if(pwChk==""){
		$("#dupChekAlert").text("비밀번호룰 재입력해주세요.");
		$("#PasswordChekAlert").text('');
		$("#dupChekAlert").focus().val();
		return false;
	  }else if(pw == pwChk){
	    swal('확인완료!', "비밀번호가 변경되었습니다.", 'success');
	  }else{
		swal('변경실패!', "비밀번호가 동일하지 않습니다.", 'warning');
		 $("#newPassword").val('');
		 $("#dupChek").val('');
		 return false;
	  }
	});
 });


 
</script>


		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
</body>
</html>