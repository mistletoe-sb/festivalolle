<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../admintop.jsp" %>

	<div class="container-fluid">
		<!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">기관 가입 승인 관리</h1>
        <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
            For more information about DataTables, please visit the <a target="_blank"
                href="https://datatables.net">official DataTables documentation</a>.</p>
                
                <a href="#" class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-check"></i>
                    </span>
                    <span class="text">승인 완료</span>
                </a>
                
                <a href="#" class="btn btn-warning btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-exclamation-triangle"></i>
                    </span>
                    <span class="text">승인 대기</span>
                </a>

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
                        
                        
                        
                        
                        
                        <%-- <c:forEach var="filmList" items="${filmList}">
							<tr>
								<td><a href="<c:url value='/adminfilm/${filmList.filmId}'/>">${filmList.filmId}</a></td>
								<td>
									<c:set var="len" value="${fn:length(filmList.fileName)}"/>
									<c:set var="filetype" value="${fn:toUpperCase(fn:substring(filmList.fileName, len-4, len))}"/>
									<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
										<c:url var="imageName" value="/file/${filmList.fileId}"/>
										<img src="${imageName}" width="100" class="img-thumbnail">
									</c:if>
								</td>
								<td>${filmList.filmTitle}</td>
								<td>${filmList.director}</td>
								<td>${filmList.releaseDate}</td>
							</tr>
						</c:forEach> --%>
						
						
						
						<%-- <c:choose>
							<c:when test="${not empty  loginUser}"> 	
	              					<li class="common"><button class="common_btn" onclick="location.href='<c:url value='/member/mypage/${loginUser.memberId}'/>'">마이페이지</button></li>
								<button class="common_btn" type="button" onclick="location.href = '<c:url value='/member/logout' />'">로그아웃</button>						
							</c:when>
							<c:otherwise>
							<li class= "login_button">
								<p><a href="#login_modal" rel="modal:open" class="login_a_tag">로그인</a></p>
								<%@include file="./member/login.jsp" %>
								</li>
							<li class="join_button">						
								<p><a href="#join_modal" rel="modal:open" class="join_btn">회원가입</a></p>
								<%@include file="./member/join.jsp" %>
								</li>
							</c:otherwise>
						</c:choose> --%>
						
						
						<%-- <c:choose>
							<c:when test="${adminList.status == 1}">
								<a href="#" class="btn btn-warning btn-icon-split">
				                    <span class="icon text-white-50">
				                        <i class="fas fa-exclamation-triangle"></i>
				                    </span>
				                    <span class="text">승인 대기</span>
				                </a>
							</c:when>
							<c:when test="${adminList.status == 2}">
								<a href="#" class="btn btn-success btn-icon-split">
				                    <span class="icon text-white-50">
				                        <i class="fas fa-check"></i>
				                    </span>
				                    <span class="text">승인 완료</span>
				                </a>
			                </c:when>
						</c:choose> --%>
						
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
								<td>
									<a class="dropdown-item" href="#" data-toggle="modal" data-target="#adminDetailModal" id="adminDetail">	                                    
	                                    ${adminList.id}
	                                </a>
									
								</td>
								
								
								
								
								
								
								
								
								
								
								
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
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
	</div>
	<!-- adminDetail Modal-->
    <div class="modal fade" id="adminDetailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">관리자 상세</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="<c:url value='/admin/logout'/>">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
    
    <script>    
	     /* $('#adminDetail').blur(function(){
			var adminId = $('#adminId').text();
			
			//아이디 클릭해서 상세정보 불러오기
			$.ajax({
				url: "<c:url value='/system/admindetail'/>",
				type: "post",
				data: {adminId: adminId},
				success: function(data){
					$('#organization_code').val(data);							
				},//end success
				error:function(){
					alert("기관 코드 없음");
				}//end error														
			})//end 기관코드ajax		
		})  */
    
    </script>










<%@ include file="../adminfooter.jsp" %>