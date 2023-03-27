<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 클라이언트 소스 로드 -->
<!-- <script src="js/dropzone.min.js"></script> -->
<script src="https://code.jquery.com/jquery-git.min.js"></script>
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css"/>
<meta charset="UTF-8">
<title>festivalInsert</title>
</head>
<body>
	<div>
		<form action = "<c:url value='/admin/festivalinsert'/>" method="post" enctype="multipart/form-data">
			<div>
				<samp>축제명</samp>
				<input type="text" name="title">
			</div>
			<div>
				<samp>개최지역</samp>
				<input type="text" name="stateName">
				<input type="text" name="cityName">
			</div>
			<div>
				<samp>상세주소</samp>
				<input type="text" name="address">
			</div>
			<div>
				<samp>시작일자</samp>
				<input type="date" name="startDate">
			</div>
			<div>
				<samp>종료일자</samp>
				<input type="date" name="endDate">
			</div>
			<div>
				<samp>입장료</samp>
				<input type="number" name="fee">
			</div>
			<div>
				<samp>홈페이지 URL</samp>
				<input type="text" name="url">
			</div>
			<div>
				<samp>기관전화번호</samp>
				<input type="text" name="telephone">
			</div>
			<div>
				<samp>상세설명</samp>
				<input type="text" name="detail">
			</div>
			<div>
				<samp>태그</samp>
				<input type="text" name="tags">
			</div>
			<div>
				<samp>이미지</samp>
				<input type="text" name="fileName">
				<input style="display: block;" type="file" name="file"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
			</div>
			
<!-- 			<div class="dropzone-area">
	            <div class="dropzone" id="fileDropzone"></div>
	            <button id="btn-upload-file2">서버전송</button>
    		</div> -->
			<div>
				<button id="btn-upload-file" type="submit">생성하기</button>
				<button onclick="location.href='<c:url value='/admin/festivallist'/>'">돌아가기</button>
			</div>
			
		    <hr>
			
		</form>
	</div>
	<button onclick="location.href='<c:url value='/admin/festivallist'/>'">버튼</button>
	

</body>

    

<!--     <script>

        //fileDropzone dropzone 설정할 태그의 id로 지정
        Dropzone.options.fileDropzone = {

        url: "./festivalinsert",          //업로드할 url (ex)컨트롤러)
        paramName : "file",	// 파일 업로드시 전송되는 파라미터 이름
        init: function () {
            /* 최초 dropzone 설정시 init을 통해 호출 */
            var submitButton = document.querySelector("#btn-upload-file");
            var myDropzone = this; //closure

            submitButton.addEventListener("click", function () {
                
                console.log("업로드");
                //tell Dropzone to process all queued files
                myDropzone.processQueue(); 

            });
            
            //기존에 업로드된 서버파일이 있는 경우,
            // $.ajax({
            //     url: 'upload.php',
            //     type: 'post',
            //     data: {request: 2},
            //     dataType: 'json',
            //     success: function(response){

            //         $.each(response, function(key,value) {
            //             var mockFile = { name: value.name, size: value.size };

            //             myDropzone.emit("addedfile", mockFile);
            //             myDropzone.emit("thumbnail", mockFile, value.path);
            //             myDropzone.emit("complete", mockFile);

            //         });

            //     }
            // });

        },
        autoProcessQueue: false,    // 자동업로드 여부 (true일 경우, 바로 업로드 되어지며, false일 경우, 서버에는 올라가지 않은 상태임 processQueue() 호출시 올라간다.)
        clickable: true,            // 클릭가능여부
//        thumbnailHeight: 400,        // Upload icon size
//        thumbnailWidth: 200,         // Upload icon size
        maxFiles: 1,                // 업로드 파일수
        maxFilesize: 10,            // 최대업로드용량 : 10MB
        parallelUploads: 99,        // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 컨트롤러에 넘긴다.)
        addRemoveLinks: true,       // 삭제버튼 표시 여부
        dictRemoveFile: '삭제',     // 삭제버튼 표시 텍스트
        uploadMultiple: true,       // 다중업로드 기능
        acceptedFiles: "image/*",
        dictDefaultMessage: "파일을 드래그하여 업로드하세요", // 드롭존 안내 메시지
        dictFileTooBig: "파일이 너무 큽니다 ({{filesize}}MB). 최대 크기는 {{maxFilesize}}MB 입니다.", // 파일 크기 초과 에러 메시지
        dictInvalidFileType: "이 파일은 업로드할 수 없습니다. ({{acceptedFiles}}만 업로드 가능)", // 허용되지 않은 파일 확장자 에러 메시지
        
        };

    </script> -->

	



	
	
	

</html>