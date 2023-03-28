<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>

	<div class="container-fluid">
		<!-- ★내용삽입★ -->
		
		
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
$('#festialList').on('click', function() {
    $.ajax({
        url: "./statusfestivallist",
        type: "GET",
        dataType: "json",
        success: function(data) {
            $.each(data, function(index, item) {
            	console.log(index)
            	console.log(item.adminName)
            	alert("test")
                $("#myList").append("<tr>");
                $("#myList").append("<th scope='col'>");
                if (item.status == 0) {
                	  $("#myList").append("<a href='#' class='btn btn-secondary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>비공개</span></a>");
                	} else if (item.status == 1) {
                	  $("#myList").append("<a href='#' class='btn btn-secondary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행중</span></a>");
                	} else if (item.status == 2) {
                	  $("#myList").append("<a href='#' class='btn btn-secondary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 예정</span></a>");
                	} else if (item.status == 3) {
                	  $("#myList").append("<a href='#' class='btn btn-secondary' style='WIDTH: 80pt;' aria-disabled='true'><span class='text'>진행 완료</span></a>");
                	} 
                $("#myList").append("</th>");
                $("#myList").append("<th scope='col'><a href='<c:url value='/admin/adminfestivalinfo?festivalCode="+item.festivalCode+"'/>'>"+item.title+"</a></th>");
                $("#myList").append("<th scope='col'>"+item.adminName+"</th>");
                $("#myList").append("<th scope='col'>"+item.registerDate+"</th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>구매자 목록</button></th>");
                $("#myList").append("<th scope='col'><button type='button' class='btn btn-outline-primary'>리뷰 관리자</button></th>");
            });
        }
    });
});




</script>