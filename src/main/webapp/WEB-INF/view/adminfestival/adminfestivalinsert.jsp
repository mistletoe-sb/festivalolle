<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <%@ include file="../admintop.jsp" %>

	<div class="container-fluid">
		<!-- ★내용삽입★ -->
			<div>
		<form  action = "<c:url value='/admin/festivalinsert'/>" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td scope="col"><label for="exampleFormControlInput1" class="form-label">축제명</label></td>
				<td scope="col"><input type="text" class="form-control" id="title" name="title" placeholder="축제명을 입력하세요" required></td>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">주소</label></th>
				<th scope="col"><input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				<input type="text" class="form-control" id="sample6_address" placeholder="주소">
				<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
				<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목"></th>
				<input type="hidden" class="form-control" name="stateName" id="sample6_doAddress" placeholder="도">
				<input type="hidden" class="form-control" id="cityName" id="sample6_sigooAddress" placeholder="시구">
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">시작일자</label></th>
				<th scope="col"><input type="date" class="form-control" id="startDate" name="startDate" placeholder="시작일자 입력하세요" required></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">종료일자</label></th>
				<th scope="col"><input type="date" class="form-control" id="endDate" name="endDate" placeholder="종료일자 입력하세요" required></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">입장료</label></th>
				<th scope="col"><input type="number" class="form-control" id="fee" name="fee" placeholder="금액을 입력하세요" required></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">홈페이지 URL</label></th>
				<th scope="col"><input type="text" class="form-control" id="url" name="url" placeholder="url을 입력하세요" required></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">기관전화번호</label></th>
				<th scope="col"><input type="text" class="form-control" id="telephone" name="telephone" placeholder="전화번호를 입력하세요" required></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlTextarea1" class="form-label">상세설명</label></th>
				<th scope="col"> <textarea class="form-control" id="detail" name="detail" rows="6" placeholder="상세설명을 입력하세요" required></textarea></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">태그</label></th>
				<th scope="col"><input type="text" class="form-control" id="tags" name="tags" placeholder="태그를 입력하세요" required></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">이미지</label></th>
				<th scope="col"><input style="display: block;" type="file" name="file"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required></th>
			</tr>
		</table>
		
			<fieldset>

			<div class="mb-3">
		        <label for="exampleFormControlInput1" class="form-label">축제명</label>
		        <input type="text" class="form-control" id="title" name="title" placeholder="축제명을 입력하세요" required>
		    </div>
		    <div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">주소</label>
			</div>
			<div class="mb-3"style="display: inline-block">
				<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
			</div>
			<div class="mb-3"style="display: inline-block">
				<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			</div>

		    <div class="mb-3">
				
		        <input type="text" class="form-control" id="stateName" name="stateName" placeholder="시/도를 입력하세요" required>
		        <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
				<input type="hidden" class="form-control" name="stateName" id="sample6_doAddress" placeholder="도">
				<input type="hidden" class="form-control" id="cityName" id="sample6_sigooAddress" placeholder="시구">
		    </div>
		    <div class="mb-3" style="display: inline-block">
		        <label for="exampleFormControlInput1" class="form-label">시/도</label>
		        <input type="text" class="form-control" id="stateName" name="stateName" placeholder="시/도를 입력하세요" required>
		    </div>
		    <div class="mb-3" style="display: inline-block">
		        <label for="exampleFormControlInput1" class="form-label">시/군/구</label>
		        <input type="text" class="form-control" id="cityName" name="cityName" placeholder="시/군/구를 입력하세요" required>
		    </div>
		    <div class="mb-3">
		        <label for="exampleFormControlInput1" class="form-label">상세주소</label>
		        <input type="text" class="form-control" id="cityName" name="cityName" placeholder="상세주소를 입력하세요" required>
		    </div>
		    <div class="mb-3">
		        <label for="exampleFormControlInput1" class="form-label">시작일자</label>
		        <input type="date" class="form-control" id="startDate" name="startDate" placeholder="시작일자 입력하세요" required>
		    </div>
		    <div class="mb-3">
		        <label for="exampleFormControlInput1" class="form-label">종료일자</label>
		        <input type="date" class="form-control" id="endDate" name="endDate" placeholder="종료일자 입력하세요" required>
		    </div>
		    <div class="mb-3">
		        <label for="exampleFormControlInput1" class="form-label">입장료</label>
		        <input type="number" class="form-control" id="fee" name="fee" placeholder="금액을 입력하세요" required>
		    </div>
		    <div class="mb-3">
		        <label for="exampleFormControlInput1" class="form-label">홈페이지 URL</label>
		        <input type="text" class="form-control" id="url" name="url" placeholder="url을 입력하세요" required>
		    </div>
		    <div class="mb-3">
		        <label for="exampleFormControlInput1" class="form-label">기관전화번호</label>
		        <input type="text" class="form-control" id="telephone" name="telephone" placeholder="전화번호를 입력하세요" required>
		    </div>
		    <div class="mb-3">
		            <label for="exampleFormControlTextarea1" class="form-label">상세설명</label>
		            <textarea class="form-control" id="detail" name="detail" rows="6" placeholder="상세설명을 입력하세요" required></textarea>
		    </div>
		    <div class="mb-3">
		        <label for="exampleFormControlInput1" class="form-label">태그</label>
		        <input type="text" class="form-control" id="tags" name="tags" placeholder="태그를 입력하세요" required>
		    </div>
		    
		    <div class="mb-3">
		        <label for="exampleFormControlInput1" class="form-label">이미지</label>
		        <input style="display: block;" type="file" name="file"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
		    </div>
		    <div class="d-grid gap-2 col-1 mx-auto" style="display: inline-block">
		            <input type="submit" class="btn btn-primary" value='등록하기'>
		        </div>
		        <div class="d-grid gap-2 col-1 mx-auto" style="display: inline-block">
		            <input type="submit" class="btn btn-primary" onclick="location.href='<c:url value='/admin/festivallist'/>'" value='돌아가기'>
		        </div>
		        
		    </fieldset>
			
		</form>
		
		
		<input type="text" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목">
		<input type="text" id="sample6_doAddress" placeholder="도">
		<input type="text" id="sample6_sigooAddress" placeholder="시구">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                var doAddr = ''; // 참고항목 변수
                var sigooAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                
                document.getElementById("sample6_doAddress").value = data.sido+"도";
                document.getElementById("sample6_sigooAddress").value = data.sigungu;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                
            }

        }).open();
    }
