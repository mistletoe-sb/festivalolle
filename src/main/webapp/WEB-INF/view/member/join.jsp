<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>회원가입</title>
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
		<!--  <div class="container">-->
			

	        <!-- Outer Row -->
	        <!--  <div class="row justify-content-center">-->
	        
	        	
	            <div class="col-xl-10 col-lg-12 col-md-9">	
	            
	                <div class="card o-hidden border-0 my-5 shadow-lg-mobile">
	                    <div class="card-body p-0">		
							<div class="row">
								<div class="col-lg-6">
	                                <div class="p-5">
				
										<form class="user" action="<c:url value='/join'/>" method="post" name="joinfrm">                                                             
											 
											<div class="form-group">
			                                    <input type="text" class="form-control form-control-user" id="join_id"
			                                        placeholder="아이디" size="20" required>
			                                    <label class="ChkLabel" id="idMsg"></label>						
												<input id="id_reg_check" type="hidden" value="false">
												<input id="id_overlap_check" type="hidden" value="false">
			                                </div>
			                                
			                                <div class="form-group">
			                                    <input type="password" class="form-control form-control-user"
		                                            id="join_pw" placeholder="비밀번호" size="16" required>
		                                    	<label class="ChkLabel" id="pwchkMsg"></label>
		                                    	<input id="pw_reg_check" type="hidden" value="false">							
												<input id="pwchk2" type="hidden" value="false">
			                                </div>  
											    											
											<div class="form-group">
												<input type="password" class="form-control form-control-user"
                                           			 id="pwchk" placeholder="비밀번호 확인" size="16" required>
                                           		<label class="ChkLabel" id="pwchkMsg2"></label>
											</div> 
											<div class="form-group">
			                                   <input type="text" class="form-control form-control-user" id="register_name"
			                                       placeholder="담당자명" required>
			                               </div>
											<div class="form-group">
			                                    <input type="text" class="form-control form-control-user" id="register_telephone"
			                                        placeholder="연락처" type="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
			                                    <label class="ChkLabel" id="phoneNumber_msg"></label>	
			                                    <input id="phoneNumber_reg_check" type="hidden" value="false">
												<input id="phoneNumber_overlap_check" type="hidden" value="false">	
			                                </div>
			                                <div class="form-group">
			                                    <input type="date" class="form-control form-control-user" id="register_email"
			                                        placeholder="생일" required>
			                                    <label class="ChkLabel" id="emailMsg"></label>						
												<input id="email_reg_check" type="hidden" value="false">
												<input id="email_overlap_check" type="hidden" value="false">
			                                </div>
			                                
											
											
											
											
											
											
											
											
											
											
											
											
																						
											<input type="submit" id="memberJoin" class="btn btn-primary btn-user btn-block btn-primary-mobile" value="회원가입" />                       											
										
										
										
										
										
										
										
										
										
										
										</form>
										
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!--  </div>-->
		<!--  </div>-->
		
		
		
		
		
		<%-- 내용 끝 --%>
		<%@ include file="../mobilemenu/mobilebottom.jsp"%>
	</body>
</html>