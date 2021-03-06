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
    <!-- .buttoncard css 수정 --> 
    <link href="${pageContext.request.contextPath}/resources/css/mainEdit.css" rel="stylesheet" />
    <!-- Bootstrap -->
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
</head>

<body>

	
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
					</div>
					<!-- Main button page -->
					<div class="app-main-inner">
					<div class="add_card">
							<div class="buttoncard" onclick="ChangeMpage(2)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<a href="#">
									<img src="${pageContext.request.contextPath}/resources/img/main_ui/document.png">
									<h5>공지사항</h5>
								</a>
							</div>
							<div class="buttoncard" onclick="ChangeMpage(3)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<a href="#" id="Project-nav"><img
										src="${pageContext.request.contextPath}/resources/img/main_ui/project.png">
									<h5>프로젝트</h5>
								</a>
							</div>
							<div class="buttoncard" onclick="ChangeMpage(4)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<a href="#" id="Project-nav"><img src="${pageContext.request.contextPath}/resources/img/main_ui/ink.png">
									<h5>전자결재</h5>
								</a>
							</div>
							<div class="buttoncard" onclick="ChangeMpage(7)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<a href="#"><img src="${pageContext.request.contextPath}/resources/img/main_ui/card.png">
									<h5>인사/근태</h5>
								</a>
							</div>
							<div class="buttoncard" onclick="ChangeMpage(8)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<a href="address"><img src="${pageContext.request.contextPath}/resources/img/main_ui/book.png">
									<h5>주소록</h5>
								</a>
							</div>
							<div class="buttoncard" onclick="ChangeMpage(9)">
								<div class="card-header"
									style="height: 5px; background-color: #2ac1bc;"></div>
								<a href="#"><img src="${pageContext.request.contextPath}/resources/img/main_ui/user.png">
									<h5>마이페이지</h5>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>