<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 클라이언트 소스 로드 -->
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
			</div>
			<div>
				<button type="submit">생성하기</button>
				<button onclick="location.href='<c:url value='/admin/festivallist'/>'">돌아가기</button>
			</div>
			
			<section id="ex9">
		        <style>
		            #ex9 .upload-box{
		                width:500px;
		                height: 300px;
		                border:1px solid gray;
		                box-shadow: 2px 3px 9px hsl(0, 0%, 47%);
		                padding:10px;
		            }
		        </style>
		        <h1>파일업로드 : DND & Trigger</h1>
		        <div class="upload-box">
		            <button class="btn-upload">파일선택</button>
		            <input class="btn-file d-none" type="file"> <!--파일 input box 형태-->     
		        </div>
		    </section>
		    <hr>
			
		</form>
	</div>
	<button onclick="location.href='<c:url value='/admin/festivallist'/>'">버튼</button>
	
	<h2>dropzone 테스트</h2>

    <div class="dropzone-area">

        <form name="fname">
            <div class="dropzone" id="fileDropzone"></div>
            <button id="btn-upload-file">서버전송</button>
        </form>

    </div>

    <script src="js/dropzone.min.js"></script>
    <script src="https://code.jquery.com/jquery-git.min.js"></script>

    <script>

        //fileDropzone dropzone 설정할 태그의 id로 지정
        Dropzone.options.fileDropzone = {

        url: '업로드할url',          //업로드할 url (ex)컨트롤러)
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
        thumbnailHeight: 400,        // Upload icon size
        thumbnailWidth: 200,         // Upload icon size
        maxFiles: 1,                // 업로드 파일수
        maxFilesize: 10,            // 최대업로드용량 : 10MB
        parallelUploads: 99,        // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 컨트롤러에 넘긴다.)
        addRemoveLinks: true,       // 삭제버튼 표시 여부
        dictRemoveFile: '삭제',     // 삭제버튼 표시 텍스트
        uploadMultiple: true,       // 다중업로드 기능
        
        };

    </script>

	
</body>

	<script type="text/javascript">
 var sec9 = document.querySelector('#ex9');
    var btnUpload = sec9.querySelector('.btn-upload');
    var inputFile = sec9.querySelector('input[type="file"]');
    var uploadBox = sec9.querySelector('.upload-box');

    /* 박스 안에 Drag 들어왔을 때 */
    uploadBox.addEventListener('dragenter', function(e) {
        console.log('dragenter');
    });
    
    /* 박스 안에 Drag를 하고 있을 때 */
    uploadBox.addEventListener('dragover', function(e) {
        e.preventDefault();
        console.log('dragover');

        this.style.backgroundColor = 'green';
    });
    
    /* 박스 밖으로 Drag가 나갈 때 */
    uploadBox.addEventListener('dragleave', function(e) {
        console.log('dragleave');

        this.style.backgroundColor = 'white';
    });
    
    /* 박스 안에서 Drag를 Drop했을 때 */
    uploadBox.addEventListener('drop', function(e) {
        e.preventDefault();

        console.log('drop');
        this.style.backgroundColor = 'white';
    });
    
    
    
    

	</script>
	
	
	

</html>