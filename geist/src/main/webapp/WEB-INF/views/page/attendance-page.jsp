<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Geist</title>
	<!-- main Css-->
    <link href="/resources/css/document.css" rel="stylesheet" />
    <link href="/resources/css/main.css" rel="stylesheet" />
    <!-- Data table-->
    <script src = "http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" ></script>
    <!-- Bootstrap -->
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- Data button-->
    <script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<style>
	.btn-row {
		position : relative;
		margin-left : -50%;
		width : 100%;
		margin-bottom : 30px;
	}
	.com-btn {
	    border-radius: 4px;
	    color:white; 
	    background-color: var(--teal);	
		width : 80px;
		height : 50px;
		font-size : 25px;
		margin-left : 30px;
	}
	.disabled {
		 border-radius: 4px;
	    color:white; 
	    background-color: #dadada;	
		width : 80px;
		height : 50px;
		font-size : 25px;
		margin-left : 30px;
	}
</style>
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
                                    <i class="pe-7s-card-inverse"></i>
                                    <h1><sub>근태현황</sub></h1>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr">
                            </div>
                            <!-- table -->
                            <div class="btn-row">
                                 	<form name="commute-btn">
                                 		<input type="hidden" name="login_no" value="${member.emp_no}" />
                                  		<button type="button" class="com-btn att_onBtn" id="att_onBtn">출근</button>
                                  		<button type="button" class="com-btn att_offBtn" id="att_offBtn">퇴근</button>
                                	</form>
                                </div>
                            <div class="page-title-wrapper">
                                <div id="foo-table_wrapper" class=""> 
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table id="foo-table" class="table table-bordered dataTable" role="grid"
                                                aria-describedby="foo-table_info">
                                                <thead>
                                                    <tr role="row">
                                                        <th class="sorting_asc" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1" aria-sort="ascending"
                                                            aria-label="조회수: activate to sort column descending"
                                                            style="width: 200px;">날 짜</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="제목: activate to sort column ascending"
                                                            style="width: 200px;">출근시간</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="작성날짜: activate to sort column ascending"
                                                            style="width: 200px;">퇴근시간</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="작성날짜: activate to sort column ascending"
                                                            style="width: 200px;">상태</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="table-body">
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
    <script type="text/javascript" src="/resources/js/attendance-page.js"></script>
    <script src = "http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" ></script>
    <!--js-->
    <script>
    
    </script>
</body>
</html>





