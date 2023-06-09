<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>프로필 수정</title>
		 <!-- Custom fonts for this template-->
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">

	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
		<style>
		.mypagemenu{
			width:100%; 
			height : 2.0rem;
			margin: auto; 
			border-bottom: 0.1rem solid #C4C4C4; 
			margin-bottom: 0.7rem; 
			padding-bottom: 0.3rem;
			margin-top: 3rem;
			
		}
		.mypagebtn{
		
			position:absolute; bottom:2.0rem; 
		}
		.mypageimg{
			width:1.5rem;
			margin-right : 0.5rem;
		}
		.mypageimg2{
			width:1.2rem;
			margin-right : 0.5rem;
		}
		</style>
	</head>
	<body class="bg-gradient-primary-mobile">
		<%@ include file="../mobilemenu/mobiletop.jsp"%>		
		<%-- 내용 삽입 --%>

							<div style="width:80%;  margin: auto; margin-top: 10rem;" >
								<form class="user" action="<c:url value='/memberupdate'/>" method="post" name="joinfrm" id="joinMember_btn" >                                                             
								
									<div class="mypagemenu">
										<input type="text" class="form-control form-control-user" id="join_id" name="id" placeholder="아이디" size="20" required readonly value="${memberVO.id}">
									</div>
									
									<div class="mypagemenu">
										<input type="text" class="form-control form-control-user" name="name" id="join_name" placeholder="이름을 입력 하세요." required pattern="[A-Za-z가-힣]+" value="${memberVO.name}">
										<label class="ChkLabel" id="name_msg"></label>
										<input id="name_reg_check" type="hidden" value="true">
										<input id="name_overlap_check" type="hidden" value="true">
									</div>
									<div class="mypagemenu" >
										<input type="text" class="form-control form-control-user" id="join_telephone" name="mobile" placeholder="연락처를 입력하세요." type="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required value="${memberVO.mobile}">
										<label class="ChkLabel" id="phoneNumber_msg"></label>
										<input id="phoneNumber_reg_check" type="hidden" value="true">
										<input id="phoneNumber_overlap_check" type="hidden" value="true">	
									</div>
									<div class="mypagemenu" style=" bottom:2.0rem;">
										<input type="submit" id="join_btn" class="btn btn-primary btn-user btn-block btn-primary-mobile" value="수정하기" />                       											
									</div>
								</form>
							</div>

		<script>

		//휴대폰번호 유효성검사 -> 중복체크
		$('#join_telephone').on('keyup',function(){
			var mobile = $('#join_telephone').val();
			var reg_phone = /^\d{2,3}-\d{3,4}-\d{4}$/;
			
			if ($('#join_telephone').val() == ''){
				
				$('#phoneNumber_msg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#phoneNumber_overlap_check').val("false");
			} else if (!reg_phone.test(mobile)){
				
				$('#phoneNumber_msg').text("OOO-OOOO-OOOO 형식으로 입력 해주세요.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
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
							console.log(mobile);
							console.log("${memberVO.mobile}");
							if(data == 'ok' ){
								
								$('#phoneNumber_msg').text("사용 가능한 번호입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });	// 사용 가능 알림메세지
								$('#phoneNumber_overlap_check').val("true");
							} else if(mobile == "${memberVO.mobile}") {
								$('#phoneNumber_msg').text("현재 사용하는 번호입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });	// 사용 가능 알림메세지
								$('#phoneNumber_overlap_check').val("true");
							} else {
								
								$('#phoneNumber_msg').text("이미 가입된 전화번호 입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });	
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
		
		//휴대폰번호 유효성검사 -> 중복체크
		$('#join_name').on('keyup',function(){
			var name = $('#join_name').val();
			var reg_name =  /^[A-Za-z가-힣]+$/;
			
			if ($('#join_name').val() == ''){
				
				$('#name_msg').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#name_overlap_check').val("false");
			} else if (!reg_name.test(name)){
				
				$('#name_msg').text("한글과 영문 대 소문자를 사용하세요.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#name_overlap_check').val("false");
			} else if(reg_name.test(name)) {	//이메일 올바른 형식일 경우
				
				$('#name_overlap_check').val("true");
				$('#name_msg').text("올바른 형식입니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });								
			}//end 중복검사								
		})//end function
		

		
		
		
		//joinMember_btn
			$("#join_btn").on("click", function(event) {
				event.preventDefault();
			    var phoneNumber_overlap_check = $('#phoneNumber_overlap_check').val();  		 	      
			    var name_overlap_check = $('#name_overlap_check').val();
			    				    
			    if(name_overlap_check == 'false'){   
			    	swal('입력 오류!', "이름을 확인해주세요!", 'warning');
			    } else if (phoneNumber_overlap_check == 'false'){
			    	swal('입력 오류!', "전화번호를 확인 해주세요!", 'warning');	
			    } else {	
			    	 swal('수정 완료!', "해당 정보로 프로필이 수정 됐습니다.!", 'success').then(function() {
			 	    	$("#joinMember_btn").submit();
			 		});
			    }
 
			  });
		
		
		
		
		
		
		</script>
		
		
		
		
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>