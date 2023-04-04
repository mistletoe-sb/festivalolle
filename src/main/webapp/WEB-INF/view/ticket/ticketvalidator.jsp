<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="../admintop.jsp" %>


<div class="container-fluid">
티켓 확인
<!-- DataTales Example -->
	<div class="card shadow mb-4">
	    <div class="card-header py-3">
	        <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
	    </div>
	    <div class="card-body">
	        <div class="table-responsive">
	            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                <thead>
	                    <tr>
	                        <th>승인 상태</th>
	                        <th>아이디</th>
	                        <th>기관</th>
	                        <th>담당자</th>
	                        <th>연락처</th>
	                        <th>요청 일자</th>
	                        <th>승인 일자</th>
	                    </tr>
	                </thead>
	                <tfoot>
	                    <tr>
	                        <th>승인 상태</th>
	                        <th>아이디</th>
	                        <th>기관</th>
	                        <th>담당자</th>
	                        <th>연락처</th>
	                        <th>요청 일자</th>
	                        <th>승인 일자</th>
	                    </tr>
	                </tfoot>
	                <tbody>
	
	<c:forEach var="adminList" items="${adminList}">
	<tr>
		<td>
			<c:choose>
			<c:when test="${adminList.status eq 1}">
				<a href="#" class="btn btn-warning btn-icon-split">
	                   <!-- <span class="icon text-white-50">
	                       <i class="fas fa-exclamation-triangle"></i>
	                   </span> -->
	                   <span class="text">승인 대기</span>
	               </a>
			</c:when>
			<c:when test="${adminList.status eq 2}">
				<a href="#" class="btn btn-success btn-icon-split">
	                   <!-- <span class="icon text-white-50">
	                       <i class="fas fa-check"></i>
	                   </span> -->
	                   <span class="text">승인 완료</span>
	               </a>
	              </c:when>
		</c:choose>
	</td>
	<td>${adminList.id}</td>
	<td>${adminList.organizationName}</td>
	<td>${adminList.name}</td>
	<td>${adminList.telephone}</td>
	<td>${adminList.requestTime}</td>
	<td>${adminList.approveTime}</td>
	</tr>						
	</c:forEach>
	                            
	                    <tr>
	                        <td>Tiger Nixon</td>
	                        <td>System Architect</td>
	                        <td>Edinburgh</td>
	                        <td>61</td>
	                        <td>2011/04/25</td>
	                        <td>$320,800</td>
	                    </tr>
	                    <tr>
	                        <td>Garrett Winters</td>
	                        <td>Accountant</td>
	                        <td>Tokyo</td>
	                        <td>63</td>
	                        <td>2011/07/25</td>
	                        <td>$170,750</td>
	                    </tr>
	                    <tr>
	                        <td>Ashton Cox</td>
	                        <td>Junior Technical Author</td>
	                        <td>San Francisco</td>
	                        <td>66</td>
	                        <td>2009/01/12</td>
	                        <td>$86,000</td>
	                    </tr>
	                    <tr>
	                        <td>Cedric Kelly</td>
	                        <td>Senior Javascript Developer</td>
	                        <td>Edinburgh</td>
	                        <td>22</td>
	                        <td>2012/03/29</td>
	                        <td>$433,060</td>
	                    </tr>
	                    <tr>
	                        <td>Airi Satou</td>
	                        <td>Accountant</td>
	                        <td>Tokyo</td>
	                        <td>33</td>
	                        <td>2008/11/28</td>
	                        <td>$162,700</td>
	                    </tr>                                        
	                    <tr>
	                        <td>Donna Snider</td>
	                        <td>Customer Support</td>
	                        <td>New York</td>
	                        <td>27</td>
	                        <td>2011/01/25</td>
	                        <td>$112,000</td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>


</div>

<%@ include file="../adminfooter.jsp" %>