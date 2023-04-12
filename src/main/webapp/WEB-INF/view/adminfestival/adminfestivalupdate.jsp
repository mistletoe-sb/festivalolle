<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   
  <style>
img{
width: 31.25rem;
}

.input-file-button{
  padding: 0.125rem 1.5625rem;
  background-color:#4e73df;
  border-radius: 0.25rem;
  color: white;
  cursor: pointer;
}
</style>    
 <%@ include file="../admintop.jsp" %>

	<div class="container-fluid">
		<!-- ★내용삽입★ -->
	<div class="card shadow mb-4">
	<div class="card-header py-3">
				<div style ="float:left; margin:0 auto">
                	<h6 class="m-0 font-weight-bold text-primary">축제 수정</h6>
                </div>
                <div class="d-grid gap-2 d-md-block" style ="float:right;">
					<input id="submit-button" type="submit" class="btn btn-primary" value='저장하기'>
					<input type="submit" class="btn btn-primary" onclick="location.href='<c:url value='/admin/adminfestivalinfo?festivalCode=${adminfestivalinfo.festivalCode}'/>'" value='상세정보'>
				</div>
            </div>
		<form id="my-form" action = "<c:url value='/admin/adminfestivalupdate?festivalCode=${adminfestivalinfo.festivalCode}'/>" method="post" enctype="multipart/form-data">
				<div class="card-body">
                <div class="table-responsive">
		<table class="table">
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">축제명</label></th>
				<th scope="col"><input type="text" class="form-control" id="title" name="title" placeholder="축제명을 입력하세요" value="${adminfestivalinfo.title}"></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">주소</label></th>
				
				<th scope="col"><button type="button" class="btn btn-outline-primary" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
				<input type="text" class="form-control" id="sample6_address" name="address" placeholder="주소"  value="${adminfestivalinfo.address}">
				<input type="hidden" class="form-control" id="sample6_postcode" placeholder="우편번호" >
				<input type="hidden" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
				<input type="hidden" class="form-control" name="stateName" id="sample6_doAddress" placeholder="도" value="${adminfestivalinfo.stateName}">
				<input type="hidden" class="form-control" name="cityName" id="sample6_sigooAddress" placeholder="시구" value="${adminfestivalinfo.cityName}">
				</th>
				
				
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">축제기간</label></th>
				<th scope="col">
					<div style ="float:left;">
						<label for="exampleFormControlInput1" class="form-label">시작일자</label>
						<input style="width:18.75rem;" type="date" class="form-control" id="startDate" name="startDate" placeholder="시작일자 입력하세요" required value="${adminfestivalinfo.startDate}">
					</div>
					<div style ="float:left;">
						<label for="exampleFormControlInput1" class="form-label">종료일자</label>
						<input style="width:18.75rem;" type="date" class="form-control" id="endDate" name="endDate" placeholder="종료일자 입력하세요" required value="${adminfestivalinfo.endDate}">
					</div>
				</th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">입장료</label></th>
				<th scope="col"><input type="number" class="form-control" id="fee" name="fee" placeholder="금액을 입력하세요" required value="${adminfestivalinfo.fee}"></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">홈페이지 URL</label></th>
				<th scope="col"><input type="text" class="form-control" id="url" name="url" placeholder="url을 입력하세요" required value="${adminfestivalinfo.url}"></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">기관전화번호</label></th>
				<th scope="col"><input type="text" class="form-control" id="telephone" name="telephone" placeholder="전화번호를 입력하세요" required value="${adminfestivalinfo.telephone}"></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlTextarea1" class="form-label">상세설명</label></th>
				<th scope="col"> <textarea class="form-control" id="detail" name="detail" rows="6" placeholder="상세설명을 입력하세요" required >${adminfestivalinfo.detail}</textarea></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">태그</label></th>
				<th scope="col"><input type="text" class="form-control" id="tags" name="tags"  size="100" placeholder="스페이스를 사용하여 태그를 작성 하세요." onkeydown="splitTag(event)" required value="${adminfestivalinfo.tags}"></th>
			</tr>
			<tr>
				<th scope="col"><label for="exampleFormControlInput1" class="form-label">이미지</label></th>
				<th scope="col">
					<div id="image_container">
						<c:choose>
							<c:when test="${img == '1'}">
								<div class="img_ctn">
									<img style="width: 31.25rem;" id="preview-image" class="rounded-4" src="<c:url value='/resources/img/null_png.png'/>">
								</div>
									<input type="hidden" class="imgstatus" value="0" name="rating">
							</c:when>
							<c:otherwise>
								<div class="img_ctn">
									<img style="display: block; width: 31.25rem;" src="data:image:jpg;base64,${img}"/ aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
									<input type="hidden" class="imgstatus" value="1" name="rating">
							</c:otherwise>
						</c:choose>
					</div>
					<label class="input-file-button" for="form-control">
					  업로드
					</label>
					<input  type="file" name="file" id="form-control" class="form-control" accept="image/*" onchange="setThumbnail(event);" style="display:none">
					<input  type="hidden" name="image" value="${adminfestivalinfo.image}">
					<input  type="hidden" name="thumbnail" value="${adminfestivalinfo.image}">
					
				</th>
			</tr>
		</table>
		
			<fieldset>
			
			<div class="d-grid gap-2 d-md-block" style ="float:right;">
				<input id="submit-button1" type="submit" class="btn btn-primary" value='저장하기' >
				<input type="submit" class="btn btn-primary" onclick="location.href='<c:url value='/admin/adminfestivalinfo?festivalCode=${adminfestivalinfo.festivalCode}'/>'" value='상세정보'>
			</div>

		        
		    </fieldset>
			</div>
		</div>
		</form>
		</div>
		</div>
		
		
		<!-- <input type="text" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목">
		<input type="text" id="sample6_doAddress" placeholder="도">
		<input type="text" id="sample6_sigooAddress" placeholder="시구"> -->

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function setThumbnail(event) {
    var reader = new FileReader();
	
    reader.onload = function(event) {
    	$(".img_ctn").empty();
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div.img_ctn").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }

function splitTag(event) {
	  // 스페이스 바 누를 시 동작
	  if (event.keyCode == 32) {
	    var tagListOrigin = $('#tags').val();
	    var tagList = tagListOrigin.split(' '); // 현재 입력한 태그 내용들을 ' ' 기준으로 split
//	    var tagList = $('#tags').val().split(' '); // 현재 입력한 태그 내용들을 ' ' 기준으로 split
	    var tags = '';
	    var usedTags = []; // 이미 사용된 태그를 담는 배열

	    // split한 각 태그들을 검증해서 가공
	    if (checkTagCount(tagList)) {
	      for (x of tagList) {
	        if ((x.indexOf('#') != 0) && (x.length > 0)) { // 1글자 이상이고, 맨 첫글자가 #이 아니면,addTag(tag)
	          var tag = '#' + x;
	          if (checkTagLength(tag) && checkTagCharacters(tag) && checkReservedTags(tag) && !usedTags.includes(tag.toLowerCase())) {
	            // 태그 길이, 문자, 예약어, 개수 제한 조건을 모두 만족하고, 사용된 태그가 아니면,
	            tags += (tag + ' '); // #을 붙여서 추가
	            usedTags.push(tag.toLowerCase()); // 사용된 태그를 배열에 추가
	          }
	        } else if (x.indexOf('#') == 0 && (x.length > 1)) { // 2글자 이상이고, 맨 첫글자가 #이면,
	          var tag = x;
	          if (checkTagLength(tag) && checkTagCharacters(tag) && checkReservedTags(tag) && !usedTags.includes(tag.toLowerCase())) {
	            // 태그 길이, 문자, 예약어, 개수 제한 조건을 모두 만족하고, 사용된 태그가 아니면,
	            tags += (tag + ' '); // 그대로 추가
	            usedTags.push(tag.toLowerCase()); // 사용된 태그를 배열에 추가
	          }
	        }
	      }
	    }
	    
	//    $('#tags').val(tags); // 새로 가공된 내용을 출력
	 	$('#tags').val(tags.trim());

	    /* 태그 제약 조건 */

	  }
	}
//태그 길이 제한
const MAX_TAG_LENGTH = 10;

function checkTagLength(tag) {
if (tag.length >= MAX_TAG_LENGTH) {
	  swal('입력 오류!', "태그는 " + MAX_TAG_LENGTH+ "자 이하여야 합니다.", 'warning');
return false;
}
return true;
}

//문자 제한
function checkTagCharacters(tag) {
const regex = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣#]+$/;
if (!regex.test(tag)) {
	swal('입력 오류!', "태그는 알파벳, 숫자, 한글만 입력할 수 있습니다.", 'warning');
return false;
}
return true;
}

//예약어 제한
const RESERVED_TAGS = ["javascript", "html", "css"];

function checkReservedTags(tag) {
if (RESERVED_TAGS.includes(tag.toLowerCase())) {
	swal('입력 오류!', "javascript, html, css은 사용할 수 없는 예약어입니다.", 'warning');
return false;
}
return true;
}

//태그 수 제한
const MAX_TAG_COUNT = 10;

function checkTagCount(tagList) {
if (tagList.length > MAX_TAG_COUNT) {
	swal('입력 오류!', "태그는 최대 "+ MAX_TAG_COUNT +"개까지 사용할 수 있습니다.", 'warning');
return false;
}
return true;
}

var tagArray = []; // 태그 배열을 전역 변수로 선언

function addTag(tag) {
if (tagArray.includes(tag)) { // 태그 배열에 이미 존재하는 경우
	swal('입력 오류!', "이미 입력된 태그입니다.", 'warning');
return false;
}
return true; // 태그 배열에 추가
//태그 출력 및 제약조건 체크 등 추가 구현
}

function deleteLastTag() {
var lastTag = tagArray.pop(); // 배열에서 마지막 태그를 제거하고 반환
//마지막 태그 출력 등 추가 구현
}

function clearTags() {
tagArray = []; // 태그 배열 초기화
//입력된 태그 모두 제거 등 추가 구현
}

	
var addr = ''; // 주소 변수
var extraAddr = ''; // 참고항목 변수
var doAddr = ''; // 참고항목 변수
var sigooAddr = ''; // 참고항목 변수
var detailAddress = ''


  function sample6_execDaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              

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
              

              document.getElementById("sample6_doAddress").value = data.sido;
              document.getElementById("sample6_sigooAddress").value = data.sigungu;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById("sample6_address").focus();
              
          }

      }).open();
  }
  
