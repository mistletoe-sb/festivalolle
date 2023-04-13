<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 로그인</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">축제올래 관리자</h1>
                                    </div>
                                    <hr>
                                    <form class="user" action="<c:url value='/admin'/>" method="post" name="loginfrm">
                                    	
	                                        <div class="form-group">
	                                            <input type="text" class="form-control form-control-user"
	                                            	name="id"
	                                                id="login_id_admin" aria-describedby="emailHelp"
	                                                placeholder="아이디">
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="password" class="form-control form-control-user"
	                                            	name="password"
	                                                id="login_pw_admin" placeholder="비밀번호">
	                                        </div>
                                        
                                        <!-- <a href="index.html" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a> -->
                                        <!-- <a href="javascript:loginfrm.submit();" class="btn btn-primary btn-user btn-block">로그인</a> -->
                                        <input id="adminLogin-btn" class="btn btn-primary btn-user btn-block" value="로그인" />
                                        
                                       
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                   		<a class="small" href="<c:url value='/admin/findid'/>">아이디를 잊으셨나요?</a><br>
                                        <a class="small" href="<c:url value='/admin/forgotpassword'/>">비밀번호를 잊으셨나요?</a><br>
                              			<a class="small" href="<c:url value='/admin/toregister'/>">관리자 등록</a>          
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    
    <script>
 	 //로그인 실행
	$('#adminLogin-btn').click(function(){
		//로그인 실행
		//var emailchk = $('#email_login_overlap_check').val();
		//var pwchk = $('#pw_login_overlap_check').val();
		//console.log(emailchk);
		//console.log(pwchk);
	
			//console.log(emailchk);
			//console.log(pwchk);
			var id = $('#login_id_admin').val();	
			var password = $('#login_pw_admin').val();
			console.log(id);
			
				$.ajax({
					url: "<c:url value='/admin'/>",
					type: "post",
					data: {id: id, password: password},
					success: function(data){
						console.log("성공");
						if(data == 'admin0'){
							window.location.replace("<c:url value='/system/adminlist'/>");																				
						} else if(data == 'admin2') {
							window.location.replace("<c:url value='/admin/festivallist'/>");
						} else if(data == 'admin3') {
							window.location.replace("<c:url value='/ticket/ticketvalidator'/>");
						} else if(data == 'admin4') {
							window.location.replace("<c:url value='/ticket/couponvalidator'/>");							
						} else {
							$('#loginAlert').modal();
							swal('', "아이디, 비밀번호를 확인해주세요.", 'warning');
							//alert("아이디, 비밀번호를 확인해주세요.");	
						}								
					},//end success
					error:function(){
						alert("로그인 실패");
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