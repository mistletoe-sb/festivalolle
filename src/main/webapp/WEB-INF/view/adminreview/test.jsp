<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>reviewList TEST의 test</title>
</head>
<body>	
	<div class="container-fluid">
	<input type="radio" name="sort" value="all" id="allReview" checked="checked">전체
	<input type="radio" name="sort" value="reported" id="reportedReview">신고된 리뷰
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
		<tbody id="contents">
		<c:forEach items="${test}" var="test">
		<tr>
				<c:set var = "status" value = "${test.status}"/>		
					<c:choose>
						<c:when test="${status > 0 && status < 2}" >
							<td><div class="icon"><i class="bi bi-exclamation-circle-fill"></i></div></td>
						</c:when>
						<c:otherwise>
							<td><div class="icon" style="display:none;"><i class="bi bi-exclamation-circle-fill"></i></div></td>
						</c:otherwise>
					</c:choose>
					<td>${test.id}</td>
					<td><a href="./test2?festivalReviewCode=${test.festivalReviewCode}">${test.content}</a></td>
					<td>${test.writeDate}</td>
					<td>${test.title}</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>

<script type="text/javascript">
$(document).ready(function() {
  $("#reportedReview").on('click',function getReportedList() {
    $("#contents").empty();
    $.ajax({
      url : "./test3",
      type : "get",
      datatype : "json",
      success : function(data) {
        $.each(data, function(index,test) {
          var row = $('<tr></tr>');
          var status = test.status;
          var iconClass = (status > 0 && status < 2) ? "bi-exclamation-circle-fill" : "";
          var icon = $('<div class="icon"></div>').append($('<i class="bi"></i>').addClass(iconClass));
          row.append($('<td></td>').append(icon));
          row.append($('<td></td>').text(test.id));
          row.append($('<td></td>').append($('<a></a>').attr('href', './test2?festivalReviewCode=' + test.festivalReviewCode).text(test.content)));
          row.append($('<td></td>').text(test.writeDate));
          row.append($('<td></td>').text(test.title));
          $("#contents").append(row);
        });
      },
      error : function() {
        alert('error');      
      }
	    });
	  });
	$("#allReview").on('click',function getAllList() {
		 $("#contents").empty();
		    $.ajax({
		      url : "./test1",
		      type : "get",
		      datatype : "json",
		      success : function(data) {
		        $.each(data, function(index,test) {
		          var row = $('<tr></tr>');
		          var status = test.status;
		          var iconClass = (status > 0 && status < 2) ? "bi-exclamation-circle-fill" : "";
		          var icon = $('<div class="icon"></div>').append($('<i class="bi"></i>').addClass(iconClass));
		          row.append($('<td></td>').append(icon));
		          row.append($('<td></td>').text(test.id));
		          row.append($('<td></td>').append($('<a></a>').attr('href', './test2?festivalReviewCode=' + test.festivalReviewCode).text(test.content)));
		          row.append($('<td></td>').text(test.writeDate));
		          row.append($('<td></td>').text(test.title));
		          $("#contents").append(row);
		        });
		      },
		      error : function() {
		        alert('error');
		      }
		    });
		  });
	    });
</script>	
</body>
</html>