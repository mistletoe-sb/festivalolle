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
	<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon" sizes="16x16">
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

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/admin/main'/>">
                 <div class="sidebar-brand-icon rotate-n-15">
                 <!-- <div class="sidebar-brand-icon">  -->
                    <!-- <i class="fas fa-laugh-wink"></i> -->
                    
                    <i class="fas fa-car-side"></i>
                    
                    
                </div> 
                <div class="sidebar-brand-text mx-3">축 제 올 래</div>
            </a>
 
            <!-- Divider -->
            <hr class="sidebar-divider my-0">


            <!-- Nav Item - tables -->
            <li class="nav-item">
                <!-- <a class="nav-link" href="charts.html"> -->
                
                <!-- <a class="nav-link" href="/admin/adminhome.jsp"> -->
                <a class="nav-link" href="<c:url value='/admin/festivallist'/>">
                    <i class="fas fa-fw fa-table" id="festialList"></i>
                    
                    <span>축제 관리</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/admin/ticket/list'/>">
                    <i class="fas fa-fw fa-table" id="festialList"></i>
                    <span>티켓 구매자 관리</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/admin/review/list'/>">
                    <i class="fas fa-fw fa-table"></i>
                    <span>사용자 리뷰 관리</span></a>
            </li>
            
            <!-- <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-table"></i>
                    <span>계정 정보</span></a>
            </li> -->

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>


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
                                <!-- <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    계정 정보
                                </a> -->
                                
                                <!-- <div class="dropdown-divider"></div> -->
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
