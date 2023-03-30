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
		<div class="select_space">
			<div>
				<button type="button" id="select_month" value="월" data-bs-toggle="modal" data-bs-target="#monthModal"></button>
				<button type="button" id="select_location" value="전체" data-bs-toggle="modal" data-bs-target="#locationModal"></button>
			</div>
		</div>
		
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">월 선택</button>
		
		<%-- 기본목록(진행 중인 축제) 출력할 레이아웃 --%>
		<div class="default_list_layout">
			<div>
				<h3>진행 중인 축제</h3>
			</div>
			<c:forEach var="fes" items="${festivalList}" varStatus="stat">
				<%@ include file="festivalcard.jsp"%>
			</c:forEach>
		</div>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
		
		
		<!-- https://getbootstrap.kr/docs/5.2/components/modal/ -->
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-body">
						<!-- https://getbootstrap.kr/docs/5.2/components/list-group/ -->
						<ul class="list-group">
							<li class="list-group-item">
								<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="" id="firstRadio" checked>
								<label class="form-check-label" for="firstRadio">First radio</label>
							</li>
							<li class="list-group-item">
								<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="" id="secondRadio">
								<label class="form-check-label" for="secondRadio">Second radio</label>
							</li>
							<li class="list-group-item">
								<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="" id="thirdRadio">
								<label class="form-check-label" for="thirdRadio">Third radio</label>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>