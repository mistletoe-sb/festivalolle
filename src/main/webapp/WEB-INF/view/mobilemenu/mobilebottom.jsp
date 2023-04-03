<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="bottom_empty"></div>
<div class="bottom_menu">
	<div onclick="location.href='<c:url value="/home"/>'">
		<img src="<c:url value='/resources/img/icon/home.png'/>" alt="home">
		<p>홈</p>
	</div>
	<div onclick="location.href='<c:url value="/festival/calendar"/>'">
		<img src="<c:url value='/resources/img/icon/calendar.png'/>" alt="calendar">
		<p>축제일정</p>
	</div>
	<div onclick="location.href='<c:url value="/myticket"/>'">
		<img src="<c:url value='/resources/img/icon/ticket.png'/>" alt="ticket">
		<p>입장권</p>
	</div>
	<div onclick="location.href='<c:url value="/mypage"/>'">
		<img src="<c:url value='/resources/img/icon/mypage.png'/>" alt="mypage">
		<p>마이페이지</p>
	</div>
</div>
