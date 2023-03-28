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

    <title>관리자 등록</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <!-- "<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" -->
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

    <div class="container">
<!-- 아이디, 비밀번호, 비밀번호 확인, 기관명(지자체or 기업), 기관주소, 담당자명, 담당자 연락처 -->
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            
                            <%-- action="<c:url value='admin/register'/>" method="post"  --%>
                            <form class="user">                                                             
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="register_id"
                                        placeholder="아이디">
                                </div>                               
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="register_pw" placeholder="비밀번호">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="register_pw_chk" placeholder="비밀번호 확인">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="organization_name"
                                        placeholder="기관명" list="organizationSearch" autocomplete="off">
                                    <datalist id="organizationSearch">
                                    	<option value="서울특별시청"/>
                                    	<option value="부산광역시청"/>
                                    	<option value="대구광역시동인청사"/>
                                    	<option value="대구광역시산격청사"/>
                                    	<option value="인천광역시"/>
                                    	<option value="대전광역시청"/>
                                    	<option value="울산광역시청"/>
                                    	<option value="세종특별자치시청"/>
                                    	<option value="경기도청"/>
                                    	<option value="경기도북부청사"/>
                                    	<option value="강원도청"/>
                                    
                                    
                                    </datalist>
                                        
                                    
                                    <input type="hidden" name="organizationCode" id="organization_code" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="register_name"
                                        placeholder="담당자명">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="register_telephone"
                                        placeholder="연락처">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="register_email"
                                        placeholder="이메일">
                                </div>
                                
                                <a class="btn btn-primary btn-user btn-block" id="registerAdmin">
                                    관리자 가입 신청
                                </a>                           
                                <hr>                                
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>



	<script>
	/* 관리자 등록 신청 */
	$("#registerAdmin").click(function(){	
		var register_id = $('#register_id').val();
		var register_pw = $('#register_pw').val();
		var organization_code = $('#organization_code').val();
		var register_name = $('#register_name').val();
		var register_telephone = $('#register_telephone').val();
		var register_email = $('#register_email').val();
		
		
		
		var param = {"id":register_id, "password":register_pw, "organizationCode":organization_code, "name":register_name, "telephone":register_telephone, "email":register_email}
		//JSON.stringify(param),
		
		console.log();
		
		$.ajax({
			url: "<c:url value='/admin/register'/>",
			type: "post",
			contentType: 'application/json',
			data: JSON.stringify(param),
			success: function(data){
				if(data == 'ok'){
					window.location.replace("<c:url value='/admin'/>");
					alert("가입 신청이 완료되었습니다.");					
				} else {
					alert("신청 불가");
				}//end if
			},//end success
			error:function(){
				alert("신청 실패");
			}, 
			complete : function () {   // 정상이든 비정상인든 실행이 완료될 경우 실행될 함수
				//$('#matchEmail2').val("");
			}		
		})//end ajax	
	})//end changepw_btn
	
	$('#organization_name').blur(function(){
		var organizationName = $('#organization_name').val();
		
		//기관명 입력 받아서 기관 코드 가져옴
		$.ajax({
			url: "<c:url value='/admin/organizationcode'/>",
			type: "post",
			data: {organizationName: organizationName},
			success: function(data){
				$('#organization_code').val(data);							
			},//end success
			error:function(){
				alert("기관 코드 없음");
			}//end error														
		})//end 기관코드ajax		
	})
	
	
	</script>

</body>

</html>