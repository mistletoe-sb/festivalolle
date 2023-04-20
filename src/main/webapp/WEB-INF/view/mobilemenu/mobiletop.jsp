<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="top_empty" id="top">
	<input id="rootContext" type="hidden" value="${pageContext.request.contextPath}">
</div>
<div class="top_menu" >
	<div class="top-image"></div>
	<div class="normal_top">		
		<div id="back_button"><i class="fa-solid fa-angle-left"></i></div>
		<div class="page_title">
			<p></p>
		</div>
		<div id="search_btn">
			<%-- <img src="<c:url value='/resources/img/icon/search_icon.png'/>" alt="search"> --%>
			<i class="fa-solid fa-magnifying-glass search_icon"></i>
		</div>	
	</div>
	<div class="search_top" hidden="true">
		<div class="search_box">
			<form id="searchForm" action="<c:url value='/festival/search'/>" method="get">
				<input type="search" name="keyword" class="search_input" placeholder="검색어를 입력하세요">
				<input type="image" id="searchSubmit" class="search_btn" src="<c:url value='/resources/img/icon/search_icon.png'/>" alt="검색">
			</form>
		</div>
	</div>
</div>

