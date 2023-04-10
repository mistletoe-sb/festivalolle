<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="festival_card_container"
	 onclick="location.href='<c:url value="/festival/info?festivalCode=${fes.festivalCode}"/>'">
	<input type="hidden" class="festival_code" value="${fes.festivalCode}">
	<div class="card">
		<div class="ratio">
			<c:choose>
				<%-- <c:when test='${(fes.fileName != null) && (fes.fileName != "")}'> --%>
				<c:when test='${img != null}'>
					<%-- <img src="<c:url value='/resources/img/${fes.fileName}'/>" class="card-img-top" alt="image"> --%>				  	
					<img src="data:image:jpg;base64,${img}" class="card-img-top" alt="loading failed">				  	
				</c:when>
				<c:otherwise>
					<%-- <img src="<c:url value='/resources/img/default_thumbnail.jpg'/>" class="card-img-top" alt="기본 썸네일"> --%>				  	
					<img src="<c:url value='/resources/img/festest3.jpg'/>" class="card-img-top" alt="no image">				  	
				</c:otherwise>
			</c:choose>
		</div>
		<div class="card-body">
			<div class="festival_title">
				<p class="card-text">
					${fes.title}
				</p>
			</div>
			<div class="festival_location">							
				<p class="card-text">
					${fes.stateName} ${fes.cityName}
				</p>
			</div>
		    <div class="icon_layout rating_img">
				<img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="평점">
			</div>
			<div class="icon_layout rating_txt">							
				<p class="card-text">
					${fes.rating}
				</p>
			</div>
		</div>
	</div>
</div>