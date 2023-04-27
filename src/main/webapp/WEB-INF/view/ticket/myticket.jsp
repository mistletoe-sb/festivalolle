<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>입장권</title>
		<script type="text/javascript" src="https://jsonip.com"></script>
		<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	</head>
	<body class="bg-gradient-primary-mobile">
		<%@ include file="../mobilemenu/mobiletop.jsp"%>		
		<%-- 내용 삽입 --%>
		<div class="myticket_form">
			<div id="ticket_carousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<c:forEach var="item" items="${myticketList}" varStatus="page">			
						<c:choose>
							<c:when test='${page.index == 0}'>
								<button type="button" data-bs-target="#ticket_carousel" data-bs-slide-to="${page.index}" class="active" aria-current="true"></button>
							</c:when>
							<c:otherwise>
								<button type="button" data-bs-target="#ticket_carousel" data-bs-slide-to="${page.index}"></button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="carousel-inner">
					<c:forEach var="ticket" items="${myticketList}" varStatus="stat">
						<c:choose>
							<c:when test='${stat.index == 0}'>
								<div class="carousel-item active" data-bs-interval="900000">
									<div class="d-block w-100">
										<!-- 이미지카드 -->
										<div class="festival_card_container">
											<div class="card">
												<div class="ratio">
													<img src="<c:url value='/resources/img/mobile/empty_image.png'/>" class="card-img-top" alt="${ticket.festivalCode}">
												</div>
												<div class="card-body myticket-content">
													<div class="myticket ticket_title" onclick="location.href='<c:url value="/festival/info?festivalCode=${ticket.festivalCode}"/>'">
														<div class="myticket festival_title">							
															<p class="card-text">${ticket.title}</p>
														</div>	
														<div class="myticket ticket_sub">							
															<p class="card-text">유효기간: ${ticket.startDate} ~ ${ticket.endDate}</p>
															<p class="card-text ticket_sub_txt">입장인원: ${ticket.headCount} 명</p>
															<p class="card-text ticket_sub_txt">할인쿠폰: ${ticket.couponAmount} 원</p>
														</div>
														<input class="ticketCode" type="hidden" value="${ticket.ticketCode}"/>
													</div>
													<div class="myticket qr-content">							
														<div class="qrdesc">
															입장권 및 쿠폰을 사용하시려면
															시설 담당자에게 QR 코드를 
															보여주세요.														
														</div>
														<div class="qr-container">
															<a class="generateQR1">클릭해서 <br>QR 보기</a>
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
								<div class="carousel-item" data-bs-interval="900000">
									<div class="d-block w-100">
										<div class="festival_card_container">
											<div class="card">
												<div class="ratio">
													<img src="<c:url value='/resources/img/mobile/empty_image.png'/>" class="card-img-top" alt="${ticket.festivalCode}">
												</div>
												<div class="card-body myticket-content">
													<div class="myticket ticket_title">
														<div class="myticket festival_title" onclick="location.href='<c:url value="/festival/info?festivalCode=${ticket.festivalCode}"/>'">					
															<p class="card-text">${ticket.title}</p>
														</div>
														<div class="myticket ticket_sub">							
															<p class="card-text">유효기간: ${ticket.startDate} ~ ${ticket.endDate}</p>
															<p class="card-text ticket_sub_txt">입장인원: ${ticket.headCount} 명</p>
															<p class="card-text ticket_sub_txt">할인쿠폰: ${ticket.couponAmount} 원</p>
														</div>
														<input class="ticketCode" type="hidden" value="${ticket.ticketCode}"/>
													</div>
													<div class="myticket qr-content">							
														<div class="qrdesc">
															입장권 및 쿠폰을 사용하시려면
															시설 담당자에게 QR 코드를 
															보여주세요.
														</div>
														<div class="qr-container">														
															<a class="generateQR1">클릭해서 <br>QR 보기</a>
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
<!-- <script type="text/javascript" src="http://jsonip.appspot.com/?callback=getip"></script> -->
		<script type="text/javascript">
			/*function getip(data){
				alert(data.ip);
			}
			
			//document.write( ip() );
			*/
		</script>
		<script type="text/javascript">
			/*$(function() {
				$.getJSON("https://api.ipify.org?format=jsonp&callback=?",
					function(json) {
						//document.write(json.ip);
						console.log(json.ip);			
					}
				);
			});*/
		</script>
	
		<!-- <script>
		$.getJSON('http://jsonip.appspot.com/?callback=?',
	        function(data){
	          console.log(data.ip);
	        });
		</script>
		
		<script type="application/javascript">
		  $(function() {
		    $.getJSON("https://api.ipify.org?format=jsonp&callback=?",
		      function(json) {
		        //document.write("My public IP address is: ", json.ip);
		        console.log("My public IP address is: ", json.ip);
		      }
		    );
		  });
		</script> -->
	
		<script>
		
		var RTCPeerConnection = window.RTCPeerConnection || window.webkitRTCPeerConnection || window.mozRTCPeerConnection || window.msRTCPeerConnection;
		
		var rtc = new RTCPeerConnection();
		
		rtc.createDataChannel("TEMP");
	
		rtc.onicecandidate = function(iceevent) {
		  if( iceevent && iceevent.candidate && iceevent.candidate.candidate ) {
		    var r = /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/;
		    var t = iceevent.candidate.candidate.match(r);
				
				console.log(t); //IP
		  }
		}
		
		rtc.createOffer().then(offer=>rtc.setLocalDescription(offer));
		</script>

		<script>
		
		
		
		
		$(document).on('click', '.generateQR1', function(){
			
			
			$(this).hide();
			
			var memberCode = ${loginUser.memberCode}
			var ticketCode = $('.ticketCode').val();
			console.log(memberCode);
			console.log(ticketCode);
			
			/*var url = "http://43.201.139.11:8080/festivalolle/qrreader/";*/
			/*var url = $('#rootContext').val() +"/qrreader/";*/
			var url = "http://43.201.139.11:8080" + $('#rootContext').val() +"/qrreader/";
			
			
			
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
					var html = '<div class="qrResult"><img class="qr" src="data:image:jpg;base64,';
						html += data;
						html += '"></div>';
					//$(this).next().empty().append(html);
					$(this).after(html);					
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