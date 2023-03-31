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
							
								<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    				<div><span>
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
												${adminList.id}
												
											</td>								
											<td>${adminList.organizationName}</td>
											<td>${adminList.name}</td>
											<td>${adminList.telephone}</td>
											<td>${adminList.requestTime}</td>
											<td>${adminList.approveTime}</td>
										</tr>
									</span>
									</div>
								</a>
								<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
				                    data-parent="#accordionSidebar">
				                    <div class="bg-white py-2 collapse-inner rounded">
				                        <h6 class="collapse-header">Custom Utilities:</h6>
				                        <a class="collapse-item" href="utilities-color.html">Colors</a>
				                        <a class="collapse-item" href="utilities-border.html">Borders</a>
				                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
				                        <a class="collapse-item" href="utilities-other.html">Other</a>
				                    </div>
				                </div>	
												
						</c:forEach>
                                    
                            
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
	</div>
	
	
	
	
    
 	<script>    
 		$('#adminDetail').click(function(){
			var id = $('#adminDetail').text();
			console.log(id);
			var status;
			var name;
			var telephone;
			var organizationName;
			var address;
			var email;
			
			//아이디 클릭해서 상세정보 불러오기
			$.ajax({
				url: "<c:url value='/system/admindetail'/>",
				type: "post",
				data: {id: id},
				success: function(data){
					//$('#organization_code').val(data);	
					console.log("됐다!")
					status = data.status;
					name = data.name;
					telephone = data.telephone;
					organizationName = data.organizationName;
					address = data.address;
					email = data.email;
					console.log(data.email);
					
				},//end success
				error:function(){
					alert("안가져옴");
				}//end error														
			})//end 기관코드ajax		
		})  
    
    </script>   
    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>










<%@ include file="../adminfooter.jsp" %>