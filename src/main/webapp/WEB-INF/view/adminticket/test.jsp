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

			<th scope="col">아이디</th>
			<th scope="col">이름</th>
			<th scope="col">전화번호</th>
			<th scope="col">구매일시</th>
			<th scope="col">입장일시</th>
			<th scope="col">쿠폰사용일시</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${buyerList}" var="V_ticketBuyerListVO">
			<tr>
				<td>${V_ticketBuyerListVO.id}]</td>
				<td>${V_ticketBuyerListVO.name}</td>
				<td>${V_ticketBuyerListVO.mobile}</td>
				<td>${V_ticketBuyerListVO.purchaseTime}</td>
				<td>${V_ticketBuyerListVO.entranceTime}</td>
				<td>${V_ticketBuyerListVO.couponUseTime}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>