$("#sample6_detailAddress").blur(function() {
	 detailAddress = $("#sample6_detailAddress").val();
	 $("#realAddress").val(addr + " " + detailAddress);
	 $("#realAddress2").val(addr + " " + detailAddress);
});
	
	
	
	
//최대 50자 이내, 공백 포함 가능한 제목
$("#title").on("keyup", function() {
validateTitle($(this).val());
});

function validateTitle(title) {
if (title.trim().length > 50) {
	  swal('입력 오류!', "제목은 최대 50자 입니다.", 'warning');
  return false;
}
return true;
}

//최대 200자 이내, 공백 포함 가능한 주소
$("#sample6_address").on("keyup", function() {
	validateAddress($(this).val());
});

function validateAddress(address) {
if (address.trim().length > 200) {
	  swal('입력 오류!', "주소는 최대 200자 입니다.", 'warning');
  return false;
}
return true;
}

//날짜 형식 (YYYY-MM-DD)에 맞아야 하며, 종료일자보다 이전이어야 하는 시작일자
$("#startDate").on("blur", function() {
	validateStartDate($(this).val(),$("#endDate").val());
});

function validateStartDate(startDate, endDate) {
const start = new Date(startDate);
const end = new Date(endDate);

if (start >= end) {
	  swal('입력 오류!', "종료일자보다 이전이어야 합니다.", 'warning');
  return false;
}
return true;
}

