<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>회원탈퇴</title>
		 <!-- Custom fonts for this template-->
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<%-- 내용 작성자-이혜성 --%>
		<div class="modal fade" id="findMember" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  			<div class="modal-dialog">
   		 		<div class="modal-content">
      				<div class="modal-header">
       					 <h1 class="modal-title fs-5" id="staticBackdropLabel">회원탈퇴</h1>
       						 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      				</div>
      				<div class="modal-body">
        				<h5 class="text-center">정말 탈퇴 하시겠습니까?</h5>
      				</div>
      				<form class="user" name="modalfrm" action="./withdrawalmodal" method="GET"> 
	      				<div class="modal-footer">
	      					<div class="form-group">
							<a href= ./withdrawal>
								<input class="btn btn-secondary btn-user btn-block btn-primary-mobile"  data-bs-dismiss="modal" type="text" id="cancle" value="돌아가기">
							</a>
							<input class="btn btn-primary btn-user btn-block btn-primary-mobile" type="submit" id="withdrawal" value="탈퇴하기">
							</div>
	     				</div>
     				</form>
  			  	</div>
  		    </div>
		</div>
		<%-- 내용 끝: 오류는 없지만 모달이 띄위지지 않음 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>