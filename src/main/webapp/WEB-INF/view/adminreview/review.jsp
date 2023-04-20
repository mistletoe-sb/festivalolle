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
                 <input type="hidden" id="tableBoxInput" value="" />
                   </div>
                   <div style="float:left;">
                   <div style="float:left;">
                     <input type="text" class="form-control bg-light border-0 small" id="reviewKeyword" placeholder="검색" aria-label="Search" aria-describedby="basic-addon2">
                   </div>
                   <input type="hidden" id="searchInput" value="" />
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
         	<input type="hidden" id="titleListInput" value="" />
			</div>
         	</nav>
 	<div class="table-responsive">	
	
	<input type="radio" name="sort" id="radioBtn1" autocomplete="off" checked="checked" value = "" >전체
	<input type="radio" name="sort" id="radioBtn2" autocomplete="off" value = "1">신고된 리뷰
	<input type="hidden" name="radioInput" id="radioInput" value="" />
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
	<div style="text-align: center;">
		<div style="display: inline-block;">
			<nav aria-label='Page navigation example'>
				<ul id="myPage" class='pagination'>
				<!-- 내용 추가 -->
				</ul>
			</nav>
		</div>
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
	
	  //신고된 리뷰목록 출력		
// 	  $("#reportedReview").on('click',function () { 
// 	    $("#contents").empty();
// 	    $.ajax({
// 	      url : "./report",
// 	      type : "get",
// 	      datatype : "json",
// 	      success : function(data) {
// 	        $.each(data, function(index,reviewList) { //데이터의 각 항목에 대해 반복
// 	          var row = $('<tr></tr>');
// 	          var status = reviewList.status;
// 	          var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle btn-sm" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
// 	          var icon = $('<div class="icon"></div>').append($('<i></i>').addClass(iconClass));
// 	          row.append($('<td></td>').append(icon));	//완성된 행을 row 변수에 추가
// 	          row.append($('<td></td>').text(reviewList.id));
// 	          row.append($('<td></td>').append($('<a></a>').attr('href', './detail?festivalReviewCode=' + reviewList.festivalReviewCode).text(reviewList.content)));
// 	          row.append($('<td></td>').text(reviewList.writeDate));
// 	          row.append($('<td></td>').text(reviewList.title)); 
// 	          $("#contents").append(row); //각 행을 $("#contents")에 추가
// 	        });
// 	      },
// 			error : function getReportedList() {
// 				swal('출력오류!', "신고리뷰목록을 불러오는데 실패했습니다.", 'error');
// 			}
// 	    });
// 	  });
	
	  //전체목록
// 	$("#allReview").on('click',function () {
// 		 $("#contents").empty();
// 		    $.ajax({
// 		      url : "./all",
// 		      type : "get",
// 		      datatype : "json",
// 		      success : function(data) {
// 		        $.each(data, function(index,reviewList) { //데이터의 각 항목에 대해 반복
// 		          var row = $('<tr></tr>');
// 		          var status = reviewList.status;
// 		          var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle btn-sm" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
// 		          var icon = $('<div class="icon"></div>').append($('<i></i>').addClass(iconClass));
// 		          row.append($('<td></td>').append(icon));	//완성된 행을 row 변수에 추가
// 		          row.append($('<td></td>').text(reviewList.id));
// 		          row.append($('<td></td>').append($('<a></a>').attr('href', './detail?festivalReviewCode=' + reviewList.festivalReviewCode).text(reviewList.content)));
// 		          row.append($('<td></td>').text(reviewList.writeDate));
// 		          row.append($('<td></td>').text(reviewList.title));
// 		          $("#contents").append(row); //각 행을 $("#contents")에 추가
// 		        });
// 		      },
// 		      error : function() {
// 		    	  swal('출력오류!', "리뷰목록을 불러오는데 실패했습니다.", 'error');
// 		      }
// 		    });
// 		  });
	  
	  //table box 검색  
