<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				<td>${V_ReviewListVO.id}]</td>
				<td>${V_ReviewListVO.content}</td>
				<td>${V_ReviewListVO.writeDate}</td>
				<td>${V_ReviewListVO.title}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>