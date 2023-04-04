<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 필요</title>
</head>
<body>
	
	
	<div class="text-center">
		로그인 후 사용 할 수 있어요.
		<a class="small a-mobile" href="<c:url value='/login'/>">로그인하러 가기</a>
	</div>
</body>
</html>