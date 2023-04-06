<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>로그인</title>
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
											
										<form class="user">	
											<div class="text-center">
																					
											<p>로그인 하여 축제올래의 <br>다양한 기능을 이용해 보세요</p>
											</div>
											<!-- <div class="text-center">
												<h4 class="h4 text-gray-900 mb-4">
													로그인 하여 축제올래의 <br>다양한 기능을 이용해 보세요
												</h4>
											</div> -->
											
											<div class="form-group">	
												<a href="<c:url value='/login'/>" class="btn btn-primary btn-user btn-block btn-primary-mobile">로그인</a>
											</div>									
											<div class="text-center">
												<a class="small a-mobile" href="<c:url value='/join'/>">아직 축제올래 회원이 아니신가요?<br> >> 회원가입  </a>
											</div>
										</form>	
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

		
		
		
		

		
		
		
		
		
		
		<script>
		
		//로그인 실행
		$('#memberLogin').click(function(){
			
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
								
								//alert("아이디, 비밀번호를 확인해주세요.");	
							}//end if								
						},//end success
						error:function(){
							alert("로그인 실패");
						}//end error														
					})//end 로그인 실행 ajax				
			
		})//end login_btn
		
		
		</script>
		
		
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>