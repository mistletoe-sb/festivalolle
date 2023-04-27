<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>나의 리뷰</title>
		<style type="text/css">
			.review_card_container{
				padding: 0vmax 5vmin !important;
			}
			.star-ratings {
			  color: #aaa9a9; 
			  position: relative;
			  unicode-bidi: bidi-override;
			  width: max-content;
			  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
			  -webkit-text-stroke-width: 0.0625rem;
			  -webkit-text-stroke-color: #C7C7C7;
			}
			 
			.star-ratings-fill {
			  color: #F15600;
			  padding: 0;
			  position: absolute;
			  z-index: 1;
			  display: flex;
			  top: 0;
			  left: 0;
			  overflow: hidden;
			  -webkit-text-fill-color: #F15600;
			  -webkit-text-stroke-width: 0.0625rem;
			  -webkit-text-stroke-color: #F15600;
			}
			 
			.star-ratings-base {
			  z-index: 0;
			  padding: 0;
			}
		</style>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<div class="container-fluid review_card_container card-body" style="margin-top : 0.5rem;">
			<c:forEach var="fes" items="${selectReviewtList}" varStatus="stat">
				<div class="card mb-3" style="max-width: 33.75rem; " >
					<div class="row g-0">
						<div class="col-md-8">
							<div class="card-body">
								<div>
									<div style ="float:left;">
										<h5 class="card-title" style="cursor: pointer;" onclick="location.href='<c:url value='/festival/info?festivalCode=${fes.festivalCode}'/>'">${fes.title}</h5>
									</div>
									<div style ="float:right;">
										<p class="card-text reviewdelect" style="cursor: pointer;" data-ReviewCode="${fes.festivalReviewCode}">삭제</p>
									</div>
								</div>
								<div style ="clear:both;">
									<div style ="float:left;">
											<div class="star-ratings">
												<div class="star-ratings-fill space-x-2 text-lg" style="width: ${fes.rating*20}%">
													<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
												</div>
												<div class="star-ratings-base space-x-2 text-lg">
													<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
												</div>
											</div>
									</div>
									<div style ="float:left;">
										<p  class ="writeDate2" data-date="${fes.writeDate}"><small class="text-muted"> test</small></p>
									</div>
								</div>
								
								<div style ="clear:both;">
									<c:choose>
										<c:when test="${fes.status == '2'}">
											<p class="card-text" style="color: red;">블라인드 처리된 리뷰 입니다.<small class="text-muted"></small></p>
										</c:when>
										<c:otherwise>
											<p class="card-text">${fes.content}</p>
										</c:otherwise>
									</c:choose>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>

	<script>
	
/* 작성일자에 따라 보이는  문자 출력 */
	    function timeForToday(value) {
	        var today = new Date();// 오늘날짜
	        var timeValue = new Date(value); //입력될 날짜
	        var betweenTimeDay = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60/60/24);//일자로 계산
			var result = "";//결과값 받을 변수 선언
	        if (betweenTimeDay < 1) {//하루가 안 지났을 경우
	        	result = '오늘';
	        } else if (betweenTimeDay < 30) {//1달이 안 지났을경우
	        	result =betweenTimeDay + "일 전";
	        } else if (betweenTimeDay < 365) {//1년이 안 지났을 경우
	        	result = Math.floor(betweenTimeDay/30) + "달 전";
	        } else {// 1년이 지났을 경우
	        	result = Math.floor(betweenTimeDay / 365) + "년 전";
	        }
	        
	        return result;//결과값 저장
	    }
	    
	    $(".writeDate2").each(function(){//해당 클래스에 해당하는 반복문
	    	var date = $(this).attr('data-date');//매번 값이 변하고 class가 같기 때문에 this로 해서 값을 받아오기
	    	var result = timeForToday(date);//받아온 데이터를 함수 돌려 가공한 데이터 받아오기
	    	$(this).children(".text-muted").text(result);//this 위치에 해당 데이터를 작성하기
	    	
	    	 console.log(result);
	    });
	    
	    $(".reviewdelect").on("click", function(event) {
	    	var date = $(this).attr('data-ReviewCode');
	  	    swal('리뷰 삭제!', "리뷰 삭제가 완료 됐습니다.!", 'success').then(function() {
	  	    	location.href = "<c:url value='/mypage/reviewdelect?festivalReviewCode="+date+"'/>";
	  		});
	  	});




	
/* 	$(document).ready(function() {
	    var value = $("#writeDate2").val();
	    alert(value);
	    $("#writeDate").empty();
	    var timeForToday(value) {
	    	var today = new Date();
	    	var timeValue = new Date(value);
	        alert(timeValue);
	        alert(today);
	        alert(today.getDay());
	        alert(timeValue.getDay());
	        alert(Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60/60/24));
	        var betweenTimeDay = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60/60/24)

	        if (betweenTimeDay < 1) {
	            $('#writeDate2').val('오늘');
	        } else if (betweenTimeDay < 365) {
	            $('#writeDate2').val(betweenTimeDay);
	        } else{
	        $('#writeDate2').val(betweenTimeDay);
	        }
	    }
	}); */
	
/*	
	$(document).ready(function() {
		var value = $("#writeDate").val()
		alert(value);
		function timeForToday(value) {
	        const today = new Date();
	        const timeValue = new Date(value);

	        const betweenTimeHour = Math.floor(betweenTime / 60 / 24);
	        if (betweenTimeHour < 0) {
	        	$('#writeDate').val('오늘'');
	        }
	
	        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	        if (betweenTimeDay < 365) {
	        	$('#writeDate').val(${betweenTimeDay}일전);
	        }
	
	        $('#writeDate').val(${Math.floor(betweenTimeDay / 365)}년전);
	 }
	}
	*/
	</script>
</html>