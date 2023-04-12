<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>비밀번호 변경</title>
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
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<%-- 내용 삽입 --%>
		
							<div style="width:80%;  margin: auto; margin-top: 10rem;" >
								<form class="user" action="<c:url value='/passwordupdate'/>" method="post" name="joinfrm" id="joinMember_btn" >                                                             
									
									<div class="mypagemenu">
										<input type="password" class="form-control form-control-user" name="password" id="join_pw" placeholder="비밀번호" size="16" required>
										<label class="ChkLabel" id="pwchkMsg"></label>
										<input id="pw_reg_check" type="hidden" value="false">
										<input id="pwchk2" type="hidden" value="false">
									</div>
									<div class="mypagemenu" >
										<input type="password" class="form-control form-control-user" id="join_pwchk" placeholder="비밀번호 확인" size="16" required>
										<label class="ChkLabel" id="pwchkMsg2"></label>
									</div>
									<div class="mypagemenu" style=" bottom:2.0rem;">
										<input type="submit" onclick="join_btn_action()" class="btn btn-primary btn-user btn-block btn-primary-mobile" value="수정하기" />                       											
									</div>
								</form>
							</div>
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

//비밀번호 입력 검사
$('#join_pw').on('keyup',function(){	
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
		$('#join_pwchk').on('keyup',function(){
			if($('#join_pwchk').val() == ''){
				
				$('#pwchkMsg2').text("필수 정보입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#pwchk2').val("false");									
			} else {
				if($('#join_pw').val() == $('#join_pwchk').val()){
					
					$('#pwchkMsg2').text("비밀번호가 일치합니다.").css({"color": "green", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
					$('#pwchk2').val("true");
				} else {
					
					$('#pwchkMsg2').text("비밀번호가 일치하지 않습니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
					$('#pwchk2').val("false");
				}
			}
		})//end blur				
	}
})//비밀번호 입력 검사


function join_btn_action(){
	  $('#joinMember_btn').off("submit").on("submit", function(){	// 현재의 submit 이벤트 핸들러를 제거하고 새로 생성하여 function 등록

	    var pwchk2 = $('#pwchk2').val();  			 	      
	    				    
	    if (pwchk2 == 'false'){     
	    	swal('인증실패!', "비밀번호를 확인 해주세요!", 'warning');
	      	$('#pwchk').focus();  
	    	
	    	return false;	
	    } else {
	    	swal('수정완료!', "비밀번호가 번경 됐습니다! 재로그인 해주세요!", 'success').then(function() {
		    	return true;
	    	});
	    }
	  });
	}

 
</script>

</html>