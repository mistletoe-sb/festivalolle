<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>회원가입</title>
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
								<div class="col-lg-7">
	                                <div class="p-5">
										<img src="<c:url value='/resources/img/mobile/festivalollelogo.png'/>" class="card-img-top" alt="축제올래 로고">
										<form class="user" action="<c:url value='/join'/>" method="post" name="joinfrm" id="joinMember_btn" >                                                             
											 
											<div class="form-group">
			                                    <input type="text" class="form-control form-control-user" id="join_id" name="id"
			                                        placeholder="아이디" size="20" required>
			                                   
			                                    <label class="ChkLabel" id="idMsg" ></label>						
												<input id="id_reg_check" type="hidden" value="false">
												<input id="id_overlap_check" type="hidden" value="false">
												
			                                </div>

			                                <div class="form-group">
			                                    <input type="password" class="form-control form-control-user" name="password"
		                                            id="join_pw" placeholder="비밀번호" size="16" required>
		                                    	
		                                    	<label class="ChkLabel" id="pwchkMsg"></label>
		                                    	<input id="pw_reg_check" type="hidden" value="false">							
												<input id="pwchk2" type="hidden" value="false">
			                                	
			                                </div>  

											<div class="form-group">
												<input type="password" class="form-control form-control-user"
                                           			 id="join_pwchk" placeholder="비밀번호 확인" size="16" required>
                                           		
                                         		<label class="ChkLabel" id="pwchkMsg2"></label>
												
											</div> 
											<div class="form-group">
			                                   <input type="text" class="form-control form-control-user" name="name"
			                                   		id="join_name" placeholder="이름" required>
			                               </div>
											<div class="form-group">
			                                    <input type="text" class="form-control form-control-user" id="join_telephone" name="mobile"
			                                        placeholder="연락처" type="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
			                                    
			                                    <label class="ChkLabel" id="phoneNumber_msg"></label>
			                                    <input id="phoneNumber_reg_check" type="hidden" value="false">
												<input id="phoneNumber_overlap_check" type="hidden" value="false">	
			                                	
			                                </div>
																						
											<input type="submit" onclick="join_btn_action()" class="btn btn-primary btn-user btn-block btn-primary-mobile" value="회원가입" />                       											
										
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
		$('#join_id').blur(function(){			
			var reg_id = /^[a-z0-9]{5,20}$/;
			var id = $('#join_id').val();
	
			if ($('#join_id').val() == ''){
				
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
					var id = $('#join_id').val();
					console.log(id);
					$.ajax({
						url: "<c:url value='/member/idchk'/>",		
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
		
		//휴대폰번호 유효성검사 -> 중복체크
		$('#join_telephone').blur(function(){
			var mobile = $('#join_telephone').val();
			var reg_phone = /^\d{2,3}-\d{3,4}-\d{4}$/;
			
			if ($('#join_telephone').val() == ''){
				
				$('#phoneNumber_msg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#phoneNumber_overlap_check').val("false");
			} else if (!reg_phone.test(mobile)){
				
				$('#phoneNumber_msg').text("잘못된 전화번호 형식입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#phoneNumber_overlap_check').val("false");
			} else if(reg_phone.test(mobile)) {	//이메일 올바른 형식일 경우
				
				$('#phoneNumber_reg_check').val("true");
				//$('#phoneNumber_msg').text("올바른 전화번호 형식입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#phoneNumber_msg').val("");
				
				if ($('#phoneNumber_reg_check').val() == 'true'){	
					var mobile = $('#join_telephone').val();
						
					$.ajax({
						url: "<c:url value='/member/mobilechk'/>",		
						type: "post",
						data: {mobile: mobile},
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
		
		//비밀번호 입력 검사
		$('#join_pw').blur(function(){	
			var pw = $('#join_pw').val();
			var reg_pw = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,16}$/; 
			
			if ($('#join_pw').val() == ''){				
				
				$('#pwchkMsg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#pwchk2').val("false");
			} else if (!reg_pw.test(pw)){
				
				$('#pwchkMsg').text("5~16자의 영문자, 숫자를 사용하세요.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#pwchk2').val("false");
			} else if(reg_pw.test(pw)) {	
				$('#pw_reg_check').val("true");
				
				//$('#pwchkMsg').text("올바른 전화번호 형식입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#pwchkMsg').text("");
				
				$('#join_pwchk').blur(function(){
					if($('#join_pwchk').val() == ''){
						
						$('#pwchkMsg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
						$('#pwchk2').val("false");									
					} else {
						if($('#join_pw').val() == $('#join_pwchk').val()){
							
							$('#pwchkMsg').text("비밀번호가 일치합니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
							$('#pwchk2').val("true");
						} else {
							
							$('#pwchkMsg').text("비밀번호가 일치하지 않습니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
							$('#pwchk2').val("false");
						}
					}
				})//end blur				
			}
		})//비밀번호 입력 검사
		

		
		//joinMember_btn
		function join_btn_action(){
			  $('#joinMember_btn').off("submit").on("submit", function(){	// 현재의 submit 이벤트 핸들러를 제거하고 새로 생성하여 function 등록
			    var id_overlap_check = $('#id_overlap_check').val();  
			    var pwchk2 = $('#pwchk2').val();  			 	      
			    var phoneNumber_overlap_check = $('#phoneNumber_overlap_check').val();
			    				    
			    if(id_overlap_check == 'false'){   
			    	alert("아이디를 확인해주세요.");
				    $('#join_id').focus(); 
			    	
			    	return false;	
				                				     				    
			    }else if(pwchk2 == 'false'){     
			    	alert("비밀번호를 확인해주세요.");
			      	$('#pwchk').focus();  
			    	
			    	return false;	
			      	             		      	
			    }else if(phoneNumber_overlap_check == 'false'){
			    	alert("휴대폰 번호를 확인해주세요.");
				    $('#join_pw').focus();	
			    	
			    	return false;	
			    	
			    }
			  });
			}
		
		
		
		
		
		
		</script>
		
		
		
		
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>