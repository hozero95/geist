<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Geist</title>
	<!-- main Css-->
    <link href="${pageContext.request.contextPath}/resources/css/document.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Data table-->
    <script src = "http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" ></script>
    <!-- Bootstrap -->
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Data button-->
    <script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
    
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		
	    String contentPage=request.getParameter("contentPage");
	    if(contentPage==null)
	        contentPage="main.jsp";
	    
	    String admin_nav = (String)session.getAttribute("sys");
	    
	  	if(admin_nav == "sys") {
	  		admin_nav="admin-nav.jsp";
	  	}else{
	  		admin_nav="nav.jsp";
	  	}
	%>
	
	<div id="header">
		<jsp:include page="topnav.jsp" />
	</div>
    <div id="side">
    	<jsp:include page="<%=admin_nav%>" />
    </div>
    
    <input type="hidden" name="login_no" value="${member.emp_no}">
    
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
                                    <i class="pe-7s-ink-inverse"></i>
                                    <h1><sub>결재조회 </sub></h1>
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
                                                        <th class="sorting_asc" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1" aria-sort="ascending"
                                                            aria-label="조회수: activate to sort column descending"
                                                            style="width: 200px;">요청일</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="제목: activate to sort column ascending"
                                                            style="width: 200px;">결재제목</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="작성날짜: activate to sort column ascending"
                                                            style="width: 200px;">요청자</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="작성날짜: activate to sort column ascending"
                                                            style="width: 100px; background-color: #F5F9FC">최종상태</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="table-body">
                                                </tbody>
                                            </table>
                                            <div class="table-page"></div>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/include.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/approval-search.js"></script>

    <!--js-->
    <script>

		$(document).ready(function() {
			/*
	        $("#foo-table").DataTable({
            // 표시 건수기능 숨기기
            lengthChange: false,
            // 검색 기능 숨기기
            searching: false,
            // 정보 표시 숨기기
            info: false,
        	});
			*/
	            
	        $('div').removeClass('form-inline');
	        $('div.app-page-title').css('margin', '0px 0px 0px');
	        $('div.app-page-title').css('padding', '50px 0px 30px 0px');
	    });
    </script>
</body>
</html>