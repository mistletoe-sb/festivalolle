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
		
.card-horizontal {
  display: flex;
  align-items: center;
  border: 1px solid #ddd;
  border-radius: 4px;
}

.card-horizontal-image {
  width: 140px;
  height: 210px;
  overflow: hidden;
  border-radius: 4px 0 0 4px;
}

.card-horizontal-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.card-horizontal-content {
  flex: 1;
  padding: 10px;
}

.card-horizontal-content h5 {
  font-size: 20px;
  margin-bottom: 10px;
}

.card-horizontal-content p {
  font-size: 16px;
  color: #777;
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
			<div class="card mb-3" style="max-width: 540px; ">
				<div class="card-horizontal" style="cursor: pointer; max-width: 540px; " onclick="location.href='<c:url value='/mypage/ticketinfo?ticketCode=${fes.ticketCode}'/>'">
					<div class="endday" data-endDate="${fes.endDate}" data-entDate="${fes.entranceTime}" data-cpuDate="${fes.couponUseTime}" style="background-origin : padding-box">
					</div>
					<div class="card-horizontal-image">
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
					<div class="card-horizontal-content">
						<h5 class="card-title">
							${fes.title}
						</h5>
						<p class="card-text">
							유효기간 : ${fes.startDate} ~ ${fes.endDate}
						</p>
						<p class="card-text">
							<small class="text-muted">
								구매 날짜 : ${fes.purchaseTime}<br>
								구매 금액 : ${fes.fee * fes.headCount}원
							</small>
						</p>
					</div>
				</div>
			
<%-- 				<div class="card mb-3" style="max-width: 540px; cursor: pointer;" onclick="location.href='<c:url value='/mypage/ticketinfo?ticketCode=${fes.ticketCode}'/>'">
					<div class="row g-0" >
						
					
						<div class="endday" data-endDate="${fes.endDate}" data-entDate="${fes.entranceTime}" data-cpuDate="${fes.couponUseTime}" style="background-origin : padding-box">


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
				</div> --%>
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
  console.log(today+'/'+endDate+'/'+entDateParam+'/'+cpuDateParam+'/'+betweenTimeDay);
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
    	console.log(result)
    	if(result == 0){
    		
    		img.setAttribute("src", "<c:url value='/resources/img/사용완료.png'/>");
    		img.setAttribute("style","width: 50px; position: absolute; top : 5px; left : 5px;");
    		$(this).append(img);
    	} else if(result == 1){
    		img.setAttribute("src", "<c:url value='/resources/img/기간만료.png'/>");
    		img.setAttribute("style","width: 50px; position: absolute; top : 5px; left : 5px;");
    		$(this).append(img);
    	} else{
    		
    	}

    });
	</script>
</html>