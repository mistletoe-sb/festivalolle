<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>축제일정</title>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<div class="empty_space"></div>
		<%-- <div class="select_space">
			<div class="select_btn_space">
				<select class="select_calendar_btn" id="select_month" name="monthSelector">
					<c:forEach var="month" begin="1" end="12">
						<c:choose>
							<c:when test="${month == nowMonth}">
								<option value="${month}" selected>${month}월</option>
							</c:when>
							<c:otherwise>
								<option value="${month}">${month}월</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<option value="13">내년 1월</option>
				</select>
				
				<select class="select_calendar_btn" id="select_location" name="locationSelector">
					<option value="전체" selected>전체</option>
					<c:forEach var="location" items="${locationList}" varStatus="stat">
						<option value="${location}">${location}</option>
					</c:forEach>
				</select>
			</div>
		</div> --%>
		<div class="select_space">
			<div class="select_btn_space">
				<select class="select_calendar_btn" id="select_month" name="monthSelector">
					<c:forEach var="month" begin="1" end="12">
						<c:choose>
							<c:when test="${month == nowMonth}">
								<option value="${month}" selected>${month}월</option>
							</c:when>
							<c:otherwise>
								<option value="${month}">${month}월</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<option value="13">내년 1월</option>
				</select>
				<div id="separate_select"></div>
				<select class="select_calendar_btn" id="select_location" name="locationSelector">
					<option value="전국" selected>전국</option>
					<c:forEach var="location" items="${locationList}" varStatus="stat">
						<option value="${location}">${location}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<%-- 주차 선택 --%>
		<div class="horizontal_container horizontal_menu" id="week_menu">
			<c:forEach var="week" items="${weekData}" varStatus="stat">
				<c:choose>
					<c:when test="${stat.index == nowWeek}">
						<div class="horizontal_menu_item">
							<p class="selected_week">${stat.index + 1}주차</p>
							<input type="hidden" class="week_start" value="${week[0]}">
							<input type="hidden" class="week_end" value="${week[1]}">
						</div>
					</c:when>
					<c:otherwise>
						<div class="horizontal_menu_item">
							<p>${stat.index + 1}주차</p>
							<input type="hidden" class="week_start" value="${week[0]}">
							<input type="hidden" class="week_end" value="${week[1]}">
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<%-- 축제 목록 출력할 레이아웃(2xN) --%>
		<div class="default_list_2x_layout">
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