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
				<div class="inner_row">
					<!-- calender -->
					<div class="app-calender">
							<div class="my-calendar clearfix">
							  <div class="clicked-date">
								<div class="cal-day"></div>
								<div class="cal-date"></div>
								<div class="ctr-box clearfix">
								  <button type="button" title="prev" class="btn-cal prev">
								  </button>
								  <span class="cal-month"></span>
								  <span class="cal-year"></span>
								  <button type="button" title="next" class="btn-cal next">
								  </button>
								</div>
							  </div>
							  <div class="calendar-box">
								<table class="cal-table">
								  <thead>
									<tr>
									  <th>S</th>
									  <th>M</th>
									  <th>T</th>
									  <th>W</th>
									  <th>T</th>
									  <th>F</th>
									  <th>S</th>
									</tr>
								  </thead>
								  <tbody class="cal-body"></tbody>
								</table>
							  </div>
						<!-- // .my-calendar -->
						</div>
						<div class="app-calender-memo">
							<ul>
								<li>내용</li>
							</ul>
						</div>
					</div>
					<!-- Main button page -->
					<div class="app-main-inner">
						<div class="add_card">
							<div class="buttoncard" onclick="ChangeMpage(2)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<span><a href="#">
									<img src="/resources/img/main_ui/document.png"></a>
									<h5>공지사항</h5>
								</span>
							</div>
							<div class="buttoncard" onclick="ChangeMpage(3)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<span> <a href="#" id="Project-nav"><img
										src="/resources/img/main_ui/project.png"></a>
									<h5>프로젝트</h5>
								</span>
							</div>
							<div class="buttoncard" onclick="ChangeMpage(4)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<span> <a href="approvalRequest" id="Project-nav"><img src="/resources/img/main_ui/ink.png"></a>
									<h5>전자결재</h5>
								</span>
							</div>
							<div class="buttoncard" onclick="ChangeMpage(7)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<span> <a href="#"><img src="/resources/img/main_ui/card.png"></a>
									<h5>인사/근태</h5>
								</span>
							</div>
							<div class="buttoncard" onclick="ChangeMpage(8)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<span> <a href="address"><img src="/resources/img/main_ui/book.png"></a>
									<h5>주소록</h5>
								</span>
							</div>
							<div class="buttoncard" onclick="ChangeMpage(9)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<span> <a href="#"><img src="/resources/img/main_ui/user.png"></a>
									<h5>마이페이지</h5>
								</span>
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
	<script type="text/javascript" src="/resources/js/calender.js"></script>
</body>
</html>