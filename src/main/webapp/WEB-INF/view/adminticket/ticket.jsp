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
					<tbody>
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









 <%@ include file="../adminfooter.jsp" %>