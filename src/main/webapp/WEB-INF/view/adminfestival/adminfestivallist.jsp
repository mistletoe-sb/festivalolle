<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>

	<div class="container-fluid">
		<!-- ★내용삽입★ -->
		<table class="table">
	<button onclick="location.href='<c:url value='/admin/festivalinsertform'/>'">축제 추가</button>
	            <thead>
	              <tr>
	                <th scope="col">진행상태</th>
	                <th scope="col">축제명</th>
	                <th scope="col">작성자</th>
	                <th scope="col">등록일자</th>
	                <th scope="col"></th>
	                <th scope="col"></th>
	              </tr>
	            </thead>
	            <tbody>
	            <c:forEach var="selectFestivalList" items="${selectFestivalList}">
	              <tr>
	              	<th scope="col"></th>
	                <th scope="col">${selectFestivalList.title}</th>
	                <th scope="col">${selectFestivalList.adminName}</th>
	                <th scope="col">${selectFestivalList.registerDate}</th>
	                <th scope="col"><button>구매자 목록</button></th>
	                <th scope="col"><button>리뷰 관리자</button></th>
	              </tr>
	            </c:forEach>
	            </tbody>
	        </table>
	</div>










<%@ include file="../adminfooter.jsp" %>