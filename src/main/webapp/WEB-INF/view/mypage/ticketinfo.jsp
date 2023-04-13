<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
	<head>
	<style>
		    #preview-image {
		  		object-fit: cover;
				width: 100%;
				height: 100%;
				}
			#btn-ent{
				border-radius: 1.25rem
			}

	</style>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>구매 내역</title>
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
		<div class="container-fluid">
				<div class="card mb-3" style="max-width: 33.75rem; ">
					<div class="row g-0">
						<div class="col-md-4">
							<c:choose>
								<c:when test="${img == '1'}">
										<img id="preview-image" class="img-thumbnail" src="<c:url value='/resources/img/null_png.png'/>">
								</c:when>
								<c:otherwise>
										<img id="preview-image" class="img-thumbnail" src="data:image:jpg;base64,${img}"/ aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<div class = "layout_bottom_line">
									<div>
										<div style ="float:left;">
											<h5 class="card-title" style="cursor: pointer;" onclick="location.href='<c:url value='/festival/info?festivalCode=${adminfestivalinfo.festivalCode}'/>'">${adminfestivalinfo.title}</h5>
										</div>
										<div class="entrance" style ="float:right;" data-endDate="${adminfestivalinfo.endDate}" data-entDate="${adminfestivalinfo.entranceTime}" data-cpuDate="${adminfestivalinfo.couponUseTime}">
											<%-- <input type="button" id="btn-ent" class="btn btn-warning btn-sm" value="입장권" onclick="location.href='<c:url value='/myticket'/>'" />  --%>
										</div>
									</div>
									<div style ="clear:both;">
										<p class="card-text">유효기간 : ${adminfestivalinfo.startDate} ~ ${adminfestivalinfo.endDate}</p>
									</div>
								</div>
								<div class = "layout_bottom_line">
									<p class="card-text"><small class="text-muted">
										구매 일자 : ${adminfestivalinfo.purchaseTime}<br>
										구매자 이름 : ${adminfestivalinfo.name}<br>
										전화번호 : ${adminfestivalinfo.mobile}</small>
									</p>
								</div>
								<div class = "layout_bottom_line">
									<p class="card-text"><small class="text-muted">
										입장권 사용 일자 : ${adminfestivalinfo.entranceTime}<br>
										할인권 사용 일자 : ${adminfestivalinfo.couponUseTime}<br></small>
									</p>
								</div>
								<div class = "layout_bottom_line">
									<p class="card-text"><small class="text-muted">
										금액 : ${adminfestivalinfo.fee}원<br>
										수량 : ${adminfestivalinfo.headCount}개<br>
										총 결제금액 : ${adminfestivalinfo.fee * adminfestivalinfo.headCount}원</small>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
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
  if (betweenTimeDay <= 0) { // 사용 완료
    result = 0;
  } else if (betweenTimeDay > 0) { // 기간 만료
    result = 1;
  } else {
    result = 2;
  } 
  
  

  
  return result; // 결과값 저장
}
    $(".entrance").each(function(){//해당 클래스에 해당하는 반복문
    	var endDateParam = $(this).attr('data-endDate');//매번 값이 변하고 class가 같기 때문에 this로 해서 값을 받아오기
    	var entDateParam = $(this).attr('data-entDate');
    	var cpuDateParam = $(this).attr('data-cpuDate');

    	var result = endToday(endDateParam, entDateParam, cpuDateParam);//받아온 데이터를 함수 돌려 가공한 데이터 받아오기
    	console.log(result)
    	if(result == 0){
    		$(this).append('<input type="button" style="background-color:#F15600; border-color:#F15600;" id="btn-ent" class="btn btn-primary btn-sm" value="입장권" onclick="location.href='+"'<c:url value='/myticket'/>'"+'" />' );

    	} else if(result == 1){


    	} else{
    		 
    	}
    	
    });
	</script>
	
</html>