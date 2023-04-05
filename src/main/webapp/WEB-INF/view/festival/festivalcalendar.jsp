<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>축제일정</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/mobile.js'/>"></script>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<div class="empty_space"></div>
		<div class="top_fix select_space">
			<div class="select_btn_space">
				<%--
				<button type="button" class="select_calendar_btn" id="select_month" data-bs-toggle="modal" data-bs-target="#monthModal">월</button>
				<button type="button" class="select_calendar_btn" id="select_location" data-bs-toggle="modal" data-bs-target="#locationModal">전체</button>
				--%>
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
		</div>
				
		<%-- 축제 목록 출력할 레이아웃 --%>
		<div id="calendar_list_layout">
			<c:forEach var="week" items="${weekData}" varStatus="stat">
				<c:choose>
					<c:when test="${week.key == 1}">
						<input class="folding_active" type="hidden" value="active">			
						<div class="week_bar">
							<h3>${nowMonth}월 ${week.key}주</h3>
						</div>
						<div class="default_list_layout folding_space">
							<c:forEach var="fes" items="${weekData[week.key]}">
								<%@ include file="festivalcard.jsp"%>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<input class="folding_active" type="hidden" value="hide">
						<div class="week_bar">
							<h3>${nowMonth}월 ${week.key}주</h3>
						</div>
						<div class="default_list_layout folding_space" hidden="true">
							<c:set var="imgList" value="${weekDataImages[week.key]}"/>
							<c:forEach var="fes" items="${weekData[week.key]}" varStatus="i">
								<c:set var="img" value="${imgList[i.index]}"/>
								<%@ include file="festivalcard.jsp"%>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
		
		<%-- <!-- https://getbootstrap.kr/docs/5.2/components/modal/ -->
		<!-- 월 선택 Modal -->
		<div class="modal fade" id="monthModal" tabindex="-1" aria-labelledby="monthModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-body">
						<!-- https://getbootstrap.kr/docs/5.2/components/list-group/ -->
						<ul class="list-group">
							<c:forEach var="month" begin="1" end="12">
								<li class="list-group-item">
									<c:choose>
										<c:when test="${month == nowMonth}">
											<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="${month}" id="monthRadio${month}" checked>
										</c:when>
										<c:otherwise>
											<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="${month}" id="monthRadio${month}">
										</c:otherwise>
									</c:choose>
									<label class="form-check-label" for="monthRadio${month}">${month}월</label>
								</li>
							</c:forEach>
							<li class="list-group-item">
								<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="13" id="monthRadio13">
								<label class="form-check-label" for="monthRadio13">내년 1월</label>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 지역 선택 Modal -->
		<div class="modal fade" id="locationModal" tabindex="-1" aria-labelledby="locationModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-body">
						<!-- https://getbootstrap.kr/docs/5.2/components/list-group/ -->
						<ul class="list-group">
							<li class="list-group-item">
								<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="전체" id="locationRadio1" checked>
								<label class="form-check-label" for="locationRadio1">전체</label>
							</li>
							<li class="list-group-item">
								<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="" id="locationRadio2">
								<label class="form-check-label" for="locationRadio2">locationRadio2</label>
							</li>
							<li class="list-group-item">
								<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="" id="locationRadio3">
								<label class="form-check-label" for="locationRadio3">locationRadio3</label>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div> --%>
	</body>
</html>