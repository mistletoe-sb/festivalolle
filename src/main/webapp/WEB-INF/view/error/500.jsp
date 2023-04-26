<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>요청하신 작업이 정상처리되지 않았습니다...</title>
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	</head>
	<body>
		<div class="col-xl-10 col-lg-12 col-md-9">	
			<div class="card o-hidden border-0 my-5 shadow-lg-mobile">
				<div class="card-body p-0">		
					<div class="row" style="justify-content: center;">
						<div class="col-lg-6">
							<div style="padding: 2.1875rem;">
								<%--축제올래 로고 이미지 --%>
								<img src="<c:url value='/resources/img/mobile/festivalollelogo.png'/>" class="card-img-top" alt="축제올래 로고">										
								<div class="text-center">
									<p>요청하신 작업이 정상적으로 처리되지 않았습니다.<br>이용에 불편을 드려 대단히 죄송합니다.<br>동일한 문제가 지속적으로 발생할 경우 하단의 연락처로 문의 바랍니다.<br></p>
									문의 : <a href="tel:010-3736-3907">010-3736-3907</a>
								</div>
								<div>	
									<button id="return_back" class="btn btn-primary btn-user btn-block btn-primary-mobile">이전으로 돌아가기</button>
								</div>
							</div>
						</div>									
					</div>
				</div>
			</div>
		</div>
	</body>
</html>