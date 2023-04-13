<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../mobilemenu/mobileinclude.jsp"%>
		<title>이용권</title>
		<script type="text/javascript" src="https://jsonip.com"></script>
		
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		 <!-- Custom fonts for this template-->
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
	
	<script>
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
	</script>
	
	<script>
	// 브라우저마다 prefix가 달라 아래와 같이 처리한다.
	var RTCPeerConnection = window.RTCPeerConnection || window.webkitRTCPeerConnection || window.mozRTCPeerConnection || window.msRTCPeerConnection;
	// RTCPeerConnection 객체 생성 
	var rtc = new RTCPeerConnection();
	// 임의의 이름으로 채널 생성
	rtc.createDataChannel("TEMP");
	// 이벤트 핸들러 설정, ice 후보가 감지 되었을때 호출됩니다.
	// 원래는 이곳에서 해당 candidate를 현재 커넥션에 연결해야 하나, ip를 알아내는 것이 목적이기 때문에 별다른 행동을 하지 않습니다.
	rtc.onicecandidate = function(iceevent) {
	  if( iceevent && iceevent.candidate && iceevent.candidate.candidate ) {
	    var r = /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/;
	    var t = iceevent.candidate.candidate.match(r);
			//console.log(t[0]); //IP
			console.log(t); //IP
	  }
	}
	//createOffer를 호출하면 연결하고자 하는 SDP가 생성됩니다. createOffer()의 결과로 offer가 생성되는데 이를 다시 setLocalDescription를 통해 설정하면
	//로컬의 엔드포인트가 생성이 완료됩니다. 이렇게 생성된 Description을 연결하고자 하는 원격지에 전달해야 하나 이역시 해당 예제에서는 필요가 없습니다.
	//setLocalDescription후에 onicecandidate가 호출됩니다.
	rtc.createOffer().then(offer=>rtc.setLocalDescription(offer));
	</script>



		
		
		<script>
		
		/*
		function qrSubmit() {			
			$('.qrurl').val("http://192.168.230.199:8080/festivalolle/qrreader");	
		}
		*/
		
		
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