<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	              <input type="hidden" id="searchInput" value="" />            
           
              
            
            	<div id="firstResult2">
                <!-- 예제2 -->			
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
	
						
						<c:forEach items="${viewAll }" var="adminList">
							<tr>
								<td>
									<c:choose>
										<c:when test="${adminList.status eq 1}">
											<a class="btn btn-warning btn-icon-split">
							                    <span class="text">승인 대기</span>
							                </a>
							            </c:when>
							            <c:when test="${adminList.status eq 2}">
											<a class="btn btn-success btn-icon-split">
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
					</table>				
					
					<!-- 페이징 네비게이션 -->
					<nav aria-label="Page navigation example" style="display: block; text-align: center;">
						<ul class="pagination">		
							<c:if test="${paging.startPage != 1 }">	
								<li class="page-item"><a class="page-link nowPage" >&lt;</a></li>										
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<li class="page-item"><a class="page-link nowPage" ><b>${p }</b></a></li>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<li class="page-item"><a class="page-link nowPage" href="javascript:getPage(${p })">${p }</a></li>							
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<li class="page-item"><a class="page-link nowPage" <%-- href="<c:url value='/boardlist?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}'/>" --%>>&gt;</a></li>						
							</c:if>
						</ul>
					</nav>					
				</div> <!-- table responsive -->
				<!-- 예제2 끝 -->
                
                
                </div><!-- firstResult2 -->
                 
                <div id = "boardList"><!-- <table id = "boardList" border = "1"></table> --></div>
               
              

              
              
              </div> <!-- card-body -->                 
          </div>
      </div>
      <!-- container-fluid 끝 -->
        
       
<!-- 예제 가져온거 -->



