 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">정말 로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="<c:url value='/admin/logout'/>">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

    <!-- Custom scripts for all pages-->
    <!-- <script src="resources/js/sb-admin-2.min.js"></script> -->
    <script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>

    <!-- Page level plugins -->
    <!-- <script src="resources/vendor/chart.js/Chart.min.js"></script> -->
    <script src="<c:url value='/resources/vendor/chart.js/Chart.min.js'/>"></script>

    <!-- Page level custom scripts -->
    <!-- <script src="resources/js/demo/chart-area-demo.js"></script> -->
    <script src="<c:url value='/resources/js/demo/chart-area-demo.js'/>"></script>
    
    <!-- <script src="resources/js/demo/chart-pie-demo.js"></script> -->
    <script src="<c:url value='/resources/js/demo/chart-pie-demo.js'/>"></script>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	    
    
   <%--  "<c:url value='/resources/js/demo/chart-pie-demo.js'/>"
    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet"> --%>

</body>

</html>