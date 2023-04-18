<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>${title}</title>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<div class="default_title_layout">
			<div class="title_label"></div>
			<h3>${title}</h3>
			<input type="hidden" id="category" value="${category}">
		</div>
		<%-- 축제 목록 출력할 레이아웃(2xN) --%>
		<div class="default_list_2x_layout no_margin_top">
			<c:if test="${fn:length(defaultList) == 0}">
				<div class="no_result">
					<img src="<c:url value='/resources/img/mobile/festival_none.png'/>" alt="none">
				</div>
			</c:if>
			<c:forEach var="fes" items="${defaultList}" varStatus="stat">
				<%@ include file="festivalcard.jsp"%>
			</c:forEach>
		</div>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>