<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon" sizes="16x16">
    <!-- Custom fonts for this template-->
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
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
                    <div class="col-lg-5 d-none d-lg-block bg-register-image">
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">관리자 계정 등록</h1>
                            </div>
                            
                            <%-- action="<c:url value='admin/register'/>" method="post"  --%>
                            <form class="user">                                                             
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="register_id"
                                        placeholder="아이디" size="20" required>
                                    <label class="ChkLabel" id="idMsg"></label>						
									<input id="id_reg_check" type="hidden" value="false">
									<input id="id_overlap_check" type="hidden" value="false">
                                </div>                               
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="register_pw" placeholder="비밀번호" size="16" required>
                                    	<label class="ChkLabel" id="pwchkMsg"></label>
                                    	<input id="pw_reg_check" type="hidden" value="false">							
										<input id="pwchk2" type="hidden" value="false">
                                    
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="pwchk" placeholder="비밀번호 확인" size="16" required>
                                        <label class="ChkLabel" id="pwchkMsg2"></label>
                                    </div>
                                </div>                                
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="register_telephone"
                                        placeholder="연락처" type="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
                                    <label class="ChkLabel" id="phoneNumber_msg"></label>	
                                    <input id="phoneNumber_reg_check" type="hidden" value="false">
									<input id="phoneNumber_overlap_check" type="hidden" value="false">	
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="register_email"
                                        placeholder="이메일" required>
                                    <label class="ChkLabel" id="emailMsg"></label>						
									<input id="email_reg_check" type="hidden" value="false">
									<input id="email_overlap_check" type="hidden" value="false">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="register_name"
                                        placeholder="담당자명" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="organization_name"
                                        placeholder="기관명" list="organizationSearch" autocomplete="off" required>
                                    <datalist id="organizationSearch">
                                    	<%--
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
                                    	--%>                                        
                                    </datalist>
                                        
                                    
                                    <input type="hidden" name="organizationCode" id="organization_code" value="" required/>
                                </div>
                                
                                
                                <a class="btn btn-primary btn-user btn-block" id="registerAdmin">
                                    관리자 가입 신청
                                </a>                           
                                <hr>                                
                            </form>
                            <hr>
                
                            <div class="text-center">
                                <a class="small" href="<c:url value='/admin'/>">이미 계정을 가지고 계신가요? 로그인하세요!</a>
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
	$(document).ready(function(){
		var requestUrl = "<c:url value='/organization/namelist'/>"
		// AJAX 호출
		$.ajax({
			url: requestUrl,				// 요청 URL
			type: 'GET', 					// GET 방식으로 요청
			dataType: 'json',
			success: function(data){
				$.each(data, function(index, item){
					$('#organizationSearch').append('<option value="' + item + '"/>');
				});
			},
			error: function(){
				// AJAX 요청이 실패한 경우 에러 처리
				console.log('데이터를 불러오는데 실패했습니다.');
			}
		});
	});
	
	/* 관리자 등록 신청 */
	$("#registerAdmin").click(function(){	
		var register_id = $('#register_id').val();
		var register_pw = $('#register_pw').val();
		var organization_code = $('#organization_code').val();
		var register_name = $('#register_name').val();
		var register_telephone = $('#register_telephone').val();
		var register_email = $('#register_email').val();
		
		var param = {"id":register_id, "password":register_pw, "organizationCode":organization_code, "name":register_name, "telephone":register_telephone, "email":register_email}
		
		
		var id_overlap_check = $('#id_overlap_check').val();  
	    var pwchk2 = $('#pwchk2').val();  
	 	var email_overlap_check = $('#email_overlap_check').val();         
	    var phoneNumber_overlap_check = $('#phoneNumber_overlap_check').val(); 
		
		console.log();
		
		if(id_overlap_check == 'false'){   
	    	alert("아이디를 확인해주세요.");
		    $('#email').focus(); 
	    	
	    	return false;	
		                				     				    
	    }else if(pwchk2 == 'false'){     
	    	alert("비밀번호를 확인해주세요.");
	      	$('#pwchk').focus();  
	    	
	    	return false;	
	      	             		      	
	    }else if(email_overlap_check == 'false'){
	    	alert("이메일을 확인해주세요.");
		    $('#nickname').focus();
	    	
	    	return false;
	    	
	    }else if(phoneNumber_overlap_check == 'false'){
	    	alert("연락처를 확인해주세요.");
		    $('#phoneNumber_join').focus();	
	    	
	    	return false;	
	    		
	    } else {
	    	console.log(param);
			$.ajax({
				url: "<c:url value='/admin/register'/>",
				type: "post",
				contentType: 'application/json',
				data: JSON.stringify(param),
				success: function(data){
					console.log(data);
					if(data == 'ok'){
						//window.location.replace("<c:url value='/admin/login'/>");
						window.location.href = "<c:url value='/admin'/>";
						alert("가입 신청이 완료되었습니다. 승인을 기다려주세요.");					
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
	    }	
	})//end registerAdmin
	
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
	
	
	
	<script>	
		//아이디 유효성 확인 ->중복검사 ajax
		$('#register_id').blur(function(){			
			var reg_id = /^[a-z0-9]{5,20}$/;
			var id = $('#register_id').val();
	
			if ($('#register_id').val() == ''){
				$('#idMsg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#id_overlap_check').val("false");
				//$('#email').focus();
			} else if (!reg_id.test(id)){
				$('#idMsg').text("5~20자의 영문 소문자,  숫자만 사용 가능합니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#id_overlap_check').val("false");
				//$('#email').focus();
			} else if(reg_id.test(id)) {	//아이디 올바른 형식일 경우
				$('#id_reg_check').val("true");
				//$('#idMsg').text("올바른 이메일 형식입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				//$('#idMsg').val("");
				
			if ($('#id_reg_check').val() == 'true'){	
					var id = $('#register_id').val();
				console.log(id);
				$.ajax({
					url: "<c:url value='/admin/idchk'/>",		
					type: "post",
					data: {id: id},
					dataType: 'text',
					success: function(data){
						console.log(data);
						if(data == 'ok'){
							$('#idMsg').text("사용 가능한 아이디입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
							$('#id_overlap_check').val("true");
						} else {
							$('#idMsg').text("이미 가입된 아이디입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
							$('#id_overlap_check').val("false");
							//$('#email').focus();
						}
					}, //end success
					error:function(){
						alert("에러 발생");
					}//end error
				})//end ajax				
				}//end if											
			}//end 이메일 중복검사				
		})//end function
	
	
		//이메일 유효성 확인 -> 중복검사 ajax
		$('#register_email').blur(function(){			
			var reg_email = new RegExp('^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$');
			var email = $('#register_email').val();
	
			if ($('#register_email').val() == ''){
				$('#emailMsg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#email_overlap_check').val("false");
				//$('#email').focus();
			} else if (!reg_email.test(email)){
				$('#emailMsg').text("잘못된 이메일 형식입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#email_overlap_check').val("false");
				//$('#email').focus();
			} else if(reg_email.test(email)) {	//이메일 올바른 형식일 경우
				$('#email_reg_check').val("true");
				//$('#emailMsg').text("올바른 이메일 형식입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#emailMsg').val("");
				
			if ($('#email_reg_check').val() == 'true'){	
					var email = $('#register_email').val();
				console.log(email);
				$.ajax({
					url: "<c:url value='/admin/emailchk'/>",		
					type: "post",
					data: {email: email},
					dataType: 'text',
					success: function(data){
						console.log(data);
						if(data == 'ok'){
							$('#emailMsg').text("사용 가능한 Email입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
							$('#email_overlap_check').val("true");
						} else {
							$('#emailMsg').text("이미 가입된 Email입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
							$('#email_overlap_check').val("false");
							//$('#email').focus();
						}
					}, //end success
					error:function(){
						alert("에러 발생");
					}//end error
				})//end ajax				
				}//end if											
			}//end 이메일 중복검사				
		})//end function
	
	
	
		//휴대폰번호 유효성검사 -> 중복체크
		$('#register_telephone').blur(function(){
			var telephone = $('#register_telephone').val();
			var reg_phone = /^\d{2,3}-\d{3,4}-\d{4}$/;
			//console.log(telephone);
			
			if ($('#register_telephone').val() == ''){
				$('#phoneNumber_msg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#phoneNumber_overlap_check').val("false");
			} else if (!reg_phone.test(telephone)){
				$('#phoneNumber_msg').text("잘못된 전화번호 형식입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#phoneNumber_overlap_check').val("false");
			} else if(reg_phone.test(telephone)) {	//이메일 올바른 형식일 경우
				$('#phoneNumber_reg_check').val("true");
				//$('#phoneNumber_msg').text("올바른 전화번호 형식입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#phoneNumber_msg').val("");
				
				if ($('#phoneNumber_reg_check').val() == 'true'){	
					var telephone = $('#register_telephone').val();
						
					$.ajax({
						url: "<c:url value='/admin/phonechk'/>",		
						type: "post",
						data: {telephone: telephone},
						dataType: 'text',
						success: function(data){
							console.log(data);
							if(data == 'ok'){
								$('#phoneNumber_msg').text("사용 가능한 번호입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });	// 사용 가능 알림메세지
								$('#phoneNumber_overlap_check').val("true");
							} else {
								$('#phoneNumber_msg').text("이미 가입된 회원입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });	
								$('#phoneNumber_overlap_check').val("false");
							}
						}, //end success
						error:function(){
							alert("이미 가입된 회원");
						}
					})//end ajax
				}//end if											
			}//end 중복검사								
		})//end function	
		
		//비밀번호 확인
		$('#register_pw').blur(function(){	
			var pw = $('#register_pw').val();
			var reg_pw = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,16}$/; 
			
			if ($('#register_pw').val() == ''){
				$('#pwchkMsg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#pwchk2').val("false");
			} else if (!reg_pw.test(pw)){
				$('#pwchkMsg').text("5~16자의 영문자, 숫자를 사용하세요.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#pwchk2').val("false");
			} else if(reg_pw.test(pw)) {	
				$('#pw_reg_check').val("true");
				$('#pwchkMsg').text("");
				
				$('#pwchk').blur(function(){
					if($('#pwchk').val() == ''){
						$('#pwchkMsg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
						$('#pwchk2').val("false");									
					} else {
						if($('#register_pw').val() == $('#pwchk').val()){
							$('#pwchkMsg').text("비밀번호가 일치합니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
							$('#pwchk2').val("true");
						} else {
							$('#pwchkMsg').text("비밀번호가 일치하지 않습니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
							$('#pwchk2').val("false");
						}
					}					
				})//end blur				
			}			
		})
		
		
		
		
		
	</script>

</body>

</html>