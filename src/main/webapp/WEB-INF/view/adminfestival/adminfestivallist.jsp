<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>
<style>
 [type="radio"] {
  vertical-align: middle;
  position: absolute;
  
  
}


	<div class="container-fluid">
</style>

		<!-- ★내용삽입★ -->

		
		<div>
			
		</div>
		
		<a></a>
		<div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">축제 리스트</h6>
            </div>
            
            		<div>
		<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top">
		<!-- Topbar Search -->
               <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                     <div class="input-group" style ="float:left;">
                     	<select id= "tableBox" class="form-control bg-light border-0 small" aria-label="Default select example">
                     		<option value="title">축제명</option>
							<option value="admin_name">작성자</option>
                     	</select>
                     	</div>
                     	<div style ="float:left;">
                     	<div style ="float:left;">
                           <input type="text" class="form-control bg-light border-0 small" id="festivalKeyword" placeholder="검색"
                               aria-label="Search" aria-describedby="basic-addon2">
                               </div>
                           <div class="input-group-append" style ="float:left;">
                               <button class="btn btn-primary" type="button" id="festivalSearch">
                                   <i class="fas fa-search fa-sm"></i>
                               </button>
                           </div>
                       </div>
                 </form> 
                 
		
		<div>
			<select id= "yearBox" class="form-control bg-light border-0 small" aria-label="Default select example" style ="right">

			</select>
			</div>
			<div>
			<select name = "titleList" id = "titleList" class="form-control bg-light border-0 small" aria-label="Default select example" style ="right">
			</select>
			</div>
			</nav>
		</div>
            
            <div class="card-body">
                <div class="table-responsive">
			<div class="btn-group " id="radiostatus" role="group" aria-label="Basic radio toggle button group">
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" value = "5" style="position: absolute;">
			  <label class="btn btn-outline-primary" for="btnradio1">전체</label>
			
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value = "0" style="position: absolute;">
			  <label class="btn btn-outline-secondary" for="btnradio2">비공개</label>
			
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" value = "1" style="position: absolute;">
			  <label class="btn btn-outline-success" for="btnradio3">진행중</label>
			    <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" value = "2" style="position: absolute;">
			  <label class="btn btn-outline-primary" for="btnradio4">진행예정</label>
			    <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off" value = "3" style="position: absolute;">
			  <label class="btn btn-outline-warning" for="btnradio5">진행완료</label>
			</div>
			
			
	
			<button style="float:right" class="btn btn-primary" onclick="location.href='<c:url value='/admin/mypageticketlist'/>'">마이페이지 리스트</button>
			<button style="float:right" class="btn btn-primary" onclick="location.href='<c:url value='/admin/festivalinsertform'/>'">축제 추가</button>
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" >
		            <thead >
		              <tr>
		                <th scope="col">진행상태</th>
		                <th scope="col">축제명</th>
		                <th scope="col">작성자</th>
		                <th scope="col">등록일자</th>
		                <th scope="col"></th>
		                <th scope="col"></th>
		              </tr>
		            </thead>
		            <tbody id = "myList">
		            
		            </tbody>
		            
		        </table>
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
    $.ajax({
        url: "./statusfestivallist",
        type: "GET",
        dataType: "json",
        success: function(data) {
            $.each(data, function(index, item) {
                $("#myList").append("<tr>");
                if (item.status == 0) {
                	  $("#myList").append("<th><a href='#' class='btn btn-secondary btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>비공개</span></a></th>");
                	} else if (item.status == 1) {
                	  $("#myList").append("<th><a href='#' class='btn btn-success btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행중</span></a></th>");
                	} else if (item.status == 2) {
                	  $("#myList").append("<th><a href='#' class='btn btn-primary btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 예정</span></a></th>");
                	} else if (item.status == 3) {
                	  $("#myList").append("<th><a href='#' class='btn btn-warning btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 완료</span></a></th>");
                	} 

                $("#myList").append("<th scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+item.festivalCode+"'/>'>"+item.title+"</a></th>");
                $("#myList").append("<th scope='col'>"+item.adminName+"</th>");
                $("#myList").append("<th scope='col'>"+item.registerDate+"</th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-primary' style='WIDTH: 90pt;'>구매자 목록</button></th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-primary' style='WIDTH: 90pt;'>리뷰 관리자</button></th>");
                $("#myList").append("</tr>");
            });
        }
    });
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
	//해당 구역 삭제
	$("#myList").empty();
    // 선택된 라디오 버튼 값 가져오기
    var status = $('input[name=btnradio]:checked').val();

    // AJAX 호출
    $.ajax({
        url: './festivastatusllist', // 서버에서 데이터를 가져올 경로
        type: 'GET', // GET 방식으로 요청
        data: { status: status }, // 서버로 보낼 데이터
        dataType: "json",
        success: function(data) {
            $.each(data, function(index, item) {
                $("#myList").append("<tr>");
                if (item.status == 0) {
                	  $("#myList").append("<th><a href='#' class='btn btn-secondary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>비공개</span></a></th>");
                	} else if (item.status == 1) {
                	  $("#myList").append("<th><a href='#' class='btn btn-success' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행중</span></a></th>");
                	} else if (item.status == 2) {
                	  $("#myList").append("<th><a href='#' class='btn btn-primary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 예정</span></a></th>");
                	} else if (item.status == 3) {
                	  $("#myList").append("<th><a href='#' class='btn btn-warning' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 완료</span></a></th>");
                	} 
                $("#myList").append("<th scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+item.festivalCode+"'/>'>"+item.title+"</a></th>");
                $("#myList").append("<th scope='col'>"+item.adminName+"</th>");
                $("#myList").append("<th scope='col'>"+item.registerDate+"</th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-primary' style='WIDTH: 90pt;' onclick='location.href='<c:url value='/admin/ticket/list'/>''>구매자 목록</button></th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-primary' style='WIDTH: 90pt;' onclick='location.href='<c:url value='/admin/review/list'/>''>리뷰 관리</button></th>");
            });
        },
        error: function() {
            // AJAX 요청이 실패한 경우 에러 처리
            alert('데이터를 불러오는데 실패했습니다.');
        }
    });
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
        	$("#titleList").append("<option > 축체를 선택 해주세요. </option>");
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
	$("#myList").empty();
    var festivalCode = $(this).val();
 // AJAX 호출
    $.ajax({
        url: './selectYearFestival', // 서버에서 데이터를 가져올 경로
        type: 'GET', // GET 방식으로 요청
        data: { festivalCode: festivalCode }, // 서버로 보낼 데이터
        dataType: "json",
        success: function(data) {
            $.each(data, function(index, item) {
                $("#myList").append("<tr>");
                if (item.status == 0) {
                	  $("#myList").append("<th><a href='#' class='btn btn-secondary btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>비공개</span></a></th>");
                	} else if (item.status == 1) {
                	  $("#myList").append("<th><a href='#' class='btn btn-success btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행중</span></a></th>");
                	} else if (item.status == 2) {
                	  $("#myList").append("<th><a href='#' class='btn btn-primary btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 예정</span></a></th>");
                	} else if (item.status == 3) {
                	  $("#myList").append("<th><a href='#' class='btn btn-warning btn-icon-split' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 완료</span></a></th>");
                	} 
                $("#myList").append("<th scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+item.festivalCode+"'/>'>"+item.title+"</a></th>");
                $("#myList").append("<th scope='col'>"+item.adminName+"</th>");
                $("#myList").append("<th scope='col'>"+item.registerDate+"</th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-primary' style='WIDTH: 90pt;'>구매자 목록</button></th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-primary' style='WIDTH: 90pt;'>리뷰 관리자</button></th>");
                $("#myList").append("</tr>");
            });
        },
        error: function() {
            // AJAX 요청이 실패한 경우 에러 처리
            alert('데이터를 불러오는데 실패했습니다.');
        }
    });
});

/* --- 검색 --- */
$('#festivalSearch').on('click', function(){
    var festivalKeyword = $('#festivalKeyword').val();
    var tableBox = $("#tableBox").val();
    $("#myList").empty();
    $.ajax({
       url: "./festivalSearch",
       type: "GET",
       data: {festivalKeyword : festivalKeyword,
    	   tableBox : tableBox},
    	   dataType: "json",
       success: function(data) {
    	   
    	   $.each(data, function(index, item) {
               $("#myList").append("<tr>");
               if (item.status == 0) {
               	  $("#myList").append("<th><a href='#' class='btn btn-secondary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>비공개</span></a></th>");
               	} else if (item.status == 1) {
               	  $("#myList").append("<th><a href='#' class='btn btn-success' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행중</span></a></th>");
               	} else if (item.status == 2) {
               	  $("#myList").append("<th><a href='#' class='btn btn-primary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 예정</span></a></th>");
               	} else if (item.status == 3) {
               	  $("#myList").append("<th><a href='#' class='btn btn-warning' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 완료</span></a></th>");
               	} 
               $("#myList").append("<th scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+item.festivalCode+"'/>'>"+item.title+"</a></th>");
               $("#myList").append("<th scope='col'>"+item.adminName+"</th>");
               $("#myList").append("<th scope='col'>"+item.registerDate+"</th>");
               $("#myList").append("<th scope='col'><button type='button' class='btn btn-primary' style='WIDTH: 90pt;'>구매자 목록</button></th>");
               $("#myList").append("<th scope='col'><button type='button' class='btn btn-primary' style='WIDTH: 90pt;'>리뷰 관리자</button></th>");
               $("#myList").append("</tr>");
           });
       },
       error:function(){
          alert("안됨");
       }//end error   
    })         
 })
</script>