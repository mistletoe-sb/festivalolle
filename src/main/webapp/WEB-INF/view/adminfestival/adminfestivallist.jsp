<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>

<style>

td, th {
	padding: 0.75rem;
    vertical-align: top;
    border: 0.0625rem solid #e3e6f0 !important;
}
/*
   [type="radio"] {
  border-radius:20px;
  vertical-align: middle;
  position: absolute;
  opacity: 0;
  accent-color: red !important;
} 

#btnradio1 input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
#btnradio1 input[type=radio]+label{
    background-color: #fff;
    color: #333;
    accent-color: red;
}
#radiostatus input[type=radio]:checked.btn-check+label:after {
    background-color: #333 !important;
    color: #fff !important;
    accent-color: red !important;
}

input[type=radio]:checked#btnradio1+label:after {
    background-color: #333 !important;
    color: #fff !important;
    accent-color: red !important;
} */
.festival_radio > label {
	margin-bottom: 0px;
}

</style>

		<!-- ★내용삽입★ -->
<div class="container-fluid">
		
		<div>
			
		</div>
		<a></a>
		<div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">축제 리스트</h6>
            </div>
            
            
            <div class="card-body">
            
				<div>
					<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- Topbar Search -->
				
					<div style="display:flex; height:2.5rem;">
						<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" >
							<div class="input-group" style ="width:100px; float:left; height:100%; ">
								<select id= "tableBox" class="form-control bg-light border-0 small" aria-label="Default select example" style="height:100%;">
									<option value="title">축제명</option>
									<option value="admin_name">작성자</option>
								</select>
								<input type="hidden" id="tableBoxInput" value="" />
							</div>
							
							
							<div class="input-group" style ="float:left;  height:100%;">
									<input type="text" class="form-control bg-light border-0 small" id="festivalKeyword" placeholder="검색" aria-label="Search" aria-describedby="basic-addon2" style ="margin:0; width:12.5rem; height:100%;">
								
								<div class="input-group-append" style ="float:left;  margin:0;">
									<button class="btn btn-primary" type="button" id="festivalSearch">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
								<input type="hidden" id="searchInput" value="" />
							</div>				
						</form> 
					</div>
					
					<div  style=" display:flex; height:2.5rem;">
					<div style ="float:right;">
						<select id= "yearBox" class="form-control bg-light border-0 small" aria-label="Default select example" style ="float:right; width:6.25rem;">
						
						</select>
					</div>
						<div style ="float:right;">
							<select name = "titleList" id = "titleList" class="form-control bg-light border-0 small" aria-label="Default select example" style ="float:right; width:15.625rem;">
							
							</select>
							<input type="hidden" id="titleListInput" value="" />
						</div>
						</div>
					</nav>
				</div>
                <div class="table-responsive">

			<div style="width: 100%;
    height: 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;">
				<div class="festival_radio" style="float:left; padding-top: 10px;">
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" value = "">
				  <label  for="btnradio1">전체</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value = "0">
				  <label  for="btnradio2">비공개</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" value = "1">
				  <label  for="btnradio3">진행중</label>
				    <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" value = "2">
				  <label  for="btnradio4">진행예정</label>
				    <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off" value = "3">
				  <label  for="btnradio5">진행완료</label>
				
					<input type="hidden" id="radioInput" value="" />
				</div>
				
				
				<div style="float:right;">
				  <button style="float:right;" class="btn btn-primary" onclick="location.href='<c:url value='/admin/festivalinsertform'/>'">축제 추가</button>
				</div>
			</div>
			<div class="table-responsive" style = "margin-top:0.5rem; height:43rem !important;">
			<table class="table-bordered" id="dataTable" style="text-align:center; width:100%;  cellspacing:0" >
		            <thead style="text-align:center">
		              <tr>
		                <th scope="col" style="width : 10%">진행상태</th>
		                <th scope="col">축제명</th>
		                <th scope="col">작성자</th>
		                <th scope="col">등록일자</th>
		                <th scope="col" style="width : 10%"></th>
		                <th scope="col" style="width : 10%"></th>
		              </tr>
		            </thead>
		            <tbody id = "myList" style="text-align:center">
		            
		            </tbody>
		        </table>
		        </div >
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
        </div>


<%@ include file="../adminfooter.jsp" %>

<script>
//var festialList = document.querySelector("#festialList");

