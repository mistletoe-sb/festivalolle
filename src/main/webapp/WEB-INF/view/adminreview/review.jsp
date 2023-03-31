<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admintop.jsp" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<div class="container-fluid">
	<div class="card shadow mb-4">
	<div class="card-body">
 	<div class="table-responsive">	
	<input type="radio" name="sort" id="allReview" checked="checked">전체
	<input type="radio" name="sort" id="reportedReview">신고된 리뷰
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
			<c:forEach items="${reviewList}" var="reviewList">
				<tr>
				<c:set var = "status" value = "${reviewList.status}"/>		
					<c:choose>
						<c:when test="${status > 0 && status < 2}" >
							<td><div class="icon"><i class="btn btn-danger btn-circle"><i class="fas fa-exclamation-triangle"></i></i></div></td>
						</c:when>
						<c:otherwise>
							<td><div class="icon" style="display:none;"><i class="btn btn-danger btn-circle"><i class="fas fa-exclamation-triangle"></i></i></div></td>
						</c:otherwise>
					</c:choose>
					<td>${reviewList.id}</td>
					<td><a href="./detail?festivalReviewCode=${reviewList.festivalReviewCode}">${reviewList.content}</a></td>
					<td>${reviewList.writeDate}</td>
					<td>${reviewList.title}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
	</div>
	
<script type="text/javascript">
$(document).ready(function() {
	  $("#reportedReview").on('click',function getReportedList() {
	    $("#contents").empty();
	    $.ajax({
	      url : "./report",
	      type : "get",
	      datatype : "json",
	      success : function(data) {
	        $.each(data, function(index,reviewList) { //데이터의 각 항목에 대해 반복
	          var row = $('<tr></tr>');
	          var status = reviewList.status;
	          var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
	          var icon = $('<div class="icon"></div>').append($('<i></i>').addClass(iconClass));
	          row.append($('<td></td>').append(icon));	//완성된 행을 row 변수에 추가
	          row.append($('<td></td>').text(reviewList.id));
	          row.append($('<td></td>').append($('<a></a>').attr('href', './detail?festivalReviewCode=' + reviewList.festivalReviewCode).text(reviewList.content)));
	          row.append($('<td></td>').text(reviewList.writeDate));
	          row.append($('<td></td>').text(reviewList.title)); 
	          $("#contents").append(row); //각 행을 $("#contents")에 추가
	        });
	      },
			error : function getReportedList() {
				alert('error');			
			}
	    });
	  });
	$("#allReview").on('click',function getAllList() {
		 $("#contents").empty();
		    $.ajax({
		      url : "./all",
		      type : "get",
		      datatype : "json",
		      success : function(data) {
		        $.each(data, function(index,reviewList) { //데이터의 각 항목에 대해 반복
		          var row = $('<tr></tr>');
		          var status = reviewList.status;
		          var iconClass = (status > 0 && status < 2) ? "btn-danger btn-circle" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
		          var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
		          var icon = $('<div class="icon"></div>').append($('<i></i>').addClass(iconClass));
		          row.append($('<td></td>').append(icon));	//완성된 행을 row 변수에 추가
		          row.append($('<td></td>').text(reviewList.id));
		          row.append($('<td></td>').append($('<a></a>').attr('href', './detail?festivalReviewCode=' + reviewList.festivalReviewCode).text(reviewList.content)));
		          row.append($('<td></td>').text(reviewList.writeDate));
		          row.append($('<td></td>').text(reviewList.title));
		          $("#contents").append(row); //각 행을 $("#contents")에 추가
		        });
		      },
		      error : function() {
		        alert('error');
		      }
		    });
		  });
	    
	  $("#reviewSearch").on('click',function getReviewList() { //리뷰 리스트 검색결과 출력
	    $("#contents").empty();
	    $.ajax({
	      url : "./list",
	      type : "get",
	      datatype : "json",
	      success : function(data) {
	        $.each(data, function(index,reviewList) { //데이터의 각 항목에 대해 반복
	          var row = $('<tr></tr>');
	          var status = reviewList.status;
	          var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
	          var icon = $('<div class="icon"></div>').append($('<i></i>').addClass(iconClass));
	          row.append($('<td></td>').append(icon));	//완성된 행을 row 변수에 추가
	          row.append($('<td></td>').text(reviewList.id));
	          row.append($('<td></td>').append($('<a></a>').attr('href', './detail?festivalReviewCode=' + reviewList.festivalReviewCode).text(reviewList.content)));
	          row.append($('<td></td>').text(reviewList.writeDate));
	          row.append($('<td></td>').text(reviewList.title)); 
	          $("#contents").append(row); //각 행을 $("#contents")에 추가
	        });
	      },
			error : function getReportedList() {
				alert('error');			
			}
	    });
	  });
	});  
</script>	





 <%@ include file="../adminfooter.jsp" %>