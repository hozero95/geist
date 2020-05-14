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
                            <div class="app-page-title" style="margin: 0px; padding: 50px 0px 20px;">
                                <div class="page-title-heading">
                                    <i class="pe-7s-user-inverse"></i>
                                    <h2><sub>마이페이지</sub></h2>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr">
                            </div>
                            <!-- Write -->
                            <article>
                                <div class="container" role="main">
                                    <h4 class="m-0 p-2">정보조회</h4>
                                    <div class="rounded">
                                        <div class="board-info-box">
                                            <h1 class="m-0">${#.emp_name} &nbsp; ${#.emp_position}</h1>
                                            <h6 class="m-0 pt-3 pb-4">Geist회사 > ${#.dept_no}</h6>
                                        </div>

                                        <table class="type09">
                                            <thead>
                                                <th scope="row">아이디</th>
                                                <td>${#.EMP_ID}</td>
                                            </thead>
                                            <tbody class="table-body">
                                            <tr>
                                                <th scope="row">사원번호</th>
                                                <td>${#.EMP_NO}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">직책</th>
                                                <td>${#.EMP_POSITION}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">급여</th>
                                                <td>${#.EMP_SAL}</td>
                                           	</tr>
                                            <tr>
                                                <th scope="row">입사일</th>
                                                <td>${#.EMP_DATE}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">사내연락처</th>
                                                <td>${#.EMP_TEL}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">개인연락처</th>
                                                <td>${#.EMP_PHONE}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">생년월일</th>
                                                <td>${#.EMP_BIRTH}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">주소</th>
                                                <td>${#.EMP_ADDRESS}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <div class="pt-2" style="float: right;">
                                            <button type="button" class="btn btn-sm dt-button" id="My-btnUpdate" >수정</button>
                                        </div>
                                    </div>

                                    
                                </div>
                            </article>

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
    
    $( document ).ready( function() {
    	$(document).on('click', '#My-btnUpdate', function(e){
    		e.preventDefault();
        	location.href="index.jsp?contentPage=page/Mypage-page-write.jsp";
        	//location.href="index.jsp?contentPage=${path}/#/.do";
	    });
    });
    </script>


</body>
</html>