<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="card_rating">
    <div class="icon_layout rating_img">
		<%-- <img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="평점"> --%>
		<i class="fa-solid fa-star fill_star"></i>
	</div>
	<div class="icon_layout rating_txt">
		<c:choose>
			<c:when test="${fes.rating == 0}">
				<p class="card-text no_rating">평점없음</p>
			</c:when>
			<c:otherwise>
				<p class="card-text">${fes.rating}</p>
			</c:otherwise>
		</c:choose>
	</div>
</div>