<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="festival_card_container"
	 onclick="location.href='<c:url value="/festival/info?festivalCode=${fes.festivalCode}"/>'">
	<input type="hidden" class="festival_code" value="${fes.festivalCode}">
	<div class="card">
		<div class="ratio">
			<%-- <img src="data:image:jpg;base64,${img}" class="card-img-top" alt="${fes.festivalCode}">	 --%>			  	
			<img src="<c:url value='/resources/img/mobile/empty_image.png'/>" class="card-img-top" alt="${fes.festivalCode}">				  	
		</div>
		<div class="card-body">
			<div class="festival_title">
				<p class="card-text text-truncate">
					${fes.title}
				</p>
			</div>
			<div class="festival_sub">
				<div class="festival_location">							
					<p class="card-text text-truncate">
						${fes.stateName} ${fes.cityName}
					</p>
				</div>
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
			</div>
		</div>
	</div>
</div>