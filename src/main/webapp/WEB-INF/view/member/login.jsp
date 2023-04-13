<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>로그인</title>
		 <!-- Custom fonts for this template-->
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">

	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
			

		
	</head>
	<body class="bg-gradient-primary-mobile">
		<%@ include file="../mobilemenu/mobiletop.jsp"%>		
		<%-- 내용 삽입 --%>
		<!--  <div class="container">-->
			

	        <!-- Outer Row -->
	        <!--  <div class="row justify-content-center">-->
	        
	        	
	            <div class="col-xl-10 col-lg-12 col-md-9">	
	            
	                <div class="card o-hidden border-0 my-5 shadow-lg-mobile">
	                    <div class="card-body p-0">		
							<div class="row">
								<div class="col-lg-6">
	                                <div class="p-5">
										<%--축제올래 로고 이미지 --%>
										<img src="<c:url value='/resources/img/mobile/festivalollelogo_mobile.png'/>" class="card-img-top" alt="축제올래 로고">
										<%-- <form class="user" action="<c:url value='/login'/>" method="post" name="loginfrm"> --%> 
										<form class="user"  name="loginfrm">                                                            
											<div class="form-group">
												<input type="text" class="form-control form-control-user" id="login_id" placeholder="아이디를 입력하세요.." size="20" required>			
											</div>      											
											<div class="form-group">
												<input type="password" class="form-control form-control-user" id="login_pw" placeholder="비밀번호를 입력하세요.." size="16" required>     											
											</div> 											
											<!-- <input type="submit" id="memberLogin" class="btn btn-primary btn-user btn-block btn-primary-mobile" value="로그인" /> -->                       											
											<input  id="memberLogin" class="btn btn-primary btn-user btn-block btn-primary-mobile" value="로그인" /> 
										</form>
										
										<div class="text-center">	
											<a class="small a-mobile" href="./findid">아이디 찾기</a>
										</div>
										<div class="text-center">
											<a class="small a-mobile" href="./findpw">비밀번호 변경</a>
										</div>
										<div class="text-center">
											<a class="small a-mobile" href="<c:url value='/join'/>">회원 가입</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!--  </div>-->
		<!--  </div>-->
		
		
		
		
		<!-- Logout Modal-->
	    <div class="modal fade" id="loginAlert" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel"></h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <div class="modal-body">아이디, 비밀번호를 확인해주세요.</div>
	                <div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
	                </div>
	            </div>
	        </div>
	    </div>
		
		
		
		
		
		
		<script>
		
		//로그인 실행
		$('#memberLogin').click(function(){
			//로그인 실행
			//var emailchk = $('#email_login_overlap_check').val();
			//var pwchk = $('#pw_login_overlap_check').val();
			//console.log(emailchk);
			//console.log(pwchk);
		
				//console.log(emailchk);
				//console.log(pwchk);
				var id = $('#login_id').val();	
				var password = $('#login_pw').val();
				console.log(id);
				
					$.ajax({
						url: "<c:url value='/login'/>",
						type: "post",
						data: {id: id, password: password},
						success: function(data){
							if(data == 'ok'){
								window.location.replace("/festivalolle/home");																				
							} else {
								$('#loginAlert').modal();
								swal('', "아이디, 비밀번호를 확인해주세요.", 'warning');
								//alert("아이디, 비밀번호를 확인해주세요.");	
							}//end if								
						},//end success
						error:function(){
							alert("로그인 실패");
						}//end error														
					})//end 로그인 실행 ajax				
			
		})//end login_btn
		
		
		</script>
		
		<!-- alert -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>