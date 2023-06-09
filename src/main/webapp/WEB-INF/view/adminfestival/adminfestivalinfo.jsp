<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   
 <%@ include file="../admintop.jsp" %>


	<div class="container-fluid">
		<!-- ★내용삽입★ -->
	<div class="card shadow mb-4">
	<div class="card-header py-3">
				<div style ="float:left; margin:0 auto">
                	<h6 class="m-0 font-weight-bold text-primary" >상세정보</h6>
                </div>
                <div class="d-grid gap-2 d-md-block">
                <div id="nadasim" style ="float:right; margin-left : 0.4rem;">
					<c:choose>
						<c:when test="${adminfestivalinfo.status == '0'}">
							<button style ="margin-left : 0.25rem" type='button' id='gonggaebtn' class='btn btn-secondary' >비공개 취소</button>
						</c:when>
						<c:otherwise>
							<button style ="margin-left : 0.25rem" type="button" id="bigonggaebtn" class="btn btn-outline-secondary" >비공개 하기</button>
						</c:otherwise>
						
					</c:choose>	
				</div >
					<div style ="float:right;">
						<input type="button" class="btn btn-primary"  onclick="location.href='<c:url value='/admin/adminfestivalupdateform?festivalCode=${adminfestivalinfo.festivalCode}'/>'" value='수정하기'>
						<input style="margin-left : 0.4rem;" type="button" class="btn btn-primary" onclick="location.href='<c:url value='/admin/festivallist'/>'" value='축제목록'>
	                </div>
                </div>
            </div>
		<form  action = "<c:url value='/admin/festivalinsert'/>" method="post" enctype="multipart/form-data">
		<div class="table-responsive">
		<table class="table">
			<tr>
				<td scope="col"><label for="exampleFormControlInput1" class="form-label">축제명</label></td>
				<td scope="col"><input type="text" class="form-control" id="title" name="title" placeholder="축제명을 입력하세요" required value="${adminfestivalinfo.title}" disabled></td>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">주소</label></th>
				
				<th scope="col">
				<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소" required value="${adminfestivalinfo.address}" disabled>
				<input type="text" class="form-control" name="stateName" id="sample6_doAddress" placeholder="도" value="${adminfestivalinfo.stateName}" disabled>
				<input type="text" class="form-control" name="cityName" id="sample6_sigooAddress" placeholder="시구" value="${adminfestivalinfo.cityName}" disabled>
				</th>
				
				
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">시작일자</label></th>
				<th scope="col"><input type="date" class="form-control" id="startDate" name="startDate" placeholder="시작일자 입력하세요" required required value="${adminfestivalinfo.startDate}" disabled></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">종료일자</label></th>
				<th scope="col"><input type="date" class="form-control" id="endDate" name="endDate" placeholder="종료일자 입력하세요" required value="${adminfestivalinfo.endDate}" disabled></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">입장료</label></th>
				<th scope="col"><input type="number" class="form-control" id="fee" name="fee" placeholder="금액을 입력하세요" required value="${adminfestivalinfo.fee}" disabled></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">홈페이지 URL</label></th>
				<th scope="col"><input type="text" class="form-control" id="url" name="url" placeholder="url을 입력하세요" required value="${adminfestivalinfo.url}" disabled></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">기관전화번호</label></th>
				<th scope="col"><input type="text" class="form-control" id="telephone" name="telephone" placeholder="전화번호를 입력하세요" required value="${adminfestivalinfo.telephone}" disabled></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlTextarea1" class="form-label">상세설명</label></th>
				<th scope="col"> <textarea class="form-control" id="detail" name="detail" rows="6" placeholder="상세설명을 입력하세요" required disabled>${adminfestivalinfo.detail}</textarea ></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">태그</label></th>
				<th scope="col"><input type="text" class="form-control" id="tags" name="tags" placeholder="태그를 입력하세요" required value="${adminfestivalinfo.tags}" disabled></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">이미지</label></th>
				<c:choose>
					<c:when test="${img == '1'}">
						<th scope="col">
							<img style="width: 31.25rem;" id="preview-image" class="rounded-4" src="<c:url value='/resources/img/null_png.png'/>">
						</th>
					</c:when>
					<c:otherwise>
						<th scope="col">
							<img style="display: block; width: 31.25rem;" src="data:image:jpg;base64,${img}"/ aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
						</th>
					</c:otherwise>
				</c:choose>
			</tr>
			
			<%-- <c:set var="len" value="${fn:length${adminfestivalinfo.image}"/>
			<c:set var="filetype">
				value="${fn:toUpperCase(fn:substring(adminfestivalinfo.image, len-4, len))}"/>
				<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq 'PNG') or (filetype eq 'GIF')}">
					<c:url val="imageName" value="/adminfestivalinfo/${adminfestivalinfo.image}"/>
					<img src="${imageName}">
				</c:if>
			</c:set> --%>
		</table>
</div>
			<fieldset>
			 <div class="d-grid gap-2 d-md-block" style ="margin-right : 1.25rem">
                <div id="nadasim1" style ="float:right; margin-left : 0.4rem;">
					<c:choose>
						<c:when test="${adminfestivalinfo.status == '0'}">
							<button style ="margin-left : 0.25rem" type='button' id='gonggaebtn1' class='btn btn-secondary' >비공개 취소</button>
						</c:when>
						<c:otherwise>
							<button style ="margin-left : 0.25rem" type="button" id="bigonggaebtn1" class="btn btn-outline-secondary" >비공개 하기</button>
						</c:otherwise>
						
					</c:choose>	
				</div>
					<div style ="float:right;">
						<input type="button" class="btn btn-primary"  onclick="location.href='<c:url value='/admin/adminfestivalupdateform?festivalCode=${adminfestivalinfo.festivalCode}'/>'" value='수정하기'>
						<input style="margin-left : 0.4rem;" type="button" class="btn btn-primary" onclick="location.href='<c:url value='/admin/festivallist'/>'" value='축제목록'>
	                </div>
                </div>
		    </fieldset>
			
		</form>
		</div>
		</div>
		
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>		
<script>

