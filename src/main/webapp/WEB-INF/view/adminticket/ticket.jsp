<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>

	
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
                   </div>
                   <div style ="float:left;">
                   <div style ="float:left;">
                     <input type="text" class="form-control bg-light border-0 small" id="buyerKeyword" placeholder="검색"
                     aria-label="Search" aria-describedby="basic-addon2">
                   </div>
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
	      	success : function(data) {
	        $.each(data, function(index,ticketList) { //데이터의 각 항목에 대해 반복
	          var row = $('<tr></tr>')
	          row.append($('<td></td>').text(ticketList.id));
	          row.append($('<td></td>').text(ticketList.name));
	          row.append($('<td></td>').text(ticketList.mobile));
	          row.append($('<td></td>').text(ticketList.purchaseTime));
	          row.append($('<td></td>').text(ticketList.entranceTime));
	          row.append($('<td></td>').text(ticketList.couponUseTime));
	          $("#contents").append(row); //각 행을 $("#contents")에 추가
	        });
	      },
 	       error:function(){ 
	          alert("error1"); 
 	       }//end error    
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
            $.each(data, function(index, item) {
            	$("#titleList").append("<option value='" +item.festivalCode+ "'>" +item.title + "</option>");
            });
        },
        error: function() {
            // AJAX 요청이 실패한 경우 에러 처리
            alert('error2');
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

 	        $.ajax({
 	            url: './selectYearTitleList', // 서버에서 데이터를 가져올 경로
 	            type: 'GET', // GET 방식으로 요청
 	            data: { titleyear: titleyear }, // 서버로 보낼 데이터
 	            dataType: "json",
 	           success: function(data) {
 	              $("#titleList").append("<option > 축제를 선택 해주세요. </option>");
 	              $.each(data, function(index, ticketList) {
 	                 $("#titleList").append("<option value='" +ticketList.festivalCode+ "'>" +ticketList.title + "</option>");
 	               });
 	           },
 	           error: function() {
 	               // AJAX 요청이 실패한 경우 에러 처리
 	               alert('error3');
 	           }
 	       });
 	   });
	    
 	    /* --- 연도별 축제 선택시 구매자 출력 --- */
 	    $('#titleList').change(function() {
 	       $("#contents").empty();
 	        var festivalCode = $(this).val();
 	     // AJAX 호출
 	        $.ajax({
 	            url: './selectYearBuyer', // 서버에서 데이터를 가져올 경로
 	            type: 'GET', // GET 방식으로 요청
 	            data: { festivalCode: festivalCode }, // 서버로 보낼 데이터
 	            dataType: "json",
 	            success: function(data) {
 	       	     $.each(data, function(index,ticketList) { //데이터의 각 항목에 대해 반복
 	       	       var row = $('<tr></tr>')
 	       	       row.append($('<td></td>').text(ticketList.id));
 	       	       row.append($('<td></td>').text(ticketList.name));
 	       	       row.append($('<td></td>').text(ticketList.mobile));
 	       	       row.append($('<td></td>').text(ticketList.purchaseTime));
 	       	       row.append($('<td></td>').text(ticketList.entranceTime));
 	       	       row.append($('<td></td>').text(ticketList.couponUseTime));
 	       	       $("#contents").append(row); //각 행을 $("#contents")에 추가
 	       	       });
 	       	     },
 	        	 error:function(){ 
 	       	     alert("error4"); 
 	        	 }
 	        });
 	    });
 	});

</script>





 <%@ include file="../adminfooter.jsp" %>