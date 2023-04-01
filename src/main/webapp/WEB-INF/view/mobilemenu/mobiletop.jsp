<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="top_empty">
	<input id="rootContext" type="hidden" value="<c:url value='/'/>">
</div>
<div class="top_menu">
	<div class="normal_top">
		<div class="page_title">
			<p></p>
		</div>
		<div id="search_btn">
			<img src="<c:url value='/resources/img/icon/search_icon.png'/>" alt="search">
		</div>	
	</div>
	<div class="search_top" hidden="true">
		<div class="search_box">
			<form action="#" method="get">
				<input type="search" name="search" class="search_input" placeholder="검색어를 입력하세요">
				<input type="image" class="search_btn" src="<c:url value='/resources/img/icon/search_icon.png'/>" alt="검색">
			</form>
		</div>
		<div class="search_close">
			<img src="<c:url value='/resources/img/icon/back.png'/>" alt="close">
		</div>
	</div>
</div>
