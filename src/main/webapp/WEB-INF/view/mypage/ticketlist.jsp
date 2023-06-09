<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>구매내역</title>
	<style>
	.review_card_container{
		padding: 0vmax 5vmin !important;
	}
		    .card-thumbnail {
		  		object-fit: cover;
				width: 100%;
				height: 100%;
				border-top-left-radius: 1rem;
				border-bottom-left-radius: 1rem;
		}
		
.card-horizontal {
  display: flex;
  align-items: center;
}

.card-horizontal-image {
  min-width: 38vmin;
  max-width: 38vmin;
  height: 13.125rem;
  overflow: hidden;
  border-top-left-radius: 1rem;
  border-bottom-left-radius: 1rem;
}

/* .card-horizontal-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
} */

.card-horizontal-content {
  flex: 1;
  padding: 0.625rem;
  width: 50vmin;
  height: 13.125rem;
}

.card-horizontal-content h5 {
  font-size: 1.25rem;
  margin-bottom: 0.625rem;
  width: 100%;
}

.card-horizontal-content p {
  font-size: 0.875rem;
  color: #777777;
}
.stamp_style {
	width: 6rem;
	position: absolute;
	top: 0.5125rem;
	right: 0.5125rem;
	rotate: -25deg;
}
	</style>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<c:if test="${fn:length(selectTicketList) == 0}">
			<div id="mypageTicketLayout" class="default_list_layout">
				<div class="no_result">구매한 티켓이 없습니다.</div>
			</div>
		</c:if>
		<div class="container-fluid review_card_container" style="margin-top : 0.5rem;">
			<c:forEach var="fes" items="${selectTicketList}" varStatus="stat">
				<div class="card" style="max-width: 33.75rem; margin-bottom: 0.5rem; border: 0.0625rem solid #DDDDDD;">
					<div class="card-horizontal" style="cursor: pointer; max-width: 33.75rem; " onclick="location.href='<c:url value='/mypage/ticketinfo?ticketCode=${fes.ticketCode}'/>'">
						<div class="endday" data-endDate="${fes.endDate}" data-entDate="${fes.entranceTime}" data-cpuDate="${fes.couponUseTime}" style="background-origin : padding-box"></div>
						<div class="card-horizontal-image">
							<img src="<c:url value='/resources/img/mobile/empty_image.png'/>" class="card-thumbnail" alt="${fes.festivalCode}">
						</div>
						<div class="card-horizontal-content">
							<h5 class="card-title text-truncate">
								${fes.title}
							</h5>
							<p class="card-text">
								유효기간 : <br>${fes.startDate} ~ ${fes.endDate}
							</p>
							<p class="card-text">
								구매 날짜 : <br>${fes.purchaseTime}
							</p>
							<p class="card-text">
								구매 금액 : ${fes.fee * fes.headCount}원
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>

	<script type="text/javascript">
    /* 작성일자에 따라 보이는  문자 출력 */
function endToday(endDateParam, entDateParam, cpuDateParam) {
  var today = new Date(); // 오늘 날짜
  var endDate = new Date(endDateParam); // 입력된 날짜
  var betweenTimeDay = Math.floor((today - endDate) / (1000 * 60 * 60 * 24)); // 일자로 계산
  var result = ""; // 결과값 받을 변수 선언
  //console.log(today+'/'+endDate+'/'+entDateParam+'/'+cpuDateParam+'/'+betweenTimeDay);
  if (((entDateParam != 0) && (cpuDateParam != 0))) { // 사용 완료
    result = 0;
  } else if (((entDateParam == 0) || (cpuDateParam == 0)) && (betweenTimeDay >= 0)) { // 기간 만료
    result = 1;
  } else {
    result = 2;
  } 
  
  

  
  return result; // 결과값 저장
}
    $(".endday").each(function(){//해당 클래스에 해당하는 반복문
    	var endDateParam = $(this).attr('data-endDate');//매번 값이 변하고 class가 같기 때문에 this로 해서 값을 받아오기
    	var entDateParam = $(this).attr('data-entDate');
    	var cpuDateParam = $(this).attr('data-cpuDate');

    	var result = endToday(endDateParam, entDateParam, cpuDateParam);//받아온 데이터를 함수 돌려 가공한 데이터 받아오기
    	var img = document.createElement("img");
    	//console.log(result)
    	if(result == 0){
    		
    		img.setAttribute("src", "<c:url value='/resources/img/사용완료.png'/>");
    		img.setAttribute("class","stamp_style");
    		$(this).append(img);
    	} else if(result == 1){
    		img.setAttribute("src", "<c:url value='/resources/img/기간만료.png'/>");
    		img.setAttribute("class","stamp_style");
    		$(this).append(img);
    	} else{
    		
    	}

    });
	</script>
</html>