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

    <title>SB Admin 2 - Forgot Password</title>

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
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호를 잊으셨나요?</h1>
                                        <p class="mb-4">아래에 전화번호를 입력하세요.
                                            비밀번호를 재설정할 수 있는 링크를 보내드립니다!</p>
                                    </div>
                                    
                                   <!--  <form class="user">
                                        <div class="form-group">
                                            <input class="form-control form-control-user"
                                                id="telephone"
                                                placeholder="전화번호를 입력하세요."/>                                       
                                        </div>
                                        <a id="sendMessage" class="btn btn-primary btn-user btn-block">
                                           비밀번호 재설정: 문자보내기
                                        </a>
                                    </form> -->
                                    
                                    
                                    
                                    <form class="user">
                                    
	                                    <div class="form-group row">
			                                    <div class="form-group">
			                                        <input class="form-control form-control-user"
			                                                id="telephone"
			                                                placeholder="전화번호를 입력하세요"/>			                                    
			                                    </div>
			                                    <div class="col-sm-6">
			                                        <a id="sendMessage" class="btn btn-primary btn-user btn-block">
			                                           인증번호 받기
			                                        </a>
			                                    </div>		                                   		                                    
	                                	</div> 
	                                	<div class="form-group row">
	                                	<div class="form-group">
	                                            <input class="form-control form-control-user"
	                                                id="telephone"
	                                                placeholder="인증번호를 입력하세요"/>	                                        
	                                    </div>
	                                    	<div class="col-sm-6">
	                                    	<a id="sendMessage" class="btn btn-primary btn-user btn-block">
			                                           유효시간
			                                        
			                                	<span class="time"></span></a>
			                                </div>
	                                    
                               	 		</div>
                               	 	</form>
                                
                                    
                                    
                                    
                                    
                                    
                                    
                                    <!-- <div>
									  <span>타이머</span><span class="time"></span>
									</div> -->


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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>
    
   <script>
    	$(document).on('click', '#sendMessage', function(){
			var tel = $('#telephone').val();			
			console.log(tel);
			
		
						
			$.ajax({
				url: "<c:url value='/admin/message'/>",		
				type: "post",
				data: {tel: tel},
				
				success: function(data){
					console.log(tel);
					if(data == 'ok'){ 
						console.log(tel);	
						alert("보냈엉");
					}
					
					/* console.log(data); */
					
					
					/* if(data == 'ok'){ } */
				}, //end success
				error:function(){
					alert("이미 가입된 회원");
				}
			})//end ajax
															
											
		})//end function
		
		
		
		
		var timer = null;
		var isRunning = false;

		$("#sendMessage").on("click", function() {
		  var display = $(".time");
		  // 유효시간 설정
		  var leftSec = 120;

		  // 버튼 클릭 시 시간 연장
		  if (isRunning){
		    clearInterval(timer);
		    display.html("");
		    startTimer(leftSec, display);
		  }else{
		  	startTimer(leftSec, display);
		  }
		});
		    
		function startTimer(count, display) {  
		  var minutes, seconds;
		  timer = setInterval(function () {
		    minutes = parseInt(count / 60, 10);
		    seconds = parseInt(count % 60, 10);

		    minutes = minutes < 10 ? "0" + minutes : minutes;
		    seconds = seconds < 10 ? "0" + seconds : seconds;

		    display.html(minutes + ":" + seconds);

		    // 타이머 끝
		    if (--count < 0) {
		      clearInterval(timer);
		      alert("시간초과");
		      display.html("시간초과");
		      $("button").attr("disabled", true);
		      isRunning = false;
		    }
		  }, 1000);
		  isRunning = true;
		}
    
    </script>
    <script>

var timer = null;
var isRunning = false;
$(function(){

	    $("#sendMessage").click(function(e){
    	var display = $('.time');
    	var leftSec = 180;
    	// 남은 시간
    	// 이미 타이머가 작동중이면 중지
    	if (isRunning){
    		clearInterval(timer);
    		display.html("");
    		startTimer(leftSec, display);
    	}else{
    	startTimer(leftSec, display);
    		
    	}
    });
})

    
function startTimer(count, display) {
            
    		var minutes, seconds;
            timer = setInterval(function () {
            minutes = parseInt(count / 60, 10);
            seconds = parseInt(count % 60, 10);
     
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
     
            display.html(minutes + ":" + seconds);
     
            // 타이머 끝
            if (--count < 0) {
    	     clearInterval(timer);
    	     alert("시간초과");
    	     display.html("시간초과");
    	     $('.btn_chk').attr("disabled","disabled");
    	     isRunning = false;
            }
        }, 1000);
             isRunning = true;
}


</script>

<script>
/*
// 타이머 구현_daldal
function $ComTimer(){
    //prototype extend
}

$ComTimer.prototype = {
    comSecond : ""
    , fnCallback : function(){}
    , timer : ""
    , domId : ""
    , fnTimer : function(){
        var m = Math.floor(this.comSecond / 60) + ": " + (this.comSecond % 60);	// 남은 시간 계산
        this.comSecond--;					// 1초씩 감소
        console.log(m);
        this.domId.innerText = m;
        if (this.comSecond < 0) {			// 시간이 종료 되었으면..
            clearInterval(this.timer);		// 타이머 해제
            alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
            window.close();
            window.opener.location = "/index.do"
        }
    }
    ,fnStop : function(){
        clearInterval(this.timer);
    }
}

var AuthTimer = new $ComTimer()

AuthTimer.comSecond = 180; // 제한 시간

AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")}; // 제한 시간 만료 메세지

AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000); 

AuthTimer.domId = document.getElementById("timer"); 
*/
</script>
    
    
    
    
    

</body>

</html>