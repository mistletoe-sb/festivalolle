<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>reviewList TEST의 test</title>
</head>
<body>
	<div class="container-fluid">
	<input type="radio" name="sort" value="all" id="allReview" checked="checked" onclick="getAllList();"><label>전체</label>
	<input type="radio" name="sort" value="reported" id="reportedReview" onclick="getReportedList();"><label>신고된 리뷰</label>
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
		<c:forEach items="${test}" var="test">
		<tr id="tr1">
			<td id="context1">${test.status}</td>
			<td id =context2>${test.id}</td>
			<td id="context3">${test.content}</td>
			<td id="context4">${test.writeDate}</td>
			<td id="context5">${test.title}</td>
		</tr id="tr1">
		</c:forEach>
		</tbody>
	</table>
	</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#reportedReview").click(function getReportedList() {
		$.ajax({
			url : "./test3", // 어디로 갈거니? // 갈 때 데이터
			type : "get", // 타입은 뭘 쓸거니?
			datatype : "json",
			success : function(data) { // 갔다온 다음 결과값
			//	alert('seccuss');	// 나오면 파일을 찾았다는 것
			//	alert(data);  // [object Object],[object Object],[object Object]
				
			// 데이터를 확인하고 싶을 때.
			//	let str = JSON.stringify(data); // <> parse()
			//		alert(str); 

				$.each(data, function(index,test) { // 데이터 =test

					$("#context1").append("<td>"+test.status + "</td>");
					$("#context2").append("<td>"+test.id +"</td>");
					$("#context3").append("<td>"+test.content+"</td>");
					$("#context4").append("<td>"+test.writeDate+"</td>");
					$("#context5").append("<td>"+test.title + "</td>");

				});
			},
		});
	});
			error : function getReportedList() {
				alert('error');			
			};
	$("#allReview").click(function getAllList() {
		$.ajax({
			url : "./test1", // 어디로 갈거니? // 갈 때 데이터
			type : "get", // 타입은 뭘 쓸거니?
			datatype : "json",
			success : function(data) { // 갔다온 다음 결과값
			//	alert('seccuss');	// 나오면 파일을 찾았다는 것
			//	alert(data);  // [object Object],[object Object],[object Object]
				
			// 데이터를 확인하고 싶을 때.
			//	let str = JSON.stringify(data); // <> parse()
			//	alert(str); 

				$.each(data, function(index,test) { // 데이터 =test

					$("#context1").append("<td>"+test.status + "</td>");
					$("#context2").append("<td>"+test.id +"</td>");
					$("#context3").append("<td>"+test.content+"</td>");
					$("#context4").append("<td>"+test.writeDate+"</td>");
					$("#context5").append("<td>"+test.title + "</td>");

				});
			},
			error : function getAllList() {
				alert('error');			
			}
		});
		});
	});
</script>	
</body>
</html>