</script>
<!-- <script type="text/javascript">

var test = document.querySelector("#test");

 
$("#test").click(function(){
	$.ajax({
		  url: 'https://dapi.kakao.com/v2/local/search/address.json', // 호출할 API의 URL
		  type: 'GET', // HTTP 요청 방식
		  dataType: 'json', // 응답 데이터 타입
		  success: function(response) { // 성공 시 호출되는 콜백 함수
		    var sidoList = response; // 서버에서 받아온 지역 시도 목록
		    console.log("answkduf");
		    console.log(sidoList['data'].length);
		    var arrSido = sidoList['data'];
		    for (var i=0; i<arrSido.length; i++) {
		    	var keys = Object.keys(arrSido[i]); //키를 가져옵니다. 이때, keys 는 반복가능한 객체가 됩니다.
			    for (var j=0; j<keys.length; j++) {
			    	var key = keys[j];
			    	console.log("key : " + key + ", value : " + arrSido[i][key])
			    }
		    }
		    
		    // 받아온 데이터를 화면에 출력
		     /* for (var i = 0; i < sidoList.length; i++) {
		      var sido = sidoList[i];
		      console.log(sido);
		    }  */
		    	
		  },
		  error: function(xhr, status, error) { // 실패 시 호출되는 콜백 함수
		    console.log('Error:', error);
		  }
		});
});

</script> -->








<%@ include file="../adminfooter.jsp" %>