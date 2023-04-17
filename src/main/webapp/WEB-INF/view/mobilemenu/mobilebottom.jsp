<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<div class="loading_img" hidden="true">
	<div class="spinner-border text-secondary" role="status"></div>
</div>
<div class="bottom_empty"></div>
<div class="bottom_menu">
	<div id="homeBtn" onclick="location.href='<c:url value="/home"/>'">
		<%-- <img src="<c:url value='/resources/img/icon/home.png'/>" alt="home"> --%>
		<i class="fa-solid fa-house"></i>
		<p>홈</p>
	</div>
	<div id="calendarQuick" onclick="location.href='<c:url value="/festival/calendar"/>'">
		<%-- <img src="<c:url value='/resources/img/icon/calendar.png'/>" alt="calendar"> --%>
		<i class="fa-solid fa-calendar-days"></i>
		<p>축제일정</p>
	</div>
	<div id="ticketQuick" onclick="location.href='<c:url value="/myticket"/>'">
		<%-- <img src="<c:url value='/resources/img/icon/ticket.png'/>" alt="ticket"> --%>
		<i class="fa-solid fa-ticket"></i>
		<p>입장권</p>
	</div>
	<div id="bookmarkQuick" onclick="location.href='<c:url value="/bookmark/list"/>'">
		<%-- <img src="<c:url value='/resources/img/icon/bookmark_icon_empty.png'/>" alt="bookmark"> --%>
		<i class="fa-solid fa-heart"></i>
		<p>북마크</p>
	</div>
	<div id="mypageQuick" onclick="location.href='<c:url value="/mypage"/>'">
		<%-- <img src="<c:url value='/resources/img/icon/mypage.png'/>" alt="mypage"> --%>
		<i class="fa-solid fa-user-large"></i>
		<c:choose>
			<c:when test="${not empty loginUser}"><p>마이페이지</p></c:when>
			<c:otherwise><p>로그인</p></c:otherwise>
		</c:choose>
	</div>
</div>
