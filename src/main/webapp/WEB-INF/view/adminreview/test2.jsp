<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세 TEST</title>
</head>
<body>
	<div class="container-fluid">
	<c:forEach items="${test2}" var="test2">
	<table class="table">
			<tr>
				<th>아이디</th>
				<td>${test2.id}</td>
				<th>작성일시</th>
				<td>${test2.writeDate}</td>
			</tr>
			<tr>
				<th>축제명</th>
				<td>${test2.title}</td>
			</tr>
			<tr>
				<td>${test2.status}</td>
			</tr>
			<tr>
				<td>${test2.content}</td>
			</tr>
	</table>
	</c:forEach>
	</div>
	<div>
	<button>신고철회</button>
	<button>삭제</button>
	</div>
</body>
</html>