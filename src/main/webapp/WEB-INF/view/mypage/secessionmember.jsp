<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>회원탈퇴</title>
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

			<div class = "box">
			<h4><strong>탈퇴를 계속 진행 하시겠습니까?</strong></h4><br>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">반드시 확인 해주세요!</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="5" style="height: 10rem; font-size : 0.86rem" disabled>
1. 탈퇴를 진행하시려면 비밀번호를 재확인 하여야 합니다. 
2. 탈퇴 이후 게시물 삭제가 불가능하니 민감한 정보는 미리 삭제 후 탈퇴해주시기 바랍니다. 
3. 탈퇴 이후 해당 계정으로는 재가입이 불가능합니다. 
4. 추가 문의 사항은 탈퇴 이전 관리자에게 문의 바랍니다.
				</textarea>
			</div>
			<form class="user" name="changepwfrm" > 
				<div style ="margin-top:5rem;">
					<div class="form-group">
						<input class="form-control form-control-user" type="password" id="password" placeholder="비밀번호를 입력 하세요." name="password">
					</div>
					<div class="form-group">
						<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="button" id="pass_btn" value="탈퇴하기">
					</div>
				</div>
			</form>
		</div>

		<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
				    	<div class="modal-content">
					    	<div class="modal-header">
					        	<h1 class="modal-title fs-5" id="staticBackdropLabel">정말 탈퇴하시나요?</h1>
					      	</div>
					    <div class="modal-body">
						</div>
					      	<div class="modal-footer">
					      		<button type="submit" id="btn_out" class="btn btn-primary">탈퇴하기</button>
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
					      	</div>
					  	</div>
					</div>
				</div>

    <%@ include file="../mobilemenu/mobilebottom.jsp"%>
    
<script type="text/javascript">

$("#pass_btn").on("click", function(event) {
	  var password = $("#password").val();
	  $.ajax({
	    url: '../countmember', // 서버에서 데이터를 가져올 경로
	    type: 'GET', // GET 방식으로 요청
	    data: { password: password }, // 서버로 보낼 데이터
	    dataType: "json",
	    success: function(data) {
	      if (data == 1) {
	        // 모달 창을 띄웁니다.
	        $("#staticBackdrop .modal-body").text("계정인증이 완료 됐습니다.\n탈퇴를 진행 하시겠습니까?");
	        $("#staticBackdrop").modal("show");
	        
	        // 모달 창의 확인 버튼을 누르면 swal 창이 띄워집니다.
	        $("#btn_out").on("click", function() {
	          swal('탈퇴완료', "탈퇴가 완료 되었습니다.", 'info').then(function() {
	            // 확인 버튼을 눌렀을 때 처리할 내용
	            location.href = "<c:url value='/updateStatus'/>";
	          });
	        });
	      } else if (data == 0) {
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
</body>
</html>