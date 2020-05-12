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
        <!-- Lower -->
        <div class="app-main">
            <!-- Main page -->
            <div class="app-main-outer">
                <!-- Main button page -->
                <div class="app-main_inner">
                    <div class="container-fluid">
                        <div class="container">
                            <!-- Title -->
                            <div class="app-page-title" style="margin: 0px; padding: 50px 0px 30px;">
                                <div class="page-title-heading">
                                    <i class="pe-7s-document-inverse"></i>
                                    <h1><sub>사내공지</sub></h1>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr">
                            </div>
                            <!-- Write -->
                            <article>
                                <div class="container" role="main">
                                    <div class="rounded">
                                        <div class="board-title">${#.NOTI_TITLE}</div>
                                        <div class="board-info-box">
                                            <span class="board-author">${#.NOTI_NO}</span>
                                            <span class="board-date">${#.NOTI_DATE}</span>
                                        </div>
                                        <hr>
                                        <div class="board-content">${#.NOTI_CONTENT}</div>
                                    </div>
                                    <hr>
                                    <div class="pt-2" style="float: right;">
                                        <button type="button" class="btn btn-sm dt-button" id="btnUpdate">수정</button>
                                        <button type="button" class="btn btn-sm dt-button" id="btnDelete">삭제</button>
                                        <button type="button" class="btn btn-sm dt-button" id="btnList">목록</button>
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
        $(document).on('click', '#btnUpdate', function(e){
        	e.preventDefault();
        	location.href="index.jsp?contentPage=page/document-page-modify.jsp";
        });

        $(document).on('click', '#btnList', function(e){
        	e.preventDefault();
        	location.href="index.jsp?contentPage=page/document-page.jsp";
        });
        $(document).on('click', '#btnDelete', function(e){
        	var returnValue = confirm('작성글을 삭제하시겠습니까?')
			if(returnValue=true){
				alert("작성글이 정상적으로 삭제되었습니다.")
				self.location.href ="${path}/#/.do" //삭제메소드 불러오기
			}else{ 
				alert("취소되었습니다.") };

        });
    </script>
</body>
</html>