// 	  $("#reviewSearch").on('click',function() { //리뷰 리스트 검색결과 출력
// 		var reviewKeyword = $('#reviewKeyword').val(); 
// 	    var tableBox = $("#tableBox").val(); 
// 	    $("#contents").empty();
// 	    $.ajax({
// 	      url : "./search",
// 	      type : "get",
// 		  data: {reviewKeyword : reviewKeyword, 
//  	          tableBox : tableBox}, 
// 	      datatype : "json",
// 	      success : function(data) {
// 	        $.each(data, function(index,reviewList) { //데이터의 각 항목에 대해 반복
// 	          var row = $('<tr></tr>');
// 	          var status = reviewList.status;
// 	          var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle btn-sm" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
// 	          var icon = $('<div class="icon"></div>').append($('<i></i>').addClass(iconClass));
// 	          row.append($('<td></td>').append(icon));	//완성된 행을 row 변수에 추가
// 	          row.append($('<td></td>').text(reviewList.id));
// 	          row.append($('<td></td>').append($('<a></a>').attr('href', './detail?festivalReviewCode=' + reviewList.festivalReviewCode).text(reviewList.content)));
// 	          row.append($('<td></td>').text(reviewList.writeDate));
// 	          row.append($('<td></td>').text(reviewList.title)); 
// 	          $("#contents").append(row); //각 행을 $("#contents")에 추가
// 	        });
// 	      },
// 			error : function() {
// 				swal('출력오류!', "검색한 리뷰목록을 불러오는데 실패했습니다.", 'error');		
// 			}
// 	    });
// 	  });
	  
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
	        	swal('검색창오류!', "연도별 축제목록을 불러오는데 실패했습니다.", 'error');
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
		        	swal('검색창오류!', "연도별 축제를 불러오는데 실패했습니다.", 'error');
		        }
		    });
		});

