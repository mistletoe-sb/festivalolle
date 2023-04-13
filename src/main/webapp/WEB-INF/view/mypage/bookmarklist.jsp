<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>북마크</title>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<%-- 축제 목록 출력할 레이아웃(2xN) --%>
		<div class="default_list_2x_layout">
			<c:forEach var="fes" items="${defaultList}" varStatus="stat">
				<%@ include file="../festival/festivalcard.jsp"%>
			</c:forEach>
		</div>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>