//날짜 형식 (YYYY-MM-DD)에 맞아야 하며, 시작일자보다 이후이어야 하는 종료일자
$("#endDate").on("blur", function() {
	validateEndDate($(this).val(),$("#startDate").val());
});

function validateEndDate(endDate, startDate) {
const end = new Date(endDate);
const start = new Date(startDate);

if (end <= start) {
	  swal('입력 오류!', "시작일자보다 이후이어야 합니다.", 'warning');
  return false;
}
return true;
}

//숫자(정수 또는 실수) 형식, 0 또는 양수인 입장료
$("#fee").on("keyup", function() {
	validateFee($(this).val());
});

function validateFee(fee) {
if (isNaN(parseFloat(fee)) || parseFloat(fee) < 0) {
	  swal('입력 오류!', "숫자만 입력해 주세요.", 'warning');
  return false;
}
return true;
}

//유효한 URL 형식인 홈페이지 URL
/* $("#url").on("keyup", function() {
	validateHomepage($(this).val());
}); */

function validateHomepage(url) {
const regex = /^(ftp|http|https):\/\/[^ "]+$/;
if (!regex.test(url)) {
	  swal('입력 오류!', "유효한 URL 형식을 입력해 주세요.", 'warning');
  return false;
}
return true;
}

//숫자와 하이픈(-) 포함 가능, 최대 20자 이내인 기관 전화번호
$("#telephone").on("keyup", function() {
	validatePhoneNumber($(this).val());
});

function validatePhoneNumber(phone) {
const regex = /^[0-9-]{0,20}$/;
if (!regex.test(phone)) {
	  swal('입력 오류!', "숫자와 하이픈(-)포함 최대 20자 까지 가능합니다.", 'warning');
  return false;
}
return true;
}

//최대 1000자 이내, 공백 포함 가능한 상세 설명
$("#detail").on("keyup", function() {
	validateDescription($(this).val());
});

function validateDescription(description) {
if (description.trim().length > 1000) {
	  swal('입력 오류!', "최대 1000자 까지 가능합니다.", 'warning');
  return false;
}
return true;
}
	
$("#submit-button").on("click", function(event) {
	  // 이벤트 전파 막기
	  event.preventDefault();

	  // 유효성 검사 함수들 호출
	  const isTitleValid = validateTitle($("#title").val());
	  const isAddressValid = validateAddress($("#sample6_address").val());
	  const isStartDateValid = validateStartDate($("#startDate").val(), $("#endDate").val());
	  const isEndDateValid = validateEndDate($("#endDate").val(), $("#startDate").val());
	  const isFeeValid = validateFee($("#fee").val());
	  const isPhoneNumberValid = validatePhoneNumber($("#telephone").val());
	  const isDescriptionValid = validateDescription($("#detail").val());
	console.log(isTitleValid);
	console.log(isAddressValid);
	console.log(isStartDateValid);
	console.log(isEndDateValid);
	console.log(isFeeValid);
	console.log(isPhoneNumberValid);
	console.log(isDescriptionValid);
	  // 결과 확인 후 전송 또는 알림 출력
	  if (isTitleValid && isAddressValid && isStartDateValid && isEndDateValid && isFeeValid && isPhoneNumberValid && isDescriptionValid) {
	    // 모든 유효성 검사를 통과한 경우, 전송
	    swal('축제 등록!', "축제가 등록되었습니다!", 'success');
	    $("#my-form").submit();
	  } else {
	    // 유효성 검사를 통과하지 못한 경우, 알림 출력
	    swal('입력 오류!', "입력하신 정보를 다시 확인해주세요.", 'error');
	  }
	});	
$("#submit-button1").on("click", function(event) {
	  // 이벤트 전파 막기
	  event.preventDefault();

	  // 유효성 검사 함수들 호출
	  const isTitleValid = validateTitle($("#title").val());
	  const isAddressValid = validateAddress($("#sample6_address").val());
	  const isStartDateValid = validateStartDate($("#startDate").val(), $("#endDate").val());
	  const isEndDateValid = validateEndDate($("#endDate").val(), $("#startDate").val());
	  const isFeeValid = validateFee($("#fee").val());
	  const isPhoneNumberValid = validatePhoneNumber($("#telephone").val());
	  const isDescriptionValid = validateDescription($("#detail").val());
	console.log(isTitleValid);
	console.log(isAddressValid);
	console.log(isStartDateValid);
	console.log(isEndDateValid);
	console.log(isFeeValid);
	console.log(isPhoneNumberValid);
	console.log(isDescriptionValid);
	  // 결과 확인 후 전송 또는 알림 출력
	  if (isTitleValid && isAddressValid && isStartDateValid && isEndDateValid && isFeeValid && isPhoneNumberValid && isDescriptionValid) {
	    // 모든 유효성 검사를 통과한 경우, 전송
	    swal('축제 등록!', "축제가 등록되었습니다!", 'success').then(function() {
	    	$("#my-form").submit();
		});
	  } else {
	    // 유효성 검사를 통과하지 못한 경우, 알림 출력
	    swal('입력 오류!', "입력하신 정보를 다시 확인해주세요.", 'error');
	  }
	});
	
	
	
</script>
	
	
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