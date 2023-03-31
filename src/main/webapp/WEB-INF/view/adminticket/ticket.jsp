<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>

	<div class="container-fluid">
	<div class="card shadow mb-4">
	<div class="card-body"> 
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
		<!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
             <div class="input-group" style ="float:left;">
               <select id= "tableBox" class="form-control bg-light border-0 small" aria-label="Default select example">
                 <option value="id">아이디</option>
                 <option value="name">이름</option>
                 <option value="mobile">전화번호</option>
                 </select>
                   </div>
                   <div style ="float:left;">
                   <div style ="float:left;">
                     <input type="text" class="form-control bg-light border-0 small" id="buyerKeyword" placeholder="검색"
                     aria-label="Search" aria-describedby="basic-addon2">
                   </div>
                    <div class="input-group-append" style ="float:left;">
                      <button class="btn btn-primary" type="button" id="buyerSearch" onClick="getSearchBuyer()">
                      	<i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
          	</form>
          	<div>
         		<select id= "yearBox" class="form-control bg-light border-0 small" aria-label="Default select example" style ="right"></select>
         	</div> 
          	<div>
         	<select name = "titleList" id = "titleList" class="form-control bg-light border-0 small" aria-label="Default select example" style ="right"></select>
			</div>
         	</nav>
          	
		 	<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
					<tbody id="contents">
						<c:forEach items="${ticketList}" var="ticketList">
							<tr>
								<td>${ticketList.id}</td>
								<td>${ticketList.name}</td>
								<td>${ticketList.mobile}</td>
								<td>${ticketList.purchaseTime}</td>
								<td>${ticketList.entranceTime}</td>
								<td>${ticketList.couponUseTime}</td>
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
	/* --- 검색 --- */
	$('#buyerSearch').on('click', function(){
	    var buyerKeyword = $('#buyerKeyword').val();
	    var tableBox = $("#tableBox").val();
	    $("#contents").empty();
	    $.ajax({
	       url: "./search",
	       type: "GET",
	       data: {buyerKeyword : buyerKeyword,
	          tableBox : tableBox},
	          dataType: "json",
	       success: function(data) {
	          
	          $.each(data, function(index, ticketList){
	               $("#contents").append("<tr>");
	               if (ticketList.status == 0) {
	                    $("#contents").append("<th><a href='#' class='btn btn-secondary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>비공개</span></a></th>");
	                  } else if (item.status == 1) {
	                    $("#contents").append("<th><a href='#' class='btn btn-success' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행중</span></a></th>");
	                  } else if (item.status == 2) {
	                    $("#contents").append("<th><a href='#' class='btn btn-primary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 예정</span></a></th>");
	                  } else if (item.status == 3) {
	                    $("#contents").append("<th><a href='#' class='btn btn-warning' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 완료</span></a></th>");
	                  } 
	               $("#contents").append("<th scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+ticketList.festivalCode+"'/>'>"+ticketList.title+"</a></th>");
	               $("#contents").append("<th scope='col'>"+ticketList.adminName+"</th>");
	               $("#contents").append("<th scope='col'>"+ticketList.registerDate+"</th>");
	               $("#contents").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>구매자 목록</button></th>");
	               $("#contents").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>리뷰 관리자</button></th>");
	               $("#contents").append("</tr>");
	           });
	       },
	       error:function(){
	          alert("안됨");
	       }//end error   
	    });
	});
	    /* --- 연도 리스트 생성 --- */
	    $("#yearList").on('click',function getYears(getY){
	      $("#yearBox option").empty(); //기존 option을 삭제
	       
	       var stY = Number(getY)-5; //올해 기준으로 -5년부터 +5년
	       var enY = Number(getY)+5;
	       
	       for(var y=stY; y<=enY; y++){
	          $("#yearBox").append("<option value='" + y + "'>" + y + "년" + "</option>");
	       }
	    });
	    
	    /* --- 연도 선택시 축제 리스트 출력 --- */ //구매자로 변경해야 할 항목만 바꾸기
	    $('#yearBox').change(function() {
	       $("#titleList").empty(); //해당 구역 삭제
	        var titleyear = $(this).val();

	        $.ajax({
	            url: './selectYearTitleList', // 서버에서 데이터를 가져올 경로
	            type: 'GET', // GET 방식으로 요청
	            data: { titleyear: titleyear }, // 서버로 보낼 데이터
	            dataType: "json",
	            success: function(data) {
	               $("#titleList").append("<option > 축체를 선택 해주세요. </option>");
	               $.each(data, function(index, item) {
	                  $("#titleList").append("<option value='" +item.festivalCode+ "'>" +item.title + "</option>");
	                });
	            },
	            error: function() {
	                alert('데이터를 불러오는데 실패했습니다.');
	            }
	        });
	    });
	    
	    /* --- 연도별 축제 선택시 축제 출력 --- */
	    $('#titleList').change(function() {
	       $("#contents").empty();
	        var festivalCode = $(this).val();
	     // AJAX 호출
	        $.ajax({
	            url: './selectYearFestival', // 서버에서 데이터를 가져올 경로
	            type: 'GET', // GET 방식으로 요청
	            data: { festivalCode: festivalCode }, // 서버로 보낼 데이터
	            dataType: "json",
	            success: function(data) {
	                $.each(data, function(index, item) {
	                    $("#contents").append("<tr>");
	                    if (item.status == 0) {
	                         $("#contents").append("<th><a href='#' class='btn btn-secondary btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>비공개</span></a></th>");
	                       } else if (item.status == 1) {
	                         $("#contents").append("<th><a href='#' class='btn btn-success btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행중</span></a></th>");
	                       } else if (item.status == 2) {
	                         $("#contents").append("<th><a href='#' class='btn btn-primary btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 예정</span></a></th>");
	                       } else if (item.status == 3) {
	                         $("#contents").append("<th><a href='#' class='btn btn-warning btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 완료</span></a></th>");
	                       } 
	                    $("#contents").append("<th scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+item.festivalCode+"'/>'>"+item.title+"</a></th>");
	                    $("#contents").append("<th scope='col'>"+item.adminName+"</th>");
	                    $("#contents").append("<th scope='col'>"+item.registerDate+"</th>");
	                    $("#contents").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>구매자 목록</button></th>");
	                    $("#contents").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>리뷰 관리자</button></th>");
	                    $("#contents").append("</tr>");
	                });
	            },
	            error: function() {
	                // AJAX 요청이 실패한 경우 에러 처리
	                alert('데이터를 불러오는데 실패했습니다.');
	            }
	        });
	    });
});

</script>







 <%@ include file="../adminfooter.jsp" %>