// 		/* --- 연도별 축제 선택시 리뷰 출력 --- */
// 		$('#titleList').change(function() {
// 			$("#contents").empty();
// 		    var festivalCode = $(this).val();
// 		 // AJAX 호출
// 		    $.ajax({
// 		        url: './selectYearReview', // 서버에서 데이터를 가져올 경로
// 		        type: 'GET', // GET 방식으로 요청
// 		        data: { festivalCode: festivalCode }, // 서버로 보낼 데이터
// 		        dataType: "json",
// 		        success: function(data) {
// 		    	  $.each(data, function(index,reviewList) { //데이터의 각 항목에 대해 반복
// 		    	     var row = $('<tr></tr>');
// 		    	     var status = reviewList.status;
// 		    	     var iconClass = (status > 0 && status < 2) ? "fas fa-exclamation-triangle btn-danger btn-circle btn-sm" : ""; //상태(status)에 따라 적절한 아이콘 클래스를 선택, 생성
// 		    	     var icon = $('<div class="icon"></div>').append($('<i></i>').addClass(iconClass));
// 		    	     row.append($('<td></td>').append(icon));	//완성된 행을 row 변수에 추가
// 		    	     row.append($('<td></td>').text(reviewList.id));
// 		    	     row.append($('<td></td>').append($('<a></a>').attr('href', './detail?festivalReviewCode=' + reviewList.festivalReviewCode).text(reviewList.content)));
// 		    	     row.append($('<td></td>').text(reviewList.writeDate));
// 		    	     row.append($('<td></td>').text(reviewList.title)); 
// 		    	     $("#contents").append(row); //각 행을 $("#contents")에 추가
// 		    	     });
// 		    	  	},
// 		    		error : function getReportedList() {
// 		    			swal('출력오류!', "검색한 리뷰목록을 불러오는데 실패했습니다.", 'error');			
// 		    		}
// 		        });
// 		    });

		/*------------------------------ 
		
			페이징 추가한 스크립트의 목록출력이 되지 않음: 1. radioBtn의 value가 "" 라서 목록출력이 되지 않음. 
		 	(""인 사유- 전체:status가 0,1,2가 혼용되어 value를 특정한 값으로 정하지 않았음.:radio 버튼을 전체-> 정상상태0/신고된리뷰1/블라인드된리뷰2 로 구분하면 문제 해결가능성 높음)
		 	2.getPage에 값이 전달되지 않음(신고리스트 출력이 되긴 함: getPage() 값이 들어가는 것 같음.)
		 	
		 ------------------------------------*/
		 
		 
		/* --- 진행상황별 리스트 출력 --- */
		//라디오 버튼 변경 시 이벤트 리스너 추가
		$(document).on('change', 'input[name=sort]', function() {
			$('#titleListInput').val("0");
			$('#tableBoxInput').val("");
			$('#searchInput').val("");
			//해당 구역 삭제
// 			$("#content").empty();
// 			$("#myPage").empty();
		    // 선택된 라디오 버튼 값 가져오기
		    var status = $('input[name=sort]:checked').val();
			$("#radioInput").val(status);
			console.log(status);
		    getPage();
		    
		});
		
		/* --- 연도별 축제 선택시 축제 출력 --- */
		$('#titleList').change(function() {
			$('#radioInput').val("");
			$('#tableBoxInput').val("");
			$('#searchInput').val("");
// 			$("#contents").empty();
// 			$("#myPage").empty();
		    var festivalCode = $(this).val();
		    $("#titleListInput").val(festivalCode);
		    console.log(festivalCode);
		    getPage();
		});

		/* --- 리뷰 검색 --- */
		$('#reviewSearch').on('click', function(){
		    var reviewKeyword = $('#reviewKeyword').val();
		    var tableBox = $("#tableBox").val();
		    $('#radioInput').val("");
		    $('#titleListInput').val("0");
// 		    $("#contents").empty();
// 		    $("#myPage").empty();
		    $("#tableBoxInput").val(tableBox);
		    $("#searchInput").val(reviewKeyword);
		    console.log(tableBox);
		    console.log(reviewKeyword);
		    getPage();
		 });
		 
		//페이징 처리		
		function getPage(nowPage) {
			var radioInput = $('input[name=sort]:checked').val();
			var titleListInput = $('#titleListInput').val();
			var tableBoxInput = $('#tableBoxInput').val();
			var searchInput = $('#searchInput').val();
			console.log(radioInput);
			console.log(titleListInput);
			console.log(tableBoxInput);
			console.log(searchInput);
 			return false;
			$.ajax({
				url: "./reviewpaging",
				type: "get",
				data: {
						nowPage : nowPage, 
						radioInput : radioInput,
						titleListInput :titleListInput,
						tableBoxInput :tableBoxInput,
						searchInput :searchInput
						},
						success: function(data){	
			    			$("#contents").empty();
			    			$("#myPage").empty();
							console.log("페이징 처리 된 리스트 가져옴!");					
				              var startPage = data.startPage;
				              var cntPerPage = data.cntPerPage;
				              var endPage = data.endPage;
				              var nowPage = data.nowPage;
				              var lastPage = data.lastPage;
				              var viewAll = data.viewAll;
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
			      	      
							if (startPage != 1){
								$("#myPage").append("<li class='page-item'><a class='page-link nowPage'>&lt;</a></li>");
							} 
							if(nowPage != 1) {
								$("#myPage").append("<li class='page-item'><a class='page-link nowPage' href='javascript:getPage(" + startPage + ")'>First</a></li>");
								$("#myPage").append("<li class='page-item'><a class='page-link nowPage' href='javascript:getPage(" + (nowPage-1) + ")'> < </a></li>");
							}
							for (var num = startPage; num <= endPage; num++) {
								if (num == nowPage) {
									$("#myPage").append("<li class='page-item'><a class='page-link nowPage'><b>" + num + "</b></a></li>");
								} else {
									$("#myPage").append("<li class='page-item'><a class='page-link nowPage' href='javascript:getPage(" + num + ")'> "+ num + "</a></li>");		
								}
							}
							if (nowPage != endPage) {
								$("#myPage").append("<li class='page-item'><a class='page-link nowPage' href='javascript:getPage(" + (nowPage+1) + ")'> > </a></li>");
								$("#myPage").append("<li class='page-item'><a class='page-link nowPage' href='javascript:getPage(" + endPage + ")'>End</a></li>");
							}
							if (endPage != lastPage) {
								$("#myPage").append("<li class='page-item'><a class='page-link nowPage'>&gt;</a></li>");
							}				
						},//end success
						error:function(){
							swal('출력오류!', "검색한 리뷰목록을 불러오는데 실패했습니다.", 'error');
						}//end error			
					});
			}
});	
</script>	





 <%@ include file="../adminfooter.jsp" %>