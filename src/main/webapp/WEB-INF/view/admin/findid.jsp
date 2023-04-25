<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>아이디 찾기</title>
	<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon" sizes="16x16">
    <!-- Custom fonts for this template-->
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<style>
		.bg-login-image {
			background: #FFFFFF !important;
		}
	</style>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image">
                            	<img src="<c:url value='/resources/img/festivalolle.png'/>">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1>                                        
                                    </div>
                                    <hr>
                                    <div id="findid-hide">
	                                    <form class="user">
	                                        <div class="form-group">
	                                            <input type="text" class="form-control form-control-user"
	                                                id="findid_name" 
	                                                placeholder="이름">
	                                                
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="text" class="form-control form-control-user"
	                                                id="findid_tel" type="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required
	                                                placeholder="연락처 010-0000-0000">
	                                        </div>
	                                        <a id="findid-btn" class="btn btn-primary btn-user btn-block">
	                                            확인
	                                        </a>
	                                    </form>
                                    </div>
                                    
                                    <div id="findid-result" hidden="true">
	                                    <form class="user">
	                                        <div class="text-center">
		                                       <!-- <h5 class="h5 text-gray-900 mb-2">고객님의 정보와 일치하는 아이디 입니다.</h5>     -->                                    
		                                    	<h5 class="h5 text-gray-900 mb-2"><label id ="id-result"></label></h5>
		                                    </div>
		                                    <hr>
	                                        <a href="<c:url value='/admin'/>" class="btn btn-primary btn-user btn-block">
	                                            로그인
	                                        </a>
	                                        <a href="<c:url value='/admin/forgotpassword'/>" class="btn btn-primary btn-user btn-block">
	                                            비밀번호 변경
	                                        </a>
	                                    </form>
                                    </div>
    
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="<c:url value='/admin/toregister'/>">새로운 계정을 만드세요!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="<c:url value='/admin'/>">이미 계정을 가지고 계신가요? 로그인하세요!</a>
                                    </div>
                              
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
    </script>
    <script type="text/javascript">
	    (function(){
	        emailjs.init("fN61BcIJKNzF_iQYj");
	    })();
    </script>
    <script>
    	function sendMail(){
    		var params = {
    				from_name: document.getElementById("fullName").value,
    				email_id: document.getElementById("email_id").value, 
    	            message: document.getElementById("message").value
    		};
    		emailjs.send("service_zyvayz8", "template_3st3o98", params).then(function (res) {
                alert("Sucess! " + res.status);
    		})
    		
    	}   
    </script>
    
    <script>
   		$('#findid-btn').on('click', function(){
		
   			var name = $('#findid_name').val();
   			var telephone = $('#findid_tel').val();
			console.log(name);
			
				$.ajax({
					url: "<c:url value='/admin/findid'/>",
					type: "post",
					data: {name: name, telephone: telephone},
					success: function(data){
						console.log("성공");
						if(data == 'fail'){
							swal('', "가입된 관리자 계정이 없습니다.", 'warning')																				
						} else {
							console.log('이상' + data);
							$("#findid-hide").hide();
							$('#findid-result').attr('hidden', false);
							$('#id-result').text(data);
							
						} 								
					},//end success
					error:function(){
						alert("아이디 없음");
					}//end error
				})//end 로그인 실행 ajax				
		
	})//end login_btn
    
    
    </script>
    
    
    
    

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>

</body>

</html>