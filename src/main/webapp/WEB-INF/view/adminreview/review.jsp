<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admintop.jsp" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<div class="container-fluid">
	
	<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">리뷰 리스트</h6>
	</div>
	<div class="card-body">
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
		<!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
             <div class="input-group" style="float:left;">
               <select id="tableBox" class="form-control bg-light border-0 small" aria-label="Default select example">
                 <option value="id">아이디</option>
                 <option value="content">리뷰내용</option>
                 <option value="title">축제명</option>
                 </select>
                   </div>
                   <div style="float:left;">
                   <div style="float:left;">
                     <input type="text" class="form-control bg-light border-0 small" id="reviewKeyword" placeholder="검색" aria-label="Search" aria-describedby="basic-addon2">
                   </div>
                    <div class="input-group-append" style="float:left;">
                      <button class="btn btn-primary" type="button" id="reviewSearch">
                      	<i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
          	</form>
          	<div>
         		<select id="yearBox" class="form-control bg-light border-0 small" aria-label="Default select example" style="right"></select>
         	</div> 
          	<div>
         	<select name="titleList" id="titleList" class="form-control bg-light border-0 small" aria-label="Default select example" style="right"></select>
			</div>
         	</nav>
 	<div class="table-responsive">	
	<input type="radio" name="sort" id="allReview" checked="checked">전체
	<input type="radio" name="sort" id="reportedReview">신고된 리뷰
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead class="text-center">
			<tr>
	
				<th>신고</th>
				<th>아이디</th>
				<th>내용</th>
				<th>작성일시</th>
				<th>축제명</th>
			</tr>
		</thead>
		<tbody class="text-center" id="contents">
			<c:forEach items="${reviewList}" var="reviewList">
				<tr>
				<c:set var = "status" value = "${reviewList.status}"/>		
					<c:choose>
						<c:when test="${status > 0 && status < 2}" >
							<td><div class="icon"><i class="btn btn-danger btn-circle btn-sm"><i class="fas fa-exclamation-triangle"></i></i></div></td>
						</c:when>
						<c:otherwise>
							<td><div class="icon" style="display:none;"><i class="btn btn-danger btn-circle btn-sm"><i class="fas fa-exclamation-triangle"></i></i></div></td>
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

document.addEventListener('keydown', function(event) {
	  if (event.key === 'Enter') {
	    event.preventDefault();
	    document.querySelector('#reviewSearch').click();
	  }
	});

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
	          var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle btn-sm" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
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
				swal('출력오류!', "신고리뷰목록을 불러오는데 실패했습니다.", 'error1');
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
		          var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle btn-sm" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
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
		    	  swal('출력오류!', "리뷰목록을 불러오는데 실패했습니다.", 'error2');
		      }
		    });
		  });
	    
	  $("#reviewSearch").on('click',function() { //리뷰 리스트 검색결과 출력
		var reviewKeyword = $('#reviewKeyword').val(); 
	    var tableBox = $("#tableBox").val(); 
	    $("#contents").empty();
	    $.ajax({
	      url : "./search",
	      type : "get",
		  data: {reviewKeyword : reviewKeyword, 
 	          tableBox : tableBox}, 
	      datatype : "json",
	      success : function(data) {
	        $.each(data, function(index,reviewList) { //데이터의 각 항목에 대해 반복
	          var row = $('<tr></tr>');
	          var status = reviewList.status;
	          var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle btn-sm" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
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
				swal('출력오류!', "검색한 리뷰목록을 불러오는데 실패했습니다.", 'error3');		
			}
	    });
	  });
	  
	  /* --- 연도별 타이틀 호출 --- */
		$("#titleList").empty();
	    var titleyear = $(this).val();
	    // AJAX 호출
	    $.ajax({
	        url: './selectYearTitleList', // 서버에서 데이터를 가져올 경로
	        type: 'GET', // GET 방식으로 요청
	        data: { titleyear: titleyear }, // 서버로 보낼 데이터
	        dataType: "json",
	        success: function(data) {
	        		$("#titleList").append("<option selected> 축제를 선택 해주세요. </option>");
	            	$.each(data, function(index, item) {
	            	$("#titleList").append("<option value='" +item.festivalCode+ "'>" +item.title + "</option>");
	            });
	        },
	        error: function() {
	        	swal('검색창오류!', "연도별 축제목록을 불러오는데 실패했습니다.", 'error4');
	        }
	    });
		
	    /* --- 현재 년도를 기준으로 생성 --- */
		var date = new Date();
		var selYear = date.getFullYear();
		
		//현재년도를 기준으로 호출
		getYears(selYear)
		
		//현재 년도를 select
		$("#yearBox").val(selYear);
		//현재 년도를 기준으로 다시 option을 세팅
		$("#yearBox").change(function(){
			var chgYear = $(this).val();
			getYears(chgYear);
			$("#yearBox").val(chgYear);
		});
	  
		/* --- 연도 리스트 생성 --- */
		function getYears(getY){
			//기존 option을 삭제
			$("#yearBox option").remove();
			//홀해 기준으로 -5년부터 +5년
			var stY = Number(getY)-5;
			var enY = Number(getY)+5;
			
			for(var y=stY; y<=enY; y++){
				$("#yearBox").append("<option value='" + y + "'>" + y + "년" + "</option>");
			}
		}
		
		/* --- 연도 선택시 축제 리스트 출력 --- */
		$('#yearBox').change(function() {
			//해당 구역 삭제
			$("#titleList").empty();
		    var titleyear = $(this).val();
		    // AJAX 호출
		    $.ajax({
		        url: './selectYearTitleList', // 서버에서 데이터를 가져올 경로
		        type: 'GET', // GET 방식으로 요청
		        data: { titleyear: titleyear }, // 서버로 보낼 데이터
		        dataType: "json",
		        success: function(data) {
		        	$("#titleList").append("<option > 축제를 선택 해주세요. </option>");
		        	$.each(data, function(index, reviewList) {
		        	$("#titleList").append("<option value='" +reviewList.festivalCode+ "'>" +reviewList.title + "</option>");
		            });
		        },
		        error: function() {
		            // AJAX 요청이 실패한 경우 에러 처리
		        	swal('검색창오류!', "연도별 축제를 불러오는데 실패했습니다.", 'error5');
		        }
		    });
		});

		/* --- 연도별 축제 선택시 리뷰 출력 --- */
		$('#titleList').change(function() {
			$("#contents").empty();
		    var festivalCode = $(this).val();
		 // AJAX 호출
		    $.ajax({
		        url: './selectYearReview', // 서버에서 데이터를 가져올 경로
		        type: 'GET', // GET 방식으로 요청
		        data: { festivalCode: festivalCode }, // 서버로 보낼 데이터
		        dataType: "json",
		        success: function(data) {
		    	  $.each(data, function(index,reviewList) { //데이터의 각 항목에 대해 반복
		    	     var row = $('<tr></tr>');
		    	     var status = reviewList.status;
		    	     var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle btn-sm" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
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
		    			swal('출력오류!', "검색한 리뷰목록을 불러오는데 실패했습니다.", 'error6');			
		    		}
		        });
		    });
	});  
</script>	





 <%@ include file="../adminfooter.jsp" %>