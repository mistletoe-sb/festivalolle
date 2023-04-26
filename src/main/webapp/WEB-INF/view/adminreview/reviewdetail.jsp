<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../admintop.jsp" %>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<div class="container-fluid">
<div class="card shadow mb-4">
	<div class="card-header py-3">
	<h6 class="m-0 font-weight-bold text-primary">${reviewList.title}</h6>
	</div>
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
						<th>리뷰상태</th>
						<td colspan="4">
							<c:choose>
								<c:when test="${reviewList.status == 1}">신고</c:when>
								<c:when test="${reviewList.status == 2}">블라인드</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="4">${reviewList.content}</td>
					</tr>
				</tbody>
			</table>	
		</div>
		<c:choose>
			<c:when test="${reviewList.status > 0 && reviewList.status < 2}" >
			<div>
				<a href="./normal?festivalReviewCode=${reviewList.festivalReviewCode}" class="btn btn-primary btn-icon-split">
				   <input style="border: 2px solid transparent; line-height: 2;" class="btn btn-primary btn-icon-split" type="submit" id="rejectReport" value="신고철회">
				</a>
				<a href="./blind?festivalReviewCode=${reviewList.festivalReviewCode}" class="btn btn-primary btn-icon-split">
				   <input style="border: 2px solid transparent; line-height: 2;" class="btn btn-primary btn-icon-split" type="submit" id="deleteReview" value="블라인드">
				</a>
				<a href="./list" class="btn btn-primary btn-icon-split">
					<input style="border: 2px solid transparent; line-height: 2;" class="btn btn-primary btn-icon-split" type="submit" id="goList" value="목록으로">
				</a>
			</div>
			</c:when>
			<c:otherwise>
				<div class="icon" style="display:none;">
				<a href="./normal?festivalReviewCode=${reviewList.festivalReviewCode}" class="btn btn-primary btn-icon-split">
				   <input style="border: 2px solid transparent; line-height: 2;" class="btn btn-primary btn-icon-split" type="submit" id="rejectReport" value="신고철회">
				</a>
				<a href="./blind?festivalReviewCode=${reviewList.festivalReviewCode}" class="btn btn-primary btn-icon-split">
				   <input style="border: 2px solid transparent; line-height: 2;" class="btn btn-primary btn-icon-split" type="submit" id="blindReview" value="블라인드">
				</a>
			</div>
			<div class="icon">
			<a href="./list" class="btn btn-primary btn-icon-split">
				<input style="border: 2px solid transparent; line-height: 2;" class="btn btn-primary btn-icon-split" type="submit" id="goList" value="목록으로">
			</a>
			</div>
			</c:otherwise>
		</c:choose>
   </div>
 </div>
</div>


















 <%@ include file="../adminfooter.jsp" %>