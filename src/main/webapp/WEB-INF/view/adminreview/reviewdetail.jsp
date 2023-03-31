<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>

<div class="container-fluid">
<div class="card shadow mb-4">
	<div class="card-body">
 		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tbody>
					<tr>
						<th id="sorting">아이디</th>
						<td>${reviewList.id}</td>
						<th id="sorting">작성일시</th>
						<td>${reviewList.writeDate}</td>
					</tr>
					<tr>
						<th id="sorting">축제명</th>
						<td colspan="3">${reviewList.title}</td>
					</tr>
					<tr>
						<td colspan="4">${reviewList.status}</td>
					</tr>
					<tr>
						<td colspan="4">${reviewList.content}</td>
					</tr>
				</tbody>
			</table>	
		</div>
		<div>
			<a href="./normal?festivalReviewCode=${reviewList.festivalReviewCode}" class="btn btn-primary btn-icon-split">
			   <input style="border: 2px solid transparent; line-height: 2;" class="btn btn-primary btn-icon-split" type="submit" id="rejectReport" value="신고철회">
			</a>
			<a href="./blind?festivalReviewCode=${reviewList.festivalReviewCode}" class="btn btn-primary btn-icon-split">
			   <input style="border: 2px solid transparent; line-height: 2;" class="btn btn-primary btn-icon-split" type="submit" id="deleteReview" value="블라인드">
			</a>
		</div>
   </div>
 </div>
</div>










 <%@ include file="../adminfooter.jsp" %>