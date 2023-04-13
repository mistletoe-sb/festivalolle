<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>축제검색</title>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<%-- 검색된 목록 출력할 레이아웃 --%>
		<div class="default_list_2x_layout">
			<div>
				<h3>"${keyword}"에 대한<br>검색결과 : ${resultCount}건</h3>
			</div>
			<c:forEach var="fes" items="${searchList}" varStatus="stat">
				<%@ include file="festivalcard.jsp"%>
			</c:forEach>
		</div>
		<input type="hidden" id="searched" value="${keyword}">
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>