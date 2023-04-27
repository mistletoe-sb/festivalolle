<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<c:if test="${fn:length(defaultList) == 0}">
				<div class="no_result">북마크한 축제가 없습니다.</div>
			</c:if>
			<c:forEach var="fes" items="${defaultList}" varStatus="stat">
				<%@ include file="../festival/festivalcard.jsp"%>
			</c:forEach>
		</div>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>