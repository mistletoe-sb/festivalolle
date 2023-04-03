<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>상세정보</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/mobile.js'/>"></script>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<%-- 인덱스 메뉴(페이지 내 이동) 레이아웃 --%>
		<div class="index_menu">
			<table>
				<tr>
					<td>
						<a class="link_anchor" href="#top">TOP</a>
					</td>
					<td>
						<a class="link_anchor menuIndex">개 요</a>
					</td>
					<td>
						<a class="link_anchor infoIndex">상세정보</a>
					</td>
					<td>
						<a class="link_anchor foodIndex">주변업체</a>
					</td>
					<td>
						<a class="link_anchor reviewIndex">리 뷰</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="index_menu_empty"></div>
		<%-- 축제 상세정보 출력할 레이아웃 --%>
		<div class="festival_info_layout">
			<div class="festival_info_sub_title">
				<div id="fes_title">
					<h3>${fesInfo[0].title}</h3>
				</div>
				<div id="fes_status">
					<button class="btn btn-secondary d-day_info">${statusMsg}</button>
				</div>
			</div>
			<div>
				<div class="icon_layout rating_img">
					<img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="평점">
				</div>
				<div class="icon_layout rating_txt">							
					<p>${fesInfo[0].rating}</p>
				</div>
			</div>
			<div>
				<div class="icon_layout place_img">
					<img src="<c:url value='/resources/img/icon/place_icon.png'/>" alt="장소">
				</div>
				<div class="icon_layout place_txt">							
					<p>${fesInfo[0].stateName} ${fesInfo[0].cityName}</p>
				</div>
			</div>
			<div id="carouselFestivalInfoImage" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<c:forEach var="fes" items="${fesInfo}" varStatus="stat">
				        <c:choose>
							<c:when test='${stat.index == 0}'>
								<div class="carousel-item active" data-bs-interval="8000">
									<%-- <img src="${fes.image}" class="d-block w-100 img_layout" alt="image"> --%>
									<img src="<c:url value='/resources/img/festest3.jpg'/>" class="d-block w-100 img_layout" alt="image">
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item" data-bs-interval="8000">
									<img alt="" src="/getByteImage" />
									<%-- <img src="${fes.image}" class="d-block w-100 img_layout" alt="image"> --%>
									<img src="<c:url value='/resources/img/festest3.jpg'/>" class="d-block w-100 img_layout" alt="image">
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
			<div class="festival_info_menu_container layout_bottom_line" id="menu">
				<div class="festival_info_menu"><%-- 아이콘 div --%>
					<div class="festival_info_menu_empty"></div>
					<div class="icon_layout">
						<a class="link_anchor" href="#">
							<img src="<c:url value='/resources/img/icon/bookmark_icon_empty.png'/>" alt="북마크">
							<br>북마크
						</a>
					</div>
					<div class="icon_layout">
						<a class="link_anchor" id="ticketModal">
							<img src="<c:url value='/resources/img/icon/ticket.png'/>" alt="구매">
							<br>구매
						</a>
					</div>
					<div class="icon_layout">
						<a class="link_anchor reviewIndex">
							<img src="<c:url value='/resources/img/icon/rating_icon_empty.png'/>" alt="리뷰">
							<br>리뷰
						</a>
					</div>
					<div class="festival_info_menu_empty"></div>
				</div>
				<div class="multi_line_text">
					<p>${fesInfo[0].detail}</p>
				</div>
				<div class="tag_layout">
					<p>${fesInfo[0].tags}</p>
				</div>
			</div>
			<div class="layout_bottom_line" id="info">
				<div class="festival_info_sub_title">
					<h3>상세정보</h3>
				</div>
				<div>
					<table class="detail_info">
						<tr>
							<th scope="row">기간</th>
							<td>${fesInfo[0].startDate} ~ ${fesInfo[0].endDate}</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>${fesInfo[0].address}</td>
						</tr>
						<tr>
							<th scope="row">요금</th>
							<c:choose>
								<c:when test='${fesInfo[0].fee == 0}'>
									<td>무료</td>
								</c:when>
								<c:otherwise>
									<td>${fesInfo[0].fee}원</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th scope="row">URL</th>
							<td>${fesInfo[0].url}</td>
						</tr>
						<tr>
							<th scope="row">담당기관</th>
							<td>${fesInfo[0].organizationCode}</td>
						</tr>
						<tr>
							<th scope="row">문의</th>
							<td>${fesInfo[0].telephone}</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="layout_bottom_line" id="food">
				<div class="festival_info_sub_title">
					<h3>주변 음식점</h3>
				</div>
				<div>
					<%-- 지도 API 사용 --%>
				</div>
			</div>
			<div class="layout_bottom_line" id="review">
				<div class="festival_info_sub_title">
					<h3>축제 리뷰 N개</h3>
				</div>
				<div>
					<div class="icon_layout">							
						<p>전체 평점</p>
					</div>
					<div class="icon_layout rating_img">
						<img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="평점">
					</div>
					<div class="icon_layout rating_txt">							
						<p>${fesInfo[0].rating}</p>
					</div>
				</div>
				<div>
					<div class="my_review">
						<%@ include file="reviewcard.jsp"%>
						<c:choose>
							<c:when test="${sessionScope.memberVO == null}">
							</c:when>
							<c:when test="${(sessionScope.memberVO != null) && reviewList[0].festivalReviewCode == null}">
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						
						
						
						<form action="<c:url value='/review/insert'/>" method="post">
							<textarea name="content" rows="10" cols="20"></textarea>
							<input type="number" name="rating">
							<input type="hidden" name="festivalCode" value="${fesInfo[0].festivalCode}">
							<input type="submit" value="등록">
						</form>
						<form action="<c:url value='/review/report'/>" method="post">
							<input type="hidden" name="festivalReviewCode" value="9">
							<input type="submit" value="신고">
						</form>
						<form action="<c:url value='/review/delete'/>" method="post">
							<input type="hidden" name="festivalReviewCode" value="9">
							<input type="submit" value="삭제">
						</form>
					</div>
					<c:forEach var="review" items="${reviewList}" varStatus="stat">
						
					</c:forEach>
				</div>
			</div>
		</div>
		<%@ include file="../mobilemenu/topbutton.jsp"%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
		<%-- 입장권 구매 모달 창 --%>
		<div class="ticket_modal_layout">
			<div class="fadeout_bottom_close fadeout_bottom_click">
				<img src="<c:url value='/resources/img/icon/back.png'/>" alt="close">
			</div>
			<div class="ticket_modal_body">
				<form id="ticketInsert" action="<c:url value='/ticket/insert'/>" method="post">
					<div class="modal_body_content">
						<div class="modal_body_content_title">입장인원</div>
						<div class="modal_body_content_main">
							<input type="number" id="headCount" name="headCount" min="1" max="99" pattern="^[1-9]{1}$|^[0-9]{2}$">
						</div>
						<div class="modal_body_content_sub">명</div>					
					</div>
					<div class="modal_body_content">
						<div class="modal_body_content_title">요금</div>
						<div class="modal_body_content_main">${fesInfo[0].fee}</div>
						<div class="modal_body_content_sub">원</div>					
					</div>
					<div class="modal_body_content">
						<div class="modal_body_content_title">결제금액</div>
						<div class="modal_body_content_main" id="paymentAmount"></div>
						<div class="modal_body_content_sub">원</div>					
					</div>
					<div class="modal_body_content">
						<div class="modal_body_btn modal_cancel fadeout_bottom_click">취소</div>
						<div class="modal_body_btn modal_submit" id="ticket_submit">구매</div>
					</div>
					<input type="hidden" name="festivalCode" value="${fesInfo[0].festivalCode}">
					<input type="hidden" id="fee" name="fee" value="${fesInfo[0].fee}">
				</form>
			</div>
		</div>
	</body>
</html>