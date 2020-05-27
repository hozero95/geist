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
                                    <i class="pe-7s-ink-inverse"></i>
                                    <h1><sub>결재요청 </sub></h1>
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
                                                            style="width: 489px;">
                                                            <h5>결재 문서 종류</h5>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">
                                                            <a href="javascript:void(0);" onclick="ChangeMpage(12)">
                                                                <img class="img-doc" src="/resources/img/ui2/document.png" style="width:19px"> 주간업무 보고서
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">
                                                            <a href="javascript:void(0);" onclick="ChangeMpage(13)">
                                                                <img class="img-doc" src="/resources/img/ui2/document.png" style="width:19px"> 휴가 신청서
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">
                                                            <a href="javascript:void(0);" onclick="ChangeMpage(14)">
                                                                <img class="img-doc" src="/resources/img/ui2/document.png" style="width:19px"> 사직 신청서
                                                            </a>
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