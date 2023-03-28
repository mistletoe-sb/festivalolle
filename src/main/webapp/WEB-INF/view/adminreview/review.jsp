<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admintop.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
	<input type="radio" name="sort" id="allReview" checked="checked">전체
	<input type="radio" name="sort" id="reportedReview">신고된 리뷰
	<table class="table">
		<thead>
			<tr id="sector">
	
				<th scope="col">리뷰 상태</th>
				<th scope="col">아이디</th>
				<th scope="col">내용</th>
				<th scope="col">작성일시</th>
				<th scope="col">축제명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reviewList}" var="V_ReviewListVO">

				<tr>
					<td>${V_ReviewListVO.status}</td>
					<td>${V_ReviewListVO.id}</td>
					<td>${V_ReviewListVO.content}</td>
					<td>${V_ReviewListVO.writeDate}</td>
					<td>${V_ReviewListVO.title}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>











 <%@ include file="../adminfooter.jsp" %>