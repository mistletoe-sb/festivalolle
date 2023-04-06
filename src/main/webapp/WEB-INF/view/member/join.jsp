<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>회원가입</title>
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
								<div class="col-lg-7">
	                                <div class="p-5">
				
										<form class="user" action="<c:url value='/join'/>" method="post" name="joinfrm">                                                             
											 
											<div class="form-group">
			                                    <input type="text" class="form-control form-control-user" id="join_id"
			                                        placeholder="아이디: 5~20자의 영문 소문자, 숫자" size="20" required>

			                                    <div id="id-hide" hidden="true">
				                                    <label class="ChkLabel" id="idMsg" display="none"></label>						
													<input id="id_reg_check" type="hidden" value="false">
													<input id="id_overlap_check" type="hidden" value="false">
												</div>
			                                </div>

			                                <div class="form-group">
			                                    <input type="password" class="form-control form-control-user"
		                                            id="join_pw" placeholder="비밀번호: 5~16자의 영문자, 숫자" size="16" required>
		                                    	<div id="pw-hide" hidden="true">
			                                    	<label class="ChkLabel" id="pwchkMsg"></label>
			                                    	<input id="pw_reg_check" type="hidden" value="false">							
													<input id="pwchk2" type="hidden" value="false">
			                                	</div>
			                                </div>  

											<div class="form-group">
												<input type="password" class="form-control form-control-user"
                                           			 id="join_pwchk" placeholder="비밀번호 확인" size="16" required>
                                           		<div class="pwchk-hide" hidden="true">
                                           			<label class="ChkLabel" id="pwchkMsg2"></label>
												</div>
											</div> 
											<div class="form-group">
			                                   <input type="text" class="form-control form-control-user" 
			                                   		id="join_name" placeholder="담당자명" required>
			                               </div>
											<div class="form-group">
			                                    <input type="text" class="form-control form-control-user" id="join_telephone"
			                                        placeholder="연락처: 010-1234-5678" type="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
			                                    <div class="tel-hide" hidden="true">
				                                    <label class="ChkLabel" id="phoneNumber_msg"></label>
				                                    <input id="phoneNumber_reg_check" type="hidden" value="false">
													<input id="phoneNumber_overlap_check" type="hidden" value="false">	
			                                	</div>
			                                </div>
																						
											<input type="submit" id="joinMember_btn" class="btn btn-primary btn-user btn-block btn-primary-mobile" value="회원가입" />                       											
										
										</form>
										
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!--  </div>-->
		<!--  </div>-->
		
		
		<script>
		
		//아이디 유효성 확인 ->중복검사 ajax
		$('#login_id').blur(function(){			
			var reg_id = /^[a-z0-9]{5,20}$/;
			var id = $('#login_id').val();
	
			if ($('#login_id').val() == ''){
				$('#id-hide').attr('hidden', false);
				$('#idMsg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#id_overlap_check').val("false");
				//$('#email').focus();
			} else if (!reg_id.test(id)){
				$('#id-hide').attr('hidden', false);
				$('#idMsg').text("5~20자의 영문 소문자,  숫자만 사용 가능합니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#id_overlap_check').val("false");
				//$('#email').focus();
			} else if(reg_id.test(id)) {	//아이디 올바른 형식일 경우
				$('#id-hide').attr('hidden', true);
				$('#id_reg_check').val("true");
				//$('#idMsg').text("올바른 이메일 형식입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				//$('#idMsg').val("");
				
				if ($('#id_reg_check').val() == 'true'){	
					var id = $('#login_id').val();
					console.log(id);
					$.ajax({
						url: "<c:url value='/member/idchk'/>",		
						type: "post",
						data: {id: id},
						dataType: 'text',
						success: function(data){
							console.log(data);
							if(data == 'ok'){
								$('#id-hide').attr('hidden', true);
								$('#idMsg').text("사용 가능한 아이디입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
								$('#id_overlap_check').val("true");
							} else {
								$('#id-hide').attr('hidden', false);
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
		
		//휴대폰번호 유효성검사 -> 중복체크
		$('#join_telephone').blur(function(){
			var telephone = $('#join_telephone').val();
			var reg_phone = /^\d{2,3}-\d{3,4}-\d{4}$/;
			
			if ($('#join_telephone').val() == ''){
				$('#tel-hide').attr('hidden', false);
				$('#phoneNumber_msg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#phoneNumber_overlap_check').val("false");
			} else if (!reg_phone.test(telephone)){
				$('#tel-hide').attr('hidden', false);
				$('#phoneNumber_msg').text("잘못된 전화번호 형식입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#phoneNumber_overlap_check').val("false");
			} else if(reg_phone.test(telephone)) {	//이메일 올바른 형식일 경우
				$('#tel-hide').attr('hidden', true);
				$('#phoneNumber_reg_check').val("true");
				//$('#phoneNumber_msg').text("올바른 전화번호 형식입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#phoneNumber_msg').val("");
				
				if ($('#phoneNumber_reg_check').val() == 'true'){	
					var telephone = $('#join_telephone').val();
						
					$.ajax({
						url: "<c:url value='/member/mobilechk'/>",		
						type: "post",
						data: {telephone: telephone},
						dataType: 'text',
						success: function(data){
							console.log(data);
							if(data == 'ok'){
								$('#tel-hide').attr('hidden', true);
								$('#phoneNumber_msg').text("사용 가능한 번호입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });	// 사용 가능 알림메세지
								$('#phoneNumber_overlap_check').val("true");
							} else {
								$('#tel-hide').attr('hidden', false);
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
		
		//비밀번호 입력 검사
		$('#join_pw').blur(function(){	
			var pw = $('#join_pw').val();
			var reg_pw = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,16}$/; 
			
			if ($('#join_pw').val() == ''){				
				$('#pw_hide').attr('hidden', false);
				$('#pwchkMsg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#pwchk2').val("false");
			} else if (!reg_pw.test(pw)){
				$('#pw_hide').attr('hidden', false);
				$('#pwchkMsg').text("5~16자의 영문자, 숫자를 사용하세요.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#pwchk2').val("false");
			} else if(reg_pw.test(pw)) {	
				$('#pw_reg_check').val("true");
				$('#pw_hide').attr('hidden', true);
				//$('#pwchkMsg').text("올바른 전화번호 형식입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#pwchkMsg').text("");
				
				$('#join_pwchk').blur(function(){
					if($('#join_pwchk').val() == ''){
						$('#pw_hide').attr('hidden', false);
						$('#pwchkMsg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
						$('#pwchk2').val("false");									
					} else {
						if($('#join_pw').val() == $('#join_pwchk').val()){
							$('#pw_hide').attr('hidden', true);
							$('#pwchkMsg').text("비밀번호가 일치합니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
							$('#pwchk2').val("true");
						} else {
							$('#pw_hide').attr('hidden', false);
							$('#pwchkMsg').text("비밀번호가 일치하지 않습니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
							$('#pwchk2').val("false");
						}
					}
				})//end blur				
			}
		})//비밀번호 입력 검사
		
		/* 관리자 등록 신청 */	
		/*
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
							window.location.href = "<c:url value='/admin/login'/>";
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
		
		*/
		
		/*
		//joinMember_btn
		function join_btn_action(){
			  $('#joinMember_btn').on('click', function(){	// 현재의 submit 이벤트 핸들러를 제거하고 새로 생성하여 function 등록
			    var email_overlap_check = $('#email_overlap_check').val();  
			    var pwchk2 = $('#pwchk2').val();  
			 	var nickname_overlap_check = $('#nickname_overlap_check').val();         
			    var phoneNumber_overlap_check = $('#phoneNumber_overlap_check').val();
			    				    
			    if(id_overlap_check == 'false'){   
			    	alert("중복되지 않은 이메일을 입력해주세요.");
				    $('#join_id').focus(); 
			    	
			    	return false;	
				                				     				    
			    }else if(pwchk2 == 'false'){     
			    	alert("입력한 비밀번호를 다시 확인해주세요.");
			      	$('#pwchk').focus();  
			    	
			    	return false;	
			      	             		      	
			    }else if(nickname_overlap_check == 'false'){
			    	alert("중복되지 않은 닉네임을 선택해주세요.");
				    $('#nickname').focus();
			    	
			    	return false;
			    	
			    }else if(phoneNumber_overlap_check == 'false'){
			    	alert("이미 가입된 휴대폰 번호입니다.");
				    $('#phoneNumber_join').focus();	
			    	
			    	return false;	
			    		
			    }
			  });
			}
		*/
		
		
		
		
		
		</script>
		
		
		
		
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>