<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="mobilemenu/mobileinclude.jsp"%>
		<title>축제올래</title>
	</head>
	<body>
		<%@ include file="mobilemenu/mobiletop.jsp"%>
		<div id="festivalolle"><img src="<c:url value='/resources/img/festivalolle.png'/>" alt="festivalolle"></div>
		<%@ include file="mobilemenu/mobilebottom.jsp"%>
		<script type="text/javascript">
			$(document).ready(function(){
				var root = $('#rootContext').val();		// context root
				location.replace(root + '/init');		// 초기 페이지로 이동
			});
		</script>
	</body>
</html>