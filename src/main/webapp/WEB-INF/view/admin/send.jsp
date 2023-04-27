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
	
    <title>문자보내기</title>
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

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호를 잊으셨나요?</h1>
                                        <p class="mb-4">아래에 이메일 주소를 입력하세요.
                                            비밀번호를 재설정할 수 있는 링크를 보내드립니다!</p>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input class="form-control form-control-user"
                                                id="telephone"
                                                placeholder="전화번호를 입력하세요."/>
                                        </div>
                                        <a id="sendMessage" class="btn btn-primary btn-user btn-block">
                                           비밀번호 재설정: 문자보내기
                                        </a>
                                    </form>
                                    <hr>
                                    <input type="button" onclick="sendSMS()" value="★문자보내기★">
                                    <div class="text-center">
                                        <a class="small" href="register.html">새로운 계정을 만드세요!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="login.html">이미 계정을 가지고 계신가요? 로그인하세요!</a>
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
   function sendSMS() {
	   var body = {
	     "type": "SMS",
	     "contentType": "COMM",
	     "countryCode": "82",
	     "from": "01076133655",
	     "content": "내용",
	     "messages": [
	       {
	         "to": "01076133655",
	         "content": "문자 보내기 API 테스트입니다."
	       }
	     ]
	   }
	   var jsonBody = JSON.stringify(body)

	   var space = ' ' //한 칸 공백
	   var newLine = '\n' //개행 문자
	   var method = 'POST' 
	   var serviceId = 'ncp:sms:kr:305852960143:festivalolle'
	   var uri = '/sms/v2/services/' + serviceId + 'messages'
	   var timestamp = new Date().getTime().toString()
	   
	   var accessKey = 'qUX8hIkhJ2YXip4BNlWj'
	   var secretKey = 'xv83Sl61HnC93lWOK8TxgSt9cwkyrjkl8SIHFh6j'
	   var hmac = method + space + uri + newLine + timestamp + newLine + accessKey

	   var byteSignature = Utilities.computeHmacSha256Signature(hmac, secretKey)
	   var signature = Utilities.base64Encode(byteSignature).toString()

	   var apiUrl = 'https://sens.apigw.ntruss.com/sms/v2/services/' + serviceId + '/messages'
	   var options = {
	     'method': method,
	     'muteHttpExceptions': true,
	     'headers': {
	       'Content-Type': 'application/json; charset=utf-8',
	       'x-ncp-apigw-timestamp': timestamp,
	       'x-ncp-iam-access-key': accessKey,
	       'x-ncp-apigw-signature-v2': signature
	     },
	     'payload': jsonBody
	   }

	   var response = UrlFetchApp.fetch(apiUrl, options)
	   Logger.log(response)
	 }
    </script>
    
    
    
    
    

</body>

</html>