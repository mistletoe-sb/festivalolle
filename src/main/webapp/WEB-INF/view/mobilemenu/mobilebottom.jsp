<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<div class="loading_img" hidden="true">
	<div class="spinner-border text-secondary" role="status"></div>
</div>
<div class="bottom_empty"></div>
<div class="bottom_menu">
	<div onclick="location.href='<c:url value="/home"/>'">
		<%-- <img src="<c:url value='/resources/img/icon/home.png'/>" alt="home"> --%>
		<i class="fas fa-home fa-lg" style="color: #848484;"></i>
		<p>홈</p>
	</div>
	<div onclick="location.href='<c:url value="/festival/calendar"/>'">
		<%-- <img src="<c:url value='/resources/img/icon/calendar.png'/>" alt="calendar"> --%>
		<i class="fas fa-calendar-alt fa-lg" style="color: #848484;"></i>
		<p>축제일정</p>
	</div>
	<div onclick="location.href='<c:url value="/myticket"/>'">
		<%-- <img src="<c:url value='/resources/img/icon/ticket.png'/>" alt="ticket"> --%>
		<i class="fas fa-ticket-alt fa-lg" style="color: #848484;"></i>
		<p>입장권</p>
	</div>
	<div onclick="location.href='<c:url value="/bookmark/list"/>'">
		<%-- <img src="<c:url value='/resources/img/icon/bookmark_icon_empty.png'/>" alt="bookmark"> --%>
		<i class="fas fa-heart fa-lg" style="color: #848484;"></i>
		<p>북마크</p>
	</div>
	<div onclick="location.href='<c:url value="/mypage"/>'">
		<%-- <img src="<c:url value='/resources/img/icon/mypage.png'/>" alt="mypage"> --%>
		<i class="fas fa-user-alt fa-lg" style="color: #848484;"></i>
		<p>마이페이지</p>
	</div>
</div>
