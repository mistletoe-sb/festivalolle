<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>
 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<div class="container-fluid">
	<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">구매자 리스트</h6>
	</div>
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
                 <input type="hidden" id="tableBoxInput" value="" />
                   </div>
                   <div style ="float:left;">
                   <div style ="float:left;">
                     <input type="text" class="form-control bg-light border-0 small" id="buyerKeyword" placeholder="검색"
                     aria-label="Search" aria-describedby="basic-addon2">
                   </div>
                    <input type="hidden" id="searchInput" value="" />
                    <div class="input-group-append" style ="float:left;">
                      <button class="btn btn-primary" type="button" id="buyerSearch">
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
         	<input type="hidden" id="titleListInput" value="0" />
			</div>
         	</nav>
          	
		 	<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead class="text-center">
						<tr>
		
							<th>아이디</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>구매일시</th>
							<th>입장일시</th>
							<th>쿠폰사용일시</th>
							<th>축제명</th>
						</tr>
					</thead>
					<tbody class="text-center" id="contents">
						<c:forEach items="${ticketList}" var="ticketList">
							<tr>
								<td>${ticketList.id}</td>
								<td>${ticketList.name}</td>
								<td>${ticketList.mobile}</td>
								<td>${ticketList.purchaseTime}</td>
								<td>${ticketList.entranceTime}</td>
								<td>${ticketList.couponUseTime}</td>
								<td>${ticketList.title}</td>
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
			<%@ include file="../adminfooter.jsp" %>
<script type="text/javascript">

document.addEventListener('keydown', function(event) {
	  if (event.key === 'Enter') {
	    event.preventDefault();
	    document.querySelector('#buyerSearch').click();
	  }
	});

 $(document).ready(function() {
	 
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
		
		/* --- 전체 리스트 생성 --- */
		getPage();
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

 	        $.ajax({
 	            url: './selectYearTitleList', // 서버에서 데이터를 가져올 경로
 	            type: 'GET', // GET 방식으로 요청
 	            data: { titleyear: titleyear }, // 서버로 보낼 데이터
 	            dataType: "json",
 	           success: function(data) {
 	              $("#titleList").append("<option selected> 축제를 선택 해주세요. </option>");
 	              $.each(data, function(index, ticketList) {
 	                 $("#titleList").append("<option value='" +ticketList.festivalCode+ "'>" +ticketList.title + "</option>");
 	               });
 	           },
 	           error: function() {
 	               // AJAX 요청이 실패한 경우 에러 처리
 	        	  swal('검색창오류!', "연도별 축제를 불러오는데 실패했습니다.", 'error');
 	           }
 	       });
 	   });

		/* --- 연도별 축제 선택시 축제 출력 --- */
		$('#titleList').change(function() {
			$("#contents").empty();
			$("#myPage").empty();
			$('#tableBoxInput').val("");
			$('#searchInput').val(""); 
		    var festivalCode = $(this).val();
		    $("#titleListInput").val(festivalCode);
		    getPage();
		});

		/* --- 구매자 검색 --- */
		$("#buyerSearch").on('click', function(){
			$("#contents").empty();
			$("#myPage").empty();
		    var buyerKeyword = $("#buyerKeyword").val();
		    var tableBox = $("#tableBox").val();
		    $('#titleListInput').val("0");
		    $("#tableBoxInput").val(tableBox);
		    $("#searchInput").val(buyerKeyword);
		    getPage();
		 });
 	    
 	//페이징 처리		
	function getPage(nowPage) {
		$("#contents").empty();
    	$("#myPage").empty();
		var titleListInput = $('#titleListInput').val();
		var tableBoxInput = $('#tableBoxInput').val();
		var searchInput = $('#searchInput').val();
		console.log(titleListInput);
		console.log(tableBoxInput);
		console.log(searchInput);
		$.ajax({
			url: "./ticketpaging",
			type: "get",
			data: {
					nowPage : nowPage, 
					titleListInput :titleListInput,
					tableBoxInput :tableBoxInput,
					searchInput :searchInput
					},
					success: function(data){	
						console.log("페이징 처리 된 리스트 가져옴!");					
		              	var startPage = data.startPage;
		              	var cntPerPage = data.cntPerPage;
		              	var endPage = data.endPage;
		              	var nowPage = data.nowPage;
		              	var lastPage = data.lastPage;
		              	var viewAll = data.viewAll;
		              	$.each(viewAll, function(index,item) { //데이터의 각 항목에 대해 반복
		   	       	       var row = $('<tr></tr>')
		   	       	       row.append($('<td></td>').text(item.id));
		   	       	       row.append($('<td></td>').text(item.name));
		   	       	       row.append($('<td></td>').text(item.mobile));
		   	       	       row.append($('<td></td>').text(item.purchaseTime));
		   	       	       row.append($('<td></td>').text(item.entranceTime));
		   	       	       row.append($('<td></td>').text(item.couponUseTime));
		   	       	   	   row.append($('<td></td>').text(item.title));
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
</script>





 