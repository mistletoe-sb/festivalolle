<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="review_card_container">
	<div class="card">
		<div class="card-body">
			<div class="review_body">							
				<div>
					<p class="card-text">
						닉네임${review.name}
					</p>
				</div>
				<div class="rating_layout">
				    <div class="icon_layout rating_img">
						<img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="1">
					</div>
				    <div class="icon_layout rating_img">
						<img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="2">
					</div>
				    <div class="icon_layout rating_img">
						<img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="3">
					</div>
				    <div class="icon_layout rating_img">
						<img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="4">
					</div>
				    <div class="icon_layout rating_img">
						<img src="<c:url value='/resources/img/icon/rating_icon.png'/>" alt="5">
					</div>
				</div>
				<div class="multi_line_text">
					<p>
						${review.content}
					</p>
				</div>
			</div>
			<div class="review_btn_layout">							
				<p class="card-text">신고</p>
			</div>
		</div>
	</div>
</div>