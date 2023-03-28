<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>

	<div class="container-fluid">
	<c:forEach items="${reviewList}" var="reviewList">
	<table class="table">
			<tr>
				<th>아이디</th>
				<td>${reviewList.id}</td>
				<th>작성일시</th>
				<td>${reviewList.writeDate}</td>
			</tr>
			<tr>
				<th>축제명</th>
				<td>${reviewList.title}</td>
			</tr>
			<tr>
				<td>${reviewList.status}</td>
			</tr>
			<tr>
				<td>${reviewList.content}</td>
			</tr>
	</table>
	</c:forEach>
	</div>
	<div>
	<button>신고철회</button>
	<button>삭제</button>
	</div>










 <%@ include file="../adminfooter.jsp" %>