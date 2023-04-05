<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<style>
		    #preview-image {
		  		object-fit: cover;
				width: 100%;
				height: 100%;
		}
	</style>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>입장권 리스트</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.css" />
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>"/>
		<script src="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/mobile.js'/>"></script>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<div class="container-fluid" >
			<c:forEach var="fes" items="${selectTicketList}" varStatus="stat">
				<div class="card mb-3" style="max-width: 540px; cursor: pointer;" onclick="location.href='<c:url value='/mypage/ticketinfo?ticketCode=${fes.ticketCode}'/>'">
					<div class="row g-0" >
					
						<div class="endday" data-date="${fes.endDate}" style="background-origin : padding-box">
							<c:choose>
								<c:when test="${fes.entranceTime != '' and fes.couponUseTime != ''}">
									<th scope="col">
										<img style="width: 50px; " id="status-image" class="rounded-4" src="<c:url value='/resources/img/사용완료.png'/>">
									</th>
								</c:when>

								<c:otherwise>

								</c:otherwise>
							</c:choose>
						</div>
						
						<div class="col-md-4">
							<c:choose>
								<c:when test="${fes.address == '1'}">
									<th scope="col">
										<img  id="preview-image" class="img-thumbnail" src="<c:url value='/resources/img/null_png.png'/>">
									</th>
								</c:when>
								<c:otherwise>
									<th scope="col">
										<img id="preview-image" src="data:image:jpg;base64,${fes.address}" class="img-thumbnail" alt="...">
									</th>
								</c:otherwise>
							</c:choose>
							
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">${fes.title}</h5>
								<p class="card-text">유효기간 : ${fes.startDate} ~ ${fes.endDate}</p>
								<p class="card-text"><small class="text-muted">구매 날짜 : ${fes.purchaseTime}<br>
																				구매 금액 : ${fes.fee * fes.headCount}원</small></p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
	
	<script type="text/javascript">
    /* 작성일자에 따라 보이는  문자 출력 */
    function endToday(value) {
        var today = new Date();// 오늘날짜
        var endToday = new Date(value); //입력될 날짜
        var betweenTimeDay = Math.floor(today-endToday);//일자로 계산
		var result = "";//결과값 받을 변수 선언
        if (betweenTimeDay < 0) {//하루가 안 지났을 경우
        	result = 0;
        } else {// 1년이 지났을 경우
        	result = 1;
        }
        
        return result;//결과값 저장
    }
    $(".endday").each(function(){//해당 클래스에 해당하는 반복문
    	var date = $(this).attr('data-date');//매번 값이 변하고 class가 같기 때문에 this로 해서 값을 받아오기
    	var result = timeForToday(date);//받아온 데이터를 함수 돌려 가공한 데이터 받아오기
    	$(this).text(result);//this 위치에 해당 데이터를 작성하기

    });
	</script>
</html>