<!-- 예제 가져온거 끝 --> 





        
	
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
    <!-- adminDetail Modal 끝-->
    
    
 	<script>   
	 	$(document).ready(function() {
			getPage();
		})
		
		$("#adminSearch").click(function() {
			var Keyword = $("#searchKeyword").val();
			console.log(Keyword+"됐어!");
			$("#searchInput").val(Keyword);
			getPage();
		});
 	
 	
 	
 	
 		//계정 상세 정보 보기 모달
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
					console.log(data.status);
					
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

		//승인처리
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
		
		//검색
		
		
		//페이징처리		
		/*$(document).on('click', '.nowPage', function(){*/
			
		function getPage(nowPage) {
			/*var nowPage = $(this).text();*/
			var keyword = $('#searchInput').val();
			console.log("getPage에서 받아온 키워드: " + keyword );
			
			$.ajax({
				url: "<c:url value='/system/paging'/>",
				type: "post",
				data: {nowPage: nowPage, keyword: keyword},
				success: function(data){	
					console.log("페이징 처리 된 리스트 가져옴!");					
	              	var startPage = data.startPage;
	              	var cntPerPage = data.cntPerPage;
	              	var endPage = data.endPage;
	              	var nowPage = data.nowPage;
	              	var lastPage = data.lastPage
	              	var viewAll = data.viewAll;

					var html = '<div class="table-responsive" id="searchResult">';
						html += '<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">';
						html += '<thead><tr><th>승인 상태</th><th>아이디</th><th>기관</th><th>담당자</th>';
						html += '<th>연락처</th><th>요청 일자</th><th>승인 일자</th></tr></thead><tfoot><tr>';
						html += '<th>승인 상태</th><th>아이디</th><th>기관</th><th>담당자</th>';
						html += '<th>연락처</th><th>요청 일자</th><th>승인 일자</th></tr></tfoot><tbody>';
						
					$.each(viewAll, function(key, value){
						console.log("data: " + viewAll);						
						html += '<tr><td>';						
						if (value.status == 1){
							html += '<a href="#" class="btn btn-warning btn-icon-split">';
							html += '<span class="text">승인 대기</span></a>';
						} else if(value.status == 2){
							html += '<a href="#" class="btn btn-success btn-icon-split">';
							html += '<span class="text">승인 완료</span></a>';
						}					
						
						html += '</td><td><a class="dropdown-item adminDetail" href="#" data-toggle="modal" data-target="#adminDetailModal" id="adminDetail">'
						html += value.id;
						html += '</a></td><td>' + value.organizationName;
						html += '</td><td>' + value.name;
						html += '</td><td>' + value.telephone;
						html += '</td><td>' + value.requestTime;
						html += '</td><td>' + value.approveTime;
						html += '</td></tr>';						
					});					
					html += '</tbody></table>';					
					html += '<nav aria-label="Page navigation example" style="display: block; text-align: center;">';
					html += '<ul class="pagination">';					
					
					if (startPage != 1){
						html += '<li class="page-item"><a class="page-link nowPage">&lt;</a></li>';
					}
					for (var num = startPage; num <= endPage; num++) {
						if (num == nowPage) {
							html += '<li class="page-item"><a class="page-link nowPage"><b>';
							html += num;
							html += '</b></a></li>';
						} else {
							html += '<li class="page-item"><a class="page-link nowPage" href="javascript:getPage(';
							html += num;
							html += ')">';
							html += num;
							html += '</a></li>';			
						}
					}
					if (endPage != lastPage) {
						html += '<li class="page-item"><a class="page-link nowPage">&gt;</a></li>';
					}
					html += '</ul></nav>';
					html += '</div>';
					
					//$('#firstResult').hide();
					//$('#boardList').empty();
					//$('#boardList').append(html);					 	
					//$('#boardList').empty.append(html);
					$('#firstResult2').html(html);
					//$("#main_box").html(data);
					
				},//end success
				error:function(){
					alert("안됨");
				}//end error	
			})			
		}
		
		/*})*/
		
		
		
		
		
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
    
    <script type="text/javascript">
    
    /*
		function fn_go_page(pageNo) {
		 
		var submitObj = new Object();
		 
		submitObj.pageIndex= pageNo;
		submitObj.searchWrd= $("#searchWrd").val();
		 
		$.ajax({ 
		url: "<c:url value='/system/adminlist2'/>", 
		type: "POST", 
		contentType: "application/json;charset=UTF-8",
		data:JSON.stringify(submitObj),
		dataType : "json",
		progress: true
		}) 
		.done(function(data) {
		    
		    var  result = new Array;
		    result = data.resultList;
		    var searchVO = data.searchVO;
		    var realEnd = searchVO.realEnd;
		    var startDate = searchVO.startDate;
		    var startButtonDate = startDate - 1;
		    var endDate = searchVO.endDate;
		    var endButtonDate = endDate + 1;
		    var pageIndex = searchVO.pageIndex;
		    var resultCnt = data.resultCnt;
		    var totalPageCnt = data.totalPageCnt;
		    var recordCountPerPage = searchVO.recordCountPerPage;
		    
		    
		    var ii = (resultCnt - (pageIndex - 1) * recordCountPerPage);
		    
		    var content = '';
		    var content2 = '';
		    
		    $.each(result, function(key, value) {
		        
		        content +=    '<tr class="memList">';
		        content +=    '<td class="t_c">' + ii + '</td>';
		        content +=    '<td class="t_c">' + value.me_sido + '</td>';
		        content +=    '<td>' + value.me_gugun + '<button type="button" class="btnInfo fr"></button></td>';
		        content +=    '<td class="t_c">' + value.me_biz_name + '</td>';
		        content +=    '<td class="t_c">' +  value.me_name  +'</td>';
		        content +=    '<td class="t_c">' +  value.me_biz_tel + '</td>';
		        content +=    '</tr>';
		         ii--;
		      });
		    
		    $(".listData").html(content);    
		    
		    content2 = '<input type="hidden" id="pageIndex" name="pageIndex" value="1">';
		    content2 +=    '<ol class="pagination" id="pagination">';
		    
		    if(searchVO.prev){
		        content2 +=    '<li class="prev_end"><a href="javascript:void(0);" onclick="fn_go_page(1); return false;" ></a></li>';    
		        content2 +=    '<li class="prev"><a href="javascript:void(0);"  onclick="fn_go_page(' + startButtonDate + '); return false;" ></a></li>';    
		    }
		    
		    for (var num=startDate; num<=endDate; num++) {
		         if (num == pageIndex) {
		             content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '"  class="num on">' + num + '</a></li>';
		         } else {
		             content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '" class="num">' + num + '</a></li>';
		         }
		    }
		    
		    if(searchVO.next){
		        content2 +=    '<li class="next"><a href="javascript:void(0);"  onclick="fn_go_page(' + endButtonDate + '); return false;" ></a></li>';    
		        content2 +=    '<li class="next_end"><a href="javascript:void(0);" onclick="fn_go_page(' + searchVO.realEnd +'); return false;"></a></li>';    
		    }
		    
		    content2 +=    '</ol>';
		    content2 +=    '</div>';
		 
		    $(".board-list-paging").html(content2);
		    
		 }) 
		 .fail(function(e) {  
		     alert("검색에 실패하였습니다.");
		 }) 
		 .always(function() { 
		     
		 }); 
		}
	*/
</script>

	<script>
		/*function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="boardList?nowPage=${paging.nowPage}&cntPerPage="+sel;
		}*/
	</script>


    





<%@ include file="systemfooter.jsp" %>