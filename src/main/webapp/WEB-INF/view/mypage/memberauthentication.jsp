<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>회원정보</title>
		<style>
		.mypagemenu{
			width:90%; 
			height : 2.0rem;
			margin: auto; 
			border-bottom: 0.1rem solid #C4C4C4; 
			margin-bottom: 0.7rem; 
			padding-bottom: 0.3rem;
			
		}
		.mypageimg{
			width:1.5rem;
			margin-right : 0.5rem;
		}
		
		.box{
			margin : 5rem 2rem;
		}
		</style>
		 <!-- Custom fonts for this template-->
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<%-- 내용 삽입 --%>
		<div class = "box">
			<h4><strong>계정 인증이 필요합니다.<br>
						비밀번호를 재입력 해주세요.</strong></h4><br>
			<form class="user" name="changepwfrm" > 
				<div style ="margin-top:5rem;">
					<div class="form-group">
						<input class="form-control form-control-user" type="password" id="password" placeholder="비밀번호를 입력 하세요." name="password">
					</div>
					<div class="form-group">
						<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="button" id="pass_btn" value="인증완료">
					</div>
				</div>
			</form>
		</div>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
	
<script type="text/javascript">

$("#pass_btn").on("click", function(event) {
	var password = $("#password").val();
    $.ajax({
        url: './countmember', // 서버에서 데이터를 가져올 경로
        type: 'GET', // GET 방식으로 요청
        data: { password: password }, // 서버로 보낼 데이터
        dataType: "json",
        success: function(data) {
        	if(data==1){
        		swal('인증완료!', "계정인증이 완료 됐습니다!", 'success').then(function() {
        		    // 확인 버튼을 눌렀을 때 처리할 내용
        		    location.href = "<c:url value='/profilemenu'/>";
        		});
        	} else if (data ==0) {
        		swal('인증실패!', "비밀번호를 다시 확인 해주세요!", 'warning');
        		
        	}
            
        },
        error: function() {
            // AJAX 요청이 실패한 경우 에러 처리
        	swal('입력 오류!', "입력하신 정보를 다시 확인해주세요.", 'error');
        }
    });
});

 
</script>