function addButtonListeners() {
  $('#bigonggaebtn').on('click', function(){
    var festivalCode = ${adminfestivalinfo.festivalCode};
    var organizationCode = ${adminfestivalinfo.organizationCode};
    var status = 0;
    var start = "${adminfestivalinfo.startDate}";
    var end = "${adminfestivalinfo.endDate}";
    $.ajax({
        url: './updateFestivalStatus', // 서버에서 데이터를 가져올 경로
        type: 'GET', // GET 방식으로 요청
        data: { festivalCode: festivalCode,
            organizationCode : organizationCode,
            status : status,
            start : start,
            end : end
          }, // 서버로 보낼 데이터
        complete: function() {
            // AJAX 요청이 완료된 후 실행될 코드
            $("#nadasim").empty();
            $("#nadasim1").empty();
            $("#nadasim").append("<button style ='margin-left : 0.25rem' type='button' id='gonggaebtn' class='btn btn-secondary' >비공개 취소</button>");
            $("#nadasim1").append("<button style ='margin-left : 0.25rem' type='button' id='gonggaebtn1' class='btn btn-secondary' >비공개 취소</button>");
            addButtonListeners();
            swal('비공개 전환!', "축제가 비공개 처리 됐습니다.", 'info');
        }
    })
  });

  $('#gonggaebtn').on('click', function(){
	    var festivalCode = ${adminfestivalinfo.festivalCode};
	    var organizationCode = ${adminfestivalinfo.organizationCode};
	    var status = 1;
	    var start = "${adminfestivalinfo.startDate}";
	    var end = "${adminfestivalinfo.endDate}";
    $.ajax({
        url: './updateFestivalStatus', // 서버에서 데이터를 가져올 경로
        type: 'GET', // GET 방식으로 요청
        data: { festivalCode: festivalCode,
            organizationCode : organizationCode,
            status : status,
            start : start,
            end : end
          }, // 서버로 보낼 데이터
        complete: function() {
            // AJAX 요청이 완료된 후 실행될 코드
            $("#nadasim").empty();
            $("#nadasim1").empty();
            $("#nadasim").append("<button style ='margin-left : 0.25rem' type='button' id='bigonggaebtn' class='btn btn-outline-secondary' >비공개 하기</button>");
            $("#nadasim1").append("<button style ='margin-left : 0.25rem' type='button' id='bigonggaebtn1' class='btn btn-outline-secondary' >비공개 하기</button>");
            addButtonListeners();
            swal('공개 전환!', "축제 비공개가 해제 됐습니다.", 'info');
        }
    });
  });
  
  $('#bigonggaebtn1').on('click', function(){
	    var festivalCode = ${adminfestivalinfo.festivalCode};
	    var organizationCode = ${adminfestivalinfo.organizationCode};
	    var status = 0;
	    var start = "${adminfestivalinfo.startDate}";
	    var end = "${adminfestivalinfo.endDate}";
	    $.ajax({
	        url: './updateFestivalStatus', // 서버에서 데이터를 가져올 경로
	        type: 'GET', // GET 방식으로 요청
	        data: { festivalCode: festivalCode,
	            organizationCode : organizationCode,
	            status : status,
	            start : start,
	            end : end
	          }, // 서버로 보낼 데이터
	        complete: function() {
	            // AJAX 요청이 완료된 후 실행될 코드
	            $("#nadasim").empty();
	            $("#nadasim1").empty();
	            $("#nadasim").append("<button style ='margin-left : 0.25rem' type='button' id='gonggaebtn' class='btn btn-secondary' >비공개 취소</button>");
	            $("#nadasim1").append("<button style ='margin-left : 0.25rem' type='button' id='gonggaebtn1' class='btn btn-secondary' >비공개 취소</button>");
	            addButtonListeners();
	            swal('비공개 전환!', "축제가 비공개 처리 됐습니다.", 'info');
	        }
	    })
	  });

	  $('#gonggaebtn1').on('click', function(){
		    var festivalCode = ${adminfestivalinfo.festivalCode};
		    var organizationCode = ${adminfestivalinfo.organizationCode};
		    var status = 1;
		    var start = "${adminfestivalinfo.startDate}";
		    var end = "${adminfestivalinfo.endDate}";
	    $.ajax({
	        url: './updateFestivalStatus', // 서버에서 데이터를 가져올 경로
	        type: 'GET', // GET 방식으로 요청
	        data: { festivalCode: festivalCode,
	            organizationCode : organizationCode,
	            status : status,
	            start : start,
	            end : end
	          }, // 서버로 보낼 데이터
	        complete: function() {
	            // AJAX 요청이 완료된 후 실행될 코드
	            $("#nadasim").empty();
	            $("#nadasim1").empty();
	            $("#nadasim").append("<button style ='margin-left : 0.25rem' type='button' id='bigonggaebtn' class='btn btn-outline-secondary' >비공개 하기</button>");
	            $("#nadasim1").append("<button style ='margin-left : 0.25rem' type='button' id='bigonggaebtn1' class='btn btn-outline-secondary' >비공개 하기</button>");
	            addButtonListeners();
	            swal('공개 전환!', "축제 비공개가 해제 됐습니다.", 'info');
	        }
	    });
	  });
}

// 초기화
addButtonListeners();
	
</script>









<%@ include file="../adminfooter.jsp" %>