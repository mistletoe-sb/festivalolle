<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="systemtop.jsp" %>

	<div class="container-fluid">
		<!-- Page Heading -->
        <!-- <h1 class="h3 mb-2 text-gray-800">기관 가입 승인 관리</h1>
        <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
            For more information about DataTables, please visit the <a target="_blank"
                href="https://datatables.net">official DataTables documentation</a>.</p> -->
                
	
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">기관 계정 관리</h6>
            </div>
            <div class="card-body">
            
            	
            	<!-- Topbar Search -->
	            <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
	                  <div class="input-group">
	                        <input type="text" class="form-control bg-light border-0 small" id="searchKeyword" placeholder="Search for..."
	                            aria-label="Search" aria-describedby="basic-addon2">
	                        <div class="input-group-append">
	                            <button class="btn btn-primary" type="button" id="adminSearch">
	                                <i class="fas fa-search fa-sm"></i>
	                            </button>
	                        </div>
	                    </div>
	              </form>              
	              
	              
               <!--  <div class="row">
                <div class="col-sm-12 col-md-6">
	                <div id="dataTable_filter" class="dataTables_filter">
	                	<label>
	                		<div class="row">
	                		Search:<input type="search" class="form-control form-control-sm" placeholder="아이디, 이름, 기관명, 전화번호" aria-controls="dataTable">
	                		</div>
	                	</label>
	                </div>
                </div>
                </div> -->
            
            	
                <div class="table-responsive" id="firstResult">               	
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
								                    <span class="text">승인 대기</span>
								                </a>
											</c:when>
											<c:when test="${adminList.status eq 2}">
												<a href="#" class="btn btn-success btn-icon-split">
								                    <span class="text">승인 완료</span>
								                </a>
							                </c:when>
										</c:choose>
									</td>
									<td>
										<a class="dropdown-item adminDetail" href="#" data-toggle="modal" data-target="#adminDetailModal" 
											id="adminDetail">${adminList.id}</a>									
									</td>
									<td>${adminList.organizationName}</td>
									<td>${adminList.name}</td>
									<td>${adminList.telephone}</td>
									<td>${adminList.requestTime}</td>
									<td>${adminList.approveTime}</td>
								</tr>						
							</c:forEach>                           
                        </tbody>
                    </table>
           
	                <nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">Next</a></li>
					  </ul>
					</nav>
                </div>
                 
                <div id = "boardList"><!-- <table id = "boardList" border = "1"> --></table></div>
                
                
                
                
                
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
                <div class="modal-body">
                <!-- DataTales Example -->
			        <div class="card shadow mb-4">
			            <div class="card-header py-3">
			                <h6 class="m-0 font-weight-bold text-primary">관리자 상세 정보</h6>
			            </div>
			            <div class="card-body">
			                <div class="table-responsive">
			                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                        <tbody>
										<tr>
											<td>아이디</td>
											<td id="adminId"></td>
											<td>승인여부</td>
											<td id="adminStatus"></td>											
										</tr>
										<tr>
											<td>담당자명</td>
											<td id="adminName"></td>
											<td>연락처</td>
											<td id="adminTelephone"></td>
										</tr>
										<tr>
											<td>이메일</td>
											<td colspan="3" id="adminEmail"></td>
										</tr>
										<tr>
											<td>기관명</td>
											<td colspan="3" id="adminOrgName"></td>
										</tr>
										<tr>
											<td>기관 주소</td>
											<td colspan="3" id="adminAddress"></td>
										</tr>
									</tbody>
								</table>
								<input id="adminStatusHidden" type="hidden" value="" />
			                </div>
			                
			                
			                
			                <div class="form-group row">
					            &nbsp;&nbsp;&nbsp;			    	
						    	<div id="approval-btn-hidden">
						       		<a class="btn btn-primary" id = "adminApproval">가입 승인</a>
						       		&nbsp;&nbsp;&nbsp;
						        </div>	        
						        <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
					        </div>
			                
			                
			                
			            </div>
			        </div>
			        
			        
			        
			        
			        
			        
			        
			                    
                </div>                
            </div>
        </div>
    </div>
    
    
 	<script>   
	    $(document).on('click', '.adminDetail', function(){
	    	var id = $(this).text();
			console.log(id);
			
			//아이디 클릭해서 상세정보 불러오기
			$.ajax({
				url: "<c:url value='/system/admindetail'/>",
				type: "post",
				data: {id: id},
				success: function(data){
					//$('#organization_code').val(data);	
					console.log("됐다!")
					
					$('#adminId').text(id);
					
					if (data.status == 2) {
						$('#adminStatus').text('승인 완료');
						$('#approval-btn-hidden').hide();
					} else if (data.status == 1) {
						$('#adminStatus').text('승인 대기');
						$('#approval-btn-hidden').show();
					}
					//$('#adminStatusHidden').val(data.status);
					$('#adminName').text(data.name);
					$('#adminTelephone').text(data.telephone);
					$('#adminEmail').text(data.email);
					$('#adminOrgName').text(data.organizationName);
					$('#adminAddress').text(data.address);
					
					console.log(data.email);
					
				},//end success
				error:function(){
					alert("안가져옴");
				}//end error														
			})//end 기관코드ajax	
	    })
    
    
    
    /* 
 		$('.adminDetail').on('click', function(){
			var id = $(this).text();
			console.log(id);
			
			//아이디 클릭해서 상세정보 불러오기
			$.ajax({
				url: "<c:url value='/system/admindetail'/>",
				type: "post",
				data: {id: id},
				success: function(data){
					//$('#organization_code').val(data);	
					console.log("됐다!")
					
					$('#adminId').text(id);
					
					if (data.status == 2) {
						$('#adminStatus').text('승인 완료');
					} else if (data.status == 1) {
						$('#adminStatus').text('승인 대기');
					}

					$('#adminName').text(data.name);
					$('#adminTelephone').text(data.telephone);
					$('#adminEmail').text(data.email);
					$('#adminOrgName').text(data.organizationName);
					$('#adminAddress').text(data.address);
					
					console.log(data.email);
					
				},//end success
				error:function(){
					alert("안가져옴");
				}//end error														
			})//end 기관코드ajax		
		})  */ 
    
		
		$('#adminApproval').on('click', function(){
			var id = $('#adminId').text();
			
			$.ajax({
				url: "<c:url value='/system/approval'/>",
				type: "post",
				data: {id: id},
				success: function(data){
					//$('#organization_code').val(data);	

					if(data == 'ok'){
						alert(id + "계정 승인 완료");
						window.location.replace("<c:url value='/system/adminlist'/>");
					} else {
						alert("이미 승인 처리된 계정입니다.");
					}
					
				},//end success
				error:function(){
					alert("안가져옴");
				}//end error	
			})			
		})
		
		
		$('#adminSearch').on('click', function(){
			var keyword = $('#searchKeyword').val();

			$.ajax({
				url: "<c:url value='/system/search'/>",
				type: "post",
				data: {keyword: keyword},
				success: function(data){	
					console.log("가져옴!");

					//var results = data;
					var html = '<div class="table-responsive" id="searchResult">';
						html += '<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">';
						html += '<thead><tr><th>승인 상태</th><th>아이디</th><th>기관</th><th>담당자</th>';
						html += '<th>연락처</th><th>요청 일자</th><th>승인 일자</th></tr></thead><tfoot><tr>';
						html += '<th>승인 상태</th><th>아이디</th><th>기관</th><th>담당자</th>';
						html += '<th>연락처</th><th>요청 일자</th><th>승인 일자</th></tr></tfoot><tbody>';

					$(data).each(function(){
						console.log(this.id + " " + this.name);
						
						html += '<tr><td>';
						
						if (this.status == 1){
							html += '<a href="#" class="btn btn-warning btn-icon-split">';
							html += '<span class="text">승인 대기</span></a>';
						} else if(this.status == 2){
							html += '<a href="#" class="btn btn-success btn-icon-split">';
							html += '<span class="text">승인 완료</span></a>';
						}					
						
						html += '</td><td><a class="dropdown-item adminDetail" href="#" data-toggle="modal" data-target="#adminDetailModal" id="adminDetail">'
						html += this.id;
						html += '</a></td><td>' + this.organizationName;
						html += '</td><td>' + this.name;
						html += '</td><td>' + this.telephone;
						html += '</td><td>' + this.requestTime;
						html += '</td><td>' + this.approveTime;
						html += '</td></tr>';

					}); 
					
					html += '</tbody></table></div>';
					
					$('#firstResult').hide();
					//$('#boardList').empty();
					//$('#boardList').append(html);					 	
					$('#boardList').empty.append(html);							
					
				},//end success
				error:function(){
					alert("안됨");
				}//end error	
			})			
		})
		
		/* $('#autoComplete').autocomplete({
			console.log("시작");
			source: function(request, response) {
				$.ajax({
			           url : "/system/search"   
			         , type : "POST"
			         , dataType: "JSON"
			         , data : {value: request.term}	// 검색 키워드
			         , success : function(data){ 	// 성공
			             response(
			                 $.map(data.resultList, function(item) {
			                     return {
			                    	     label : item.id    	// 목록에 표시되는 값
			                           , value : item.id 		// 선택 시 input창에 표시되는 값
			                           //, idx : item.SEQ // index
			                     };
			                 })
			             );    //response
			         }
			         ,error : function(){ //실패
			             alert("오류가 발생했습니다.");
			         }
			     });
			}
			,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
					return false;
			}
			,minLength: 1// 최소 글자수
			,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
			,delay: 100	//autocomplete 딜레이 시간(ms)
			,select : function(evt, ui) { 
		      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
					console.log(ui.item.label);
					console.log(ui.item.idx);							
			}			
		}) */
		
		
		
				
    </script>   
    
    
    <!-- Bootstrap core JavaScript-->
    <%-- <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script> --%>
    <%-- <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script> --%>

    <!-- Core plugin JavaScript-->
    <%-- <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script> --%>


	
    <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	  







<%@ include file="systemfooter.jsp" %>