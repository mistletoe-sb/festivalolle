<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="review_card_container">
	<div class="card">
		<div class="card-body">
			<div class="review_body">							
				<div>
					<p class="card-text">
						닉네임${review.id}
					</p>
				</div>
				<div class="rating_layout">
					<c:forEach var="i" begin="1" end="5">
					    <div class="icon_layout rating_img">
							<img src="<c:url value='/resources/img/icon/rating_icon_empty.png'/>" alt="${i}">
						</div>
					</c:forEach>
				</div>
				<div class="multi_line_text">
					<%-- <p>
						${review.content}
					</p> --%>
					<textarea placeholder="로그인 후 이용 가능합니다."></textarea>
				</div>
			</div>
			<div class="review_btn_layout">							
				<p class="card-text">신고</p>
				<input type="hidden" class="review_code" value="${review.festivalReviewCode}">
			</div>
		</div>
	</div>
</div>