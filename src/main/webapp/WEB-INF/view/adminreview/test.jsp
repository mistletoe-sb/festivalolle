<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>reviewList TEST</title>
</head>
<body>
	<div class="container-fluid">
	<input type="radio" name="sort" value="all" id="allReview" checked="checked">전체
	<input type="radio" name="sort" value="reported" id="reportedReview">신고된 리뷰
	<table class="table">
		<thead>
			<tr id="sector">
	
				<th scope="col">리뷰 상태</th>
				<th scope="col">아이디</th>
				<th scope="col">내용</th>
				<th scope="col">작성일시</th>
				<th scope="col">축제명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${test}" var="test">
				<tr>
					<td>${test.status}</td>
					<td>${test.id}</td>
					<td>${test.content}</td>
					<td>${test.writeDate}</td>
					<td>${test.title}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
<script type="text/javascript">
$(document).ready(function(){	
  function getReportedList(){
    $.ajax({
      type : 'get',				// 타입 (get, post, put 등등)
      url : '/test3',			// 요청할 서버url 
      async : true,				// 비동기화 여부 (default : true)
      headers : {				// Http header
        "Content-Type" : "json",
        "X-HTTP-Method-Override" : "GET"
      },
      dataType : 'json',			// 데이터 타입 (html, xml, json, text 등등)
      data : JSON.parse('{}'),		// 보낼 데이터 (Object , String, Array) data를 받아와서 JSON형태로 변환
      success:function(result){		//Array
        let obj=JSON.parse(data);	
        let array=["<tr>"]; 
        obj["selectReport"].forEach(
          test =>  array.push("<td>"+test.status+"</td>" + "<td>"+test.id+"</td>" + "<td>"+test.content+"</td>" + "<td>"+test.writeDate+"</td>" + "<td>"+test.title+"</td>" )    
        );
        array.push("</tr>");                                   
        $("#result").html(array.join(""));    	//array의 요소들을 다 합쳐서 하나로 만든후 id="result"인 태그에 html로 출력
      },
      error:function(xhr, textStatus, errorThrown){					// 결과 에러 콜백함수
    	  console.log(errorThrown);
      }
    });    
  }
  
  $('input[name="sort"]').change(function() {	//라디오 버튼 변경 확인
    $('input[name="sort"]').each(function() {
      var value = $(this).val();
      var checked = $(this).prop('checked'); 
      if($("#reportedReview").is(":checked")){ 	//신고된 리뷰 checked 시, getReportedList 실행
        getReportedList();
      }
    });
  });
});
</script>
</body>
</html>