<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <script src="http://code.jquery.com/jquery-latest.js"></script>


    <title>관리자</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <!-- <link href="resources/css/sb-admin-2.min.css" rel="stylesheet"> -->
    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
    
    
    

    
    
    
    
    
    
	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <!-- <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button> -->
                    
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    	<h1 class="h3 mb-0 text-gray-800">축 제 올 래</h1>
                    </div>


                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">                                    	
                        
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginAdmin.organizationName}&nbsp &nbsp |&nbsp &nbsp ${loginAdmin.name}</span>
                                <!-- <img class="img-profile rounded-circle"
                                    src="resources/img/undraw_profile.svg"> -->
                                <img class="img-profile rounded-circle"
                                    src="<c:url value='/resources/img/undraw_profile.svg'/>"> 
                                  
                                
                                    
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    계정 정보
                                </a>
                                
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->



				<div class="container-fluid">    
				<!-- DataTales Example -->
				
					<div class="card shadow mb-4">
						<div class="card-header py-3">
					        <h6 class="m-0 font-weight-bold text-primary">검표원 입장 확인</h6>
					    </div>
					</div>
					<div class="card shadow mb-4">
					    <div class="card-header py-3">
					        <h6 class="m-0 font-weight-bold text-primary">${ticketInfo.title}</h6>
					    </div>
					    <div class="card-body">
					        <div class="table-responsive">
					            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					                <tbody> 
									   <tr>
										   <td>성명</td>
										   <td>${ticketInfo.name}</td>
									   </tr>
									   <tr>
										   <td>입장 인원</td>
										   <td>${ticketInfo.headCount}</td>
									   </tr>
									   <tr>
										   <td>휴대폰</td>
										   <td>${ticketInfo.mobile}</td>
									   </tr>
					                </tbody>
					            </table>
					            <div id="entrance_div">
						            <a href="#" class="btn btn-primary btn-icon-split" id="entrance_button">
					                    <span class="icon text-white-50">
					                        <i class="fas fa-check"></i>
					                    </span>
					                    <span class="text">입장 확인</span>
					                </a>
				                </div>
				                <div id="complete_div" hidden="true">
					                <a href="#" class="btn btn-secondary btn-icon-split">
					                    <span class="icon text-white-50">
					                        <i class="fas fa-check"></i>
					                    </span>
					                    <span class="text">사용 완료</span>
					                </a>
				                </div>
					            	            
					        </div>
					    </div>
					</div>			
				</div>
			</div>
		</div>
	</div>

<script>


	$('#entrance_button').on('click', function(){		
		var ticketCode = ${ticketInfo.ticketCode}	
		$.ajax({
			url: "<c:url value='/ticket/entrance'/>",
			type: "post",
			data: {ticketCode, ticketCode},
			success: function(data){
				console.log(data);
				if(data == 'ok'){
					$('#entrance_div').attr('hidden', true);
					$('#complete_div').attr('hidden', false);					
									
				} else {
					alert("사용 불가");
				}//end if
			},//end success
			error:function(){
				alert("사용 실패");
			}		
		})//end ajax		
	})
	


</script>



<%@ include file="../adminfooter.jsp" %>