<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Geist</title>
	<!-- main Css-->
    <link href="/resources/css/document.css" rel="stylesheet" />
    <link href="/resources/css/main.css" rel="stylesheet" />
    <!-- Data table-->
    <script src = "http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" ></script>
    <!-- Bootstrap -->
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Data button-->
    <script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
            
<script>
    function showPopup() { window.open("./page/admin-Mypage-page.jsp", "회원정보", "width=900, height=700, left=100, top=50"); }
</script>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	
	    String contentPage=request.getParameter("contentPage");
	    if(contentPage==null)
	        contentPage="main.jsp";
	    
	    String admin_nav = (String)session.getAttribute("adminOk");
		if(admin_nav == null) {
			admin_nav="admin-nav.jsp";
		}else{
			admin_nav="admin-nav.jsp";
		}
	%>
	
	<div id="header">
		<jsp:include page="topnav.jsp" />
	</div>
    <div id="side">
    	<jsp:include page="<%=admin_nav%>" />
    </div>
    
	<div class="app-container fixed-sidebar fixed-header closed-sidebar">
        <!-- Lower -->
        <div class="app-main">
            <!-- Main page -->
            <div class="app-main-outer">
                    <!-- Main button page -->
                    <div class="app-main_inner">
                        <div class="container-fluid">
                            <div class="container">
                                <!-- Title -->
	                            <div class="app-page-title">
	                                <div class="page-title-heading">
	                                    <i class="pe-7s-master-inverse"></i>
	                                    <h2><sub>회원조회</sub></h2>
	                                    <p>
	                                </div>
	                                <hr class="Geist-board-hr">
	                            </div>
                                <!-- table -->
                                <div class="page-title-wrapper">
                                    <div id="foo-table_wrapper" class="">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table id="foo-table" class="table table-bordered dataTable" role="grid"
                                                    aria-describedby="foo-table_info">
                                                    <thead>
                                                        <tr role="row">
                                                            <th class="sorting_asc" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-sort="ascending" aria-label="이름: activate to sort column descending"
                                                                style="width: 80px;">이름</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-sort="ascending" aria-label="부서명: activate to sort column descending"
                                                                style="width: 300px;">부서명</th>
                                                            <th class="sorting" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-label="직책: activate to sort column ascending" style="width: 300px;">직책</th>
                                                            <th class="sorting" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-label="회사소속: activate to sort column ascending" style="width: 400px;">회사소속</th>
                                                                <th class="sorting_asc" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-sort="ascending" aria-label="조회: activate to sort column descending"
                                                                style="width: 100px;">조회</th>
                                                           
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr role="row" class="odd">
                                                            <td class="sorting_1">홍길동</td>
                                                            <td>기획팀</td>
                                                            <td>사원</td>
                                                            <td>Geist</td>
                                                            <td>
                                                                <button type="button" class="btn btn-sm dt-button" id="btnRetrieve" onclick="showPopup();">조회</button>                                                         
                                                            </td>
                                                        </tr>
                                                        <tr role="row" class="even">
                                                            <td class="sorting_1">김을룡</td>
                                                            <td>기획팀</td>
                                                            <td>사원</td>
                                                            <td>Geist</td>
                                                            <td>
                                                                <button type="button" class="btn btn-sm dt-button" id="btnRetrieve" onclick="showPopup();">조회</button>                                                         
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>

	<div id="footer">
    	<jsp:include page="footer.jsp" />
    </div>
    
    <!--js-->
    <script type="text/javascript" src="/resources/js/include.js"></script>
    <script type="text/javascript" src="/resources/js/main.js"></script>
    <script type="text/javascript" src="/resources/js/register.js"></script>
    <script type="text/javascript" src="/resources/js/My-register.js"></script>


    <script>
	   $(document).ready(function() {
	        $('#foo-table').DataTable( {
	            "info" :  false,
	            lengthChange: false,
	        });
	        
            $('div').removeClass('form-inline');
            $('div.app-page-title').css('margin','0px 0px 0px');
            $('div.app-page-title').css('padding','50px 0px 30px 0px');
	    });
    </script>
</body>
</html>