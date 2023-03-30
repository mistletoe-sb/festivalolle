<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>

	<div class="container-fluid">
		<!-- ★내용삽입★ -->
		<div>
		<div>
			<select id= "yearBox" class="form-select" aria-label="Default select example">

			</select>
			
			<div>
			<select name = "titleList" id = "titleList" class="form-select" aria-label="Default select example">
			</select>
			</div>
		</div>
		<div>
			
		</div>
		
		<a></a>
		
		<div class="btn-group " id="radiostatus" role="group" aria-label="Basic radio toggle button group">
		  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" value = "5" checked>
		  <label class="btn btn-outline-primary" for="btnradio1">전체</label>
		
		  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value = "0">
		  <label class="btn btn-outline-primary" for="btnradio2">비공개</label>
		
		  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" value = "1">
		  <label class="btn btn-outline-primary" for="btnradio3">진행중</label>
		    <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" value = "2">
		  <label class="btn btn-outline-primary" for="btnradio4">진행예정</label>
		    <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off" value = "3">
		  <label class="btn btn-outline-primary" for="btnradio5">진행완료</label>
		</div>
		
		

		
		<button style="float:right" class="btn btn-primary" onclick="location.href='<c:url value='/admin/festivalinsertform'/>'">축제 추가</button>
		<table class="table">
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
<%-- 	            <tbody>
	            <c:forEach var="selectFestivalList" items="${selectFestivalList}">
	              <tr>
	              	<th scope="col">
	              		<c:choose>
							<c:when test="${selectFestivalList.status eq 0}">
								<a href="#" class="btn btn-secondary" style="WIDTH: 80pt;" aria-disabled="true">
									<span class="text"> 비공개 </span>
								</a>
							</c:when>
							<c:when test="${selectFestivalList.status eq 1}">
								<a href="#" class="btn btn-success" style="WIDTH: 80pt;" aria-disabled="true">
									<span class="text"> 진행중 </span>
								</a>
							</c:when>
							<c:when test="${selectFestivalList.status eq 2}">
								<a href="#" class="btn btn-primary" style="WIDTH: 80pt;" aria-disabled="true">
									<span class="text">진행 예정</span>
								</a>
							</c:when>
							<c:when test="${selectFestivalList.status eq 3}">
								<a href="#" class="btn btn-warning" style="WIDTH: 80pt;" aria-disabled="true">
									<span class="text">진행 완료</span>
								</a>
							</c:when>
						</c:choose>
	              	</th>

	                <th scope="col"><a href="<c:url value='/admin/adminfestivalinfo?festivalCode=${selectFestivalList.festivalCode}'/>">${selectFestivalList.title}</a></th>
	                <th scope="col">${selectFestivalList.adminName}</th>
	                <th scope="col">${selectFestivalList.registerDate}</th>
	                <th scope="col"><button type="button" class="btn btn-outline-primary">구매자 목록</button></th>
	                <th scope="col"><button type="button" class="btn btn-outline-primary">리뷰 관리자</button></th>
	              </tr>
	            </c:forEach>
	            </tbody> --%>
	            <tbody id = "myList">
	            
	            </tbody>
	            
	        </table>

	</div>


<%@ include file="../adminfooter.jsp" %>

<script>
//var festialList = document.querySelector("#festialList");
$(document).ready(function() {
	
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
	
	
    $.ajax({
        url: "./statusfestivallist",
        type: "GET",
        dataType: "json",
        success: function(data) {
            $.each(data, function(index, item) {
                $("#myList").append("<tr>");
                $("#myList").append("<th scope='col'>");
                if (item.status == 0) {
                	  $("#myList").append("<a href='#' class='btn btn-secondary' style='WIDTH: 90pt;' aria-disabled='true'><span class='text'>비공개</span></a>");
                	} else if (item.status == 1) {
                	  $("#myList").append("<a href='#' class='btn btn-success' style='WIDTH: 90pt;' aria-disabled='true'><span class='text'>진행중</span></a>");
                	} else if (item.status == 2) {
                	  $("#myList").append("<a href='#' class='btn btn-primary' style='WIDTH: 90pt;' aria-disabled='true'><span class='text'>진행 예정</span></a>");
                	} else if (item.status == 3) {
                	  $("#myList").append("<a href='#' class='btn btn-warning' style='WIDTH: 90pt;' aria-disabled='true'><span class='text'>진행 완료</span></a>");
                	} 
                $("#myList").append("</th>");
                $("#myList").append("<th scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+item.festivalCode+"'/>'>"+item.title+"</a></th>");
                $("#myList").append("<th scope='col'>"+item.adminName+"</th>");
                $("#myList").append("<th scope='col'>"+item.registerDate+"</th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>구매자 목록</button></th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>리뷰 관리자</button></th>");
                $("#myList").append("</tr>");
            });
        }
    });
});

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
                $("#myList").append("<th scope='col'>");
                if (item.status == 0) {
                	  $("#myList").append("<a href='#' class='btn btn-secondary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>비공개</span></a>");
                	} else if (item.status == 1) {
                	  $("#myList").append("<a href='#' class='btn btn-success' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행중</span></a>");
                	} else if (item.status == 2) {
                	  $("#myList").append("<a href='#' class='btn btn-primary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 예정</span></a>");
                	} else if (item.status == 3) {
                	  $("#myList").append("<a href='#' class='btn btn-warning' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 완료</span></a>");
                	} 
                $("#myList").append("</th>");
                $("#myList").append("<th scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+item.festivalCode+"'/>'>"+item.title+"</a></th>");
                $("#myList").append("<th scope='col'>"+item.adminName+"</th>");
                $("#myList").append("<th scope='col'>"+item.registerDate+"</th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>구매자 목록</button></th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>리뷰 관리자</button></th>");
                $("#myList").append("</tr>");
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
                $("#myList").append("<th scope='col'>");
                if (item.status == 0) {
                	  $("#myList").append("<a href='#' class='btn btn-secondary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>비공개</span></a>");
                	} else if (item.status == 1) {
                	  $("#myList").append("<a href='#' class='btn btn-success' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행중</span></a>");
                	} else if (item.status == 2) {
                	  $("#myList").append("<a href='#' class='btn btn-primary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 예정</span></a>");
                	} else if (item.status == 3) {
                	  $("#myList").append("<a href='#' class='btn btn-warning' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 완료</span></a>");
                	} 
                $("#myList").append("</th>");
                $("#myList").append("<th scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+item.festivalCode+"'/>'>"+item.title+"</a></th>");
                $("#myList").append("<th scope='col'>"+item.adminName+"</th>");
                $("#myList").append("<th scope='col'>"+item.registerDate+"</th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>구매자 목록</button></th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>리뷰 관리자</button></th>");
                $("#myList").append("</tr>");
            });
        },
        error: function() {
            // AJAX 요청이 실패한 경우 에러 처리
            alert('데이터를 불러오는데 실패했습니다.');
        }
    });
});

</script>