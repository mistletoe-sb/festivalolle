<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>이용권</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.css" />
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/resources/css/mobile_member.css'/>"/>
		<script src="https://cdn.jsdelivr.net/npm/swiper@9.1.1/swiper-bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/mobile.js'/>"></script>
		 <!-- Custom fonts for this template-->
	    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">

	    <!-- Custom styles for this template-->
	    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet" rel="stylesheet">
			

		
	</head>
	<body class="bg-gradient-primary-mobile">
		<%@ include file="../mobilemenu/mobiletop.jsp"%>		
		
		<%-- 내용 삽입 --%>
		
		<div class="myticket_form">
		<div id="recommend_carousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<c:forEach var="item" items="${myticketList}" varStatus="page">			
					<c:choose>
						<c:when test='${page.index == 0}'>
							<button type="button" data-bs-target="#recommend_carousel" data-bs-slide-to="${page.index}" class="active" aria-current="true"></button>
						</c:when>
						<c:otherwise>
							<button type="button" data-bs-target="#recommend_carousel" data-bs-slide-to="${page.index}"></button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<div class="carousel-inner">
				<c:forEach var="ticket" items="${myticketList}" varStatus="stat">
					<c:set var="img" value="${myticketImages[stat.index]}"/>
					<c:choose>
						<c:when test='${stat.index == 0}'>
							<div class="carousel-item active" data-bs-interval="8000">
								<div class="d-block w-100">

									<!-- 이미지카드 -->
									<div class="festival_card_container">
										<div class="card">
											<div class="ratio">
												<c:choose>								
													<c:when test='${img != null}'>																		  	
														<img src="data:image:jpg;base64,${img}" class="card-img-top" alt="loading failed">				  	
													</c:when>
													<c:otherwise>																	  	
														<img src="<c:url value='/resources/img/festest3.jpg'/>" class="card-img-top" alt="no image">				  	
													</c:otherwise>
												</c:choose>
											</div>
											<div class="card-body myticket-content">
												<div class="myticket">							
													<p class="card-text">
														${ticket.title} 
													</p>
												</div>	
												<div class="myticket">							
													<p class="card-text">
														유효기간: ${ticket.startDate} ~ ${ticket.endDate}
													</p>
												</div>
												<div>
													<hr width="300" color="EEEEEE" noshade />
												</div>
												<div class="myticket qr-content">							
													
													<div class="qrdesc">
														<br>
														입장권 및 쿠폰을 사용하시려면
														시설 담당자에게 QR 코드를 
														보여주세요.														
													</div>
													<div class="qr-container">
														<a class="generateQR1"><br>클릭해서 <br>QR 보기</a>
														<div class="qrResult">
														</div>
													</div>													
												</div>									
												
											</div>
										</div>
									</div>
									<!-- end 이미지카드 -->
					
									
									
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="carousel-item" data-bs-interval="8000">
								<div class="d-block w-100">
									
									
									
									<div class="festival_card_container">
										<div class="card">
											<div class="ratio">
												<c:choose>								
													<c:when test='${img != null}'>																		  	
														<img src="data:image:jpg;base64,${img}" class="card-img-top" alt="loading failed">				  	
													</c:when>
													<c:otherwise>																	  	
														<img src="<c:url value='/resources/img/festest3.jpg'/>" class="card-img-top" alt="no image">				  	
													</c:otherwise>
												</c:choose>
											</div>
											<div class="card-body">
												<div class="myticket">							
													<p class="card-text">
														${ticket.title} 
													</p>
												</div>	
												<div class="myticket">							
													<p class="card-text">
														유효기간: ${ticket.startDate} ~ ${ticket.endDate}
													</p>
												</div>	
												<input class="ticketCode" type="hidden" value="${ticket.ticketCode}" />
												<div>
													<hr width="300" color="EEEEEE" noshade />
												</div>
												<div class="myticket qr-content">							
													
													<div class="qrdesc">
														<br>
														입장권 및 쿠폰을 사용하시려면
														시설 담당자에게 QR 코드를 
														보여주세요.
													</div>
													<div class="qr-container">														
														<a class="generateQR1"><br>클릭해서 <br>QR 보기</a>
														<div class="qrResult">
														</div>
													</div>													
												</div>
												
											</div>	
												
										</div>
									</div>
								
								
								</div>

									
							</div>
												
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>

		
		
		
		<script>
		
		
		function qrSubmit() {			
			$('.qrurl').val("http://192.168.230.199:8080/festivalolle/qrreader");	
		}

		
		
		$(document).on('click', '.generateQR1', function(){
			
			
			$(this).hide();
			
			var memberCode = ${loginUser.memberCode}
			var ticketCode = $('.ticketCode').val();
			console.log(memberCode);
			console.log(ticketCode);
			
			var url = "http://192.168.230.199:8080/festivalolle/qrreader/";
				url += memberCode + "/";
				url += ticketCode;
				
			
			console.log(url);
			
			$.ajax({
				url: "<c:url value='/qr1'/>",
				type: "get",
				data: {url: url},
				success: function(data){
					console.log(url);
					console.log(data);
					//$('.qrResult').val(data);
					var html = '<img class="qr" src="data:image:jpg;base64,';
						html += data;
						html += '">';
					
					$(this).next().empty().append(html);
					
				
					
					
				}.bind(this),//end success
				error:function(){
					alert("기관 코드 없음");
				}//end error														
			})//end 기관코드ajax			
		})
		
		
		
		
		
			
		
		
		</script>
		
		
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>