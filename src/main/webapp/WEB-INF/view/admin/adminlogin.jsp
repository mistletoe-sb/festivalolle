<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>축제올래 관리자 로그인</title>
	</head>
	<body>		
	
		<form action="<c:url value='/admin'/>" method="post" name="loginfrm">
			<div class ="login_input_sub">
				<input name="id" title="아이디 입력" placeholder="아이디" type="text"> 
			</div>
			<div>
				<input id="member_pw" name="password" title="비밀번호 입력란" placeholder="비밀번호" type="password" value="">			
				
				<input id="pw_login_overlap_check" type="hidden" value="false">
			</div>
			<div class="loginBtn">
				<input type="submit" id="login_btn" class="login_btn" value="로그인" />
			</div>
		</form>
	</body>
</html>