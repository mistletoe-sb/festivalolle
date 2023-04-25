<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>구매 내역</title>
		<style>
			    #preview-image {
			  		object-fit: cover;
					width: 100%;
					height: 100%;
					}

				.layout_bottom_line {
					margin-bottom: 1rem;
    				padding-bottom: 1rem;
				}
				p {
					color: #777;
				}
				.btn-sm {
					--bs-btn-padding-y: 0.15rem;
    				--bs-btn-padding-x: 0.7rem;
				}
				.mypageimg2{
					width:1rem;
					margin-right : 0.5rem;
				}
				
		</style>
	</head>
	<body>
		<%@ include file="../mobilemenu/mobiletop.jsp"%>
		<div class="container-fluid review_card_container card-body" style="margin-top : 0.5rem;">
				<div class="card mb-3" style="max-width: 33.75rem; ">
					<div class="row g-0">
						<div class="col-md-4">
							<c:choose>
								<c:when test="${img == '1'}">
										<img id="preview-image" class="img-thumbnail" src="<c:url value='/resources/img/null_png.png'/>">
								</c:when>
								<c:otherwise>
										<img id="preview-image"  class="img-thumbnail" src="data:image:jpg;base64,${img}"/ aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-md-8">
							<div class="card-body card-horizontal-content">
								<div class = "layout_bottom_line">
									<div id="title-btn" style ="width:100%;">
										<div style ="float:left;">
											<h5  class="card-title" style="cursor: pointer;" ><b>${adminfestivalinfo.title}</b></h5>
										</div>
										<div class="icon" style="float:right;">
											<img class="mypageimg2" src="<c:url value='/resources/img/icon/arrow.png'/>" alt="ticket">
										</div>
										
									</div>
									<div style ="clear:both;">
										<p class="card-text" style ="font-size:0.9rem">유효기간 : ${adminfestivalinfo.startDate} ~ ${adminfestivalinfo.endDate}</p>
									</div>
								</div>
								<div class = "layout_bottom_line">
									<h6 id="title-btn" class="card-title"><b>구매 정보</b></h6>
									<p class="card-text" style ="font-size:0.9rem">
										구매 일자 : ${adminfestivalinfo.purchaseTime}<br>
										구매자 이름 : ${adminfestivalinfo.name}<br>
										전화번호 : ${adminfestivalinfo.mobile}
									</p>
								</div>
								<div class = "layout_bottom_line">
									<div class="entrance" style ="float:right;" data-endDate="${adminfestivalinfo.endDate}" data-entDate="${adminfestivalinfo.entranceTime}" data-cpuDate="${adminfestivalinfo.couponUseTime}">
										</div>
									<h6 id="title-btn" class="card-title"><b>입장권 정보</b></h6>
									
									<p class="card-text" style ="font-size:0.9rem">
										입장권 사용 일자 : ${adminfestivalinfo.entranceTime}<br>
										쿠폰 사용 일자 : ${adminfestivalinfo.couponUseTime}<br>
									</p>
								</div>
								<div >
									<h6 id="title-btn" class="card-title"><b>결제 정보</b></h6>
									<p class="card-text" style ="font-size:0.9rem">
										금액 : ${adminfestivalinfo.fee}원<br>
										수량 : ${adminfestivalinfo.headCount}개<br>
										총 결제금액 : ${adminfestivalinfo.fee * adminfestivalinfo.headCount}원
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
  if (((entDateParam != "미사용") && (cpuDateParam != "미사용"))) { // 사용 완료
	    result = 0;
	  } else if (((entDateParam == "미사용") || (cpuDateParam == "미사용")) && (betweenTimeDay >= 0)) { // 기간 만료
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
    	if(result == 2){
    		$(this).append('<input type="button" style="background-color:#F15600; border-color:#F15600;" id="btn-ent" class="btn btn-primary btn-sm" value="입장권" onclick="location.href='+"'<c:url value='/myticket'/>'"+'" />' );

    	} else if(result == 1){


    	} else{
    		 
    	}
    	
    });
    
    /* 비공개 유무 */
    $('#title-btn').on("click",function() {

        var status = ${adminfestivalinfo.status};
        if(status == 0) {
        	swal('비공개 페이지', "비공개 처리된 축제입니다."+status, 'info');
        	
        } else {
        	location.href = "<c:url value='/festival/info?festivalCode=${adminfestivalinfo.festivalCode}'/>";
        }
        
    });
	</script>
	
</html>