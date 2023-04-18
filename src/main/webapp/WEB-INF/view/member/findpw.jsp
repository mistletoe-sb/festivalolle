<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>비밀번호 찾기</title>
		 <!-- Custom fonts for this template-->
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	</head>
	<body>
		<%-- 내용 작성:이혜성 --%>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<div class="p-5">
		<%--축제올래 로고 이미지 --%>
			<img src="<c:url value='/resources/img/mobile/festivalollelogo.png'/>" class="card-img-top" alt="축제올래 로고">
			<h6 class="text-center">찾는 비밀번호의 아이디를 입력해주세요.</h6><br>
				<form class="user" name="findpwfrm" action="./findpw" method="POST"> 
					<div class="form-group">
						<input class="form-control form-control-user" type="text" id="id" name="id" placeholder="아이디 입력">
						<span id="alertId" style="color:red"></span>
					</div>
					<div class="form-group">															
							<input class="form-control form-control-user" type="text" id="name" name="name" placeholder="이름">
							<span id="nameAlert" style="color:red" ></span>
						</div>
						<div class="form-group">
							<input class="form-control form-control-user" type="text" id="mobile" name="mobile" placeholder="010-****-****">
							<span id="mobileAlert" style="color:red"></span>
						</div>
						<div class="form-group">
							<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="submit" id="findNext" value="다음">
						</div>
					
					<div class="text-center">
						아이디가 기억나지 않으시나요?
						<a href="./findid"><br>> 아이디 찾기</a>
					</div>
				</form>
			</div>
<c:if test= "${message != null && message != ''}">
   <script>
   swal('입력오류!', "${message}", 'error');
   </script>
</c:if>					
<script type="text/javascript">
$(document).ready(function() {	
	
	$("#id").on('change', function() {
		var id = $("#id").val();
		if(id == ""){
			$("#alertId").text("아이디를 입력해주세요.");
	        return false;
		}else{
			$("#alertId").text('');
		}
	});
	
	$("#name").on('change', function() {
		var name = $("#name").val();
		if(name == ""){
			$("#nameAlert").text("이름을 입력해주세요.");
	        return false;
		}else{
			$("#nameAlert").text('');
		}
	});
	
	$("#mobile").on('change', function() {
		var mobile = $("#mobile").val();
		if(mobile == ""){
			$("#mobileAlert").text("전화번호를 입력해주세요.");
	        return false;
		}else{
			$("#mobileAlert").text('');
		}
	});

		  $("#findNext").on('click', function() {
			  	var id = $("#id").val();
			    var name = $("#name").val();
			    var mobile = $("#mobile").val();

			    if (id == "" && name == "" && mobile == "") {
			        $("#nameAlert").text("이름을 입력해주세요.");
			        $("#mobileAlert").text("전화번호를 입력해주세요.");
			        $("#alertId").text("아이디를 입력해주세요.");
			        return false;
			    } else if(name == "" && mobile == ""){
			    	$("#alertId").text('');
			    	$("#nameAlert").text("이름을 입력해주세요.");
			        $("#mobileAlert").text("전화번호를 입력해주세요.");
			        return false;
			    }else if(id == "" && mobile == ""){
			    	$("#mobileAlert").text("전화번호를 입력해주세요.");
			        $("#nameAlert").text('');
			        $("#alertId").text("아이디를 입력해주세요.");
					 return false;
			    }else if(id == "" && name == ""){
			    	$("#alertId").text("아이디를 입력해주세요.");
			    	$("#nameAlert").text("이름을 입력해주세요.");
				    return false;
			    }else if(id == ""){
			    	$("#alertId").text("아이디를 입력해주세요.");
			    	$("#nameAlert").text('');
			        $("#mobileAlert").text('');
			        return false;
			    }else if(name == ""){
			    	$("#alertId").text('');
			    	$("#nameAlert").text("이름을 입력해주세요.");
			    	$("#mobileAlert").text('');
			    	 return false;
			    }else if(mobile == ""){
			    	$("#alertId").text('');
			        $("#nameAlert").text('');
			        $("#mobileAlert").text("전화번호를 입력해주세요.");
			        return false;
			    }else{
			    	$("#alertId").text('');
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