/* --- 화면 로딩시 --- */
$(document).ready(function() {
	/* --- 연도별 타이틀 호출 --- */
	$("#myList").empty();
	$("#myPage").empty();
	$("#titleList").empty();
    var titleyear = $(this).val();
    // AJAX 호출
    $.ajax({
        url: './selectYearTitleList', // 서버에서 데이터를 가져올 경로
        type: 'GET', // GET 방식으로 요청
        data: { titleyear: titleyear }, // 서버로 보낼 데이터
        dataType: "json",
        success: function(data) {
        	$("#titleList").append("<option disabled selected> 축제를 선택 해주세요. </option>");
            $.each(data, function(index, item) {
            	$("#titleList").append("<option value='" +item.festivalCode+ "'>" +item.title + "</option>");
            });
        },
        error: function() {
            // AJAX 요청이 실패한 경우 에러 처리
            alert('데이터를 불러오는데 실패했습니다.');
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

/* --- 진행상황별 리스트 출력 --- */
//라디오 버튼 변경 시 이벤트 리스너 추가
$('input[name=btnradio]').change(function() {
	$('#titleListInput').val("");
	$('#tableBoxInput').val("");
	$('#searchInput').val("");
	//해당 구역 삭제
	$("#myList").empty();
	$("#myPage").empty();
    // 선택된 라디오 버튼 값 가져오기
    var status = $('input[name=btnradio]:checked').val();
	$("#radioInput").val(status);
    getPage();
    
});
//$("#titleList").addEventListener("change",function()
// $('select[name=titleList]').change(function(){		

	
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
        	$("#titleList").append("<option disabled selected> 축제를 선택 해주세요. </option>");
        	$.each(data, function(index, item) {
        		$("#titleList").append("<option value='" +item.festivalCode+ "'>" +item.title + "</option>");
            });
        },
        error: function() {
            // AJAX 요청이 실패한 경우 에러 처리
            alert('데이터를 불러오는데 실패했습니다.');
        }
    });
});

/* --- 연도별 축제 선택시 축제 출력 --- */
$('#titleList').change(function() {
	$('#radioInput').val("");
	$('#tableBoxInput').val("");
	$('#searchInput').val("");
	$("#myList").empty();
	$("#myPage").empty();
    var festivalCode = $(this).val();
    $("#titleListInput").val(festivalCode);
    getPage();
});

/* --- 검색 --- */
$('#festivalSearch').on('click', function(){
    var festivalKeyword = $('#festivalKeyword').val();
    var tableBox = $("#tableBox").val();
    $('#radioInput').val("");
    $('#titleListInput').val("");
    $("#myList").empty();
    $("#myPage").empty();
    $("#tableBoxInput").val(tableBox);
    $("#searchInput").val(festivalKeyword);
    getPage();
 })

 
 //페이징처리		
			
		function getPage(nowPage) {
	$("#myList").empty();
	$("#myPage").empty();
			var radioInput = $('#radioInput').val();
			var titleListInput = $('#titleListInput').val();
			var tableBoxInput = $('#tableBoxInput').val();
			var searchInput = $('#searchInput').val();

			
			$.ajax({
				url: "./festivallistpaging",
				type: "post",
				data: {
						nowPage : nowPage, 
						radioInput : radioInput,
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

	         	   $.each(viewAll, function(index, item) {
	                   $("#myList").append("<tr>");
	                   if (item.status == 0) {
	                   	  $("#myList").append("<td><a class='btn btn-secondary' style='WIDTH: 6rem; cursor:default;'disabled><span class='text'>비공개</span></a></td>");
	                   	} else if (item.status == 1) {
	                   	  $("#myList").append("<td><a class='btn btn-success' style='WIDTH: 6rem;cursor:default;' disabled><span class='text'>진행중</span></a></td>");
	                   	} else if (item.status == 2) {
	                   	  $("#myList").append("<td><a class='btn btn-primary ' style='WIDTH: 6rem;cursor:default;' disabled><span class='text'>진행 예정</span></a></td>");
	                   	} else if (item.status == 3) {
	                   	  $("#myList").append("<td><a class='btn btn-warning' style='WIDTH: 6rem;cursor:default;' disabled><span class='text'>진행 완료</span></a></td>");
	                   	} 
	                   $("#myList").append("<td scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+item.festivalCode+"'/>'>"+item.title+"</a></td>");
	                   $("#myList").append("<td scope='col'>"+item.adminName+"</td>");
	                   $("#myList").append("<td scope='col'>"+item.registerDate+"</td>");
	                   $("#myList").append('<td scope="col"><button type="button" class="btn btn-primary" style="WIDTH: 7rem;" onclick="location.href='+"'<c:url value='/admin/ticket/list?festivalCode="+item.festivalCode+"'/>'"+'">구매자 목록</button></td>');
	                   $("#myList").append('<td scope="col"><button type="button" class="btn btn-primary" style="WIDTH: 7rem;" onclick="location.href='+"'<c:url value='/admin/review/list?festivalCode="+item.festivalCode+"'/>'"+'">리뷰 목록</button></td>');
	                   $("#myList").append("</tr>");
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
					alert("안됨");
				}//end error	
			})			
		}
</script>