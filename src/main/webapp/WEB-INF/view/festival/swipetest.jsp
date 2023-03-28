<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Joyous</title>
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>"/>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<style type="text/css">
		.box{position:relative; width:380px; height:440px; border:10px solid #000; display: flex; flex-direction: column; justify-content: center;  align-items: center;}
		.box p {display:none}
		</style>
		<script type="text/javascript">
		 var mstartX = 0, mendX = 0,mstartY = 0, mendY = 0;
		  $(".box").on('mousedown',function(event){
		      mstartX = event.pageX;
		      mstartY = event.pageY;
		  });
		  $(".box").on('mouseup',function(event){
		      mendX=event.pageX;
		      mendY=event.pageY;
		    if(mstartY-mendY>10){
		      $(".box p.toTop").fadeOut(300);
		      $(".box p.toBottom").fadeIn(300);     
		     }else if(mendY-mstartY>10){
		      $(".box p.toBottom").fadeOut(300);
		      $(".box p.toTop").fadeIn(300);     
		     }else if(mstartY-mendY<10 || mendY-mstartY<10 ){
		      $(".box p.toBottom, .box p.toTop").fadeOut(300);
		     }
		      if(mstartX-mendX>10){
		      $(".box p.toLeft").fadeOut(300);
		      $(".box p.toRight").fadeIn(300);     
		     }else if(mendX-mstartX>10){
		      $(".box p.toRight").fadeOut(300);
		      $(".box p.toLeft").fadeIn(300);     
		     }else if(mstartX-mendX<10 || mendX-mstartX<10 ){
		      $(".box p.toRight, .box p.toLeft").fadeOut(300);
		     }
		  });




		var startX,startY, endX,endY;
		$(".box").on('touchstart',function(event){
		    startX = event.originalEvent.changedTouches[0].screenX;
		    startY = event.originalEvent.changedTouches[0].screenY;
		});
		$(".box").on('touchend',function(event){
		     endX=event.originalEvent.changedTouches[0].screenX;
		     endY=event.originalEvent.changedTouches[0].screenY;
		    if(startY-endY>10){
		      $(".box p.toTop").fadeOut(300);
		      $(".box p.toBottom").fadeIn(300);     
		     }else if(endY-startY>10){
		      $(".box p.toBottom").fadeOut(300);
		      $(".box p.toTop").fadeIn(300);     
		     }else if(startY-endY<10 || endY-startY<10 ){
		      $(".box p.toBottom, .box p.toTop").fadeOut(300);
		     }
		  if(startX-endX>10){
		      $(".box p.toLeft").fadeOut(300);
		      $(".box p.toRight").fadeIn(300);     
		     }else if(endX-startX>10){
		      $(".box p.toRight").fadeOut(300);
		      $(".box p.toLeft").fadeIn(300);     
		     }else if(startX-endX<10 || endX-startX<10 ){
		      $(".box p.toRight, .box p.toLeft").fadeOut(300);
		     }
		});
		</script>
	</head>
	<body>
		<div class="box">
  
		  <p class="p1 toRight">오른쪽에서 왼쪽으로</p>
		  <p class="p1 toLeft">왼쪽에서 오른쪽으로</p>
		   <p class="p2 toTop">위에서 아래로</p>
		  <p class="p2 toBottom">아래서 위로</p>
		  
		</div>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>