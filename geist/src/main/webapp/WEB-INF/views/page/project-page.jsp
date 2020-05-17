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
    function showPopupWrite() { window.open("./page/project-write-page.jsp", "프로젝트 작성", "width=1200, height=700, left=100, top=50"); }
    function showPopupUpdate() { window.open("./page/project-update-page.jsp", "프로젝트 수정", "width=1200, height=700, left=100, top=50"); }
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
        <div class="app-main">
            <!-- Side navbar -->

            <!-- Main page -->
            <div class="app-main-outer">
                <!-- Main button page -->
                <div class="app-main_inner">
                    <div class="container-fluid">
                        <div class="container">
                            <!-- Title -->
                            <div class="app-page-title">
                                <div class="page-title-heading">
                                    <i class="pe-7s-project-inverse"></i>
                                    <h1><sub> 프로젝트</sub></h1>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr">
                            </div>
                            <!-- table -->
                            <div class="page-title-wrapper">
                                <div id="foo-table_wrapper" class="">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table id="foo-table" class="table table-bordered dataTable" role="grid" aria-describedby="foo-table_info">
                                                <thead>
                                                    <tr role="row">
                                                    	<th id="ch-row"></th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="제목: activate to sort column ascending"
                                                            style="width: 1500px;">프로젝트 명</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="작성날짜: activate to sort column ascending"
                                                            style="width: 600px;">주체기관</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="작성날짜: activate to sort column ascending"
                                                            style="width: 200px;">시작일</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="작성날짜: activate to sort column ascending"
                                                            style="width: 200px;">종료일</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                    <tr role="row" class="odd" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트1</td>
                                                        <td>주체기관1</td>
                                                        <td>2020/03/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                    <tr role="row" class="even" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트2</td>
                                                        <td>주체기관2</td>
                                                        <td>2020/03/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                    <tr role="row" class="odd" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트3</td>
                                                        <td>주체기관3</td>
                                                        <td>2020/03/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                    <tr role="row" class="even" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트4</td>
                                                        <td>주체기관4</td>
                                                        <td>2020/03/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                    <tr role="row" class="odd" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트5</td>
                                                        <td>주체기관5</td>
                                                        <td>2020/03/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                    <tr role="row" class="even" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트6</td>
                                                        <td>주체기관6</td>
                                                        <td>2020/03/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                    <tr role="row" class="odd" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트7</td>
                                                        <td>주체기관7</td>
                                                        <td>2020/02/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                    <tr role="row" class="even" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트8</td>
                                                        <td>주체기관8</td>
                                                        <td>2020/01/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                    <tr role="row" class="odd" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트9</td>
                                                        <td>주체기관9</td>
                                                        <td>2020/02/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                    <tr role="row" class="even" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트10</td>
                                                        <td>주체기관10</td>
                                                        <td>2020/03/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                    <tr role="row" class="even" onmouseover="this.style.backgroundColor='#dadada'" onmouseout="this.style.backgroundColor=''">
                                                    	<td id="ch-row"><input type="radio" class="radioBtn" name="selected" /></td>
                                                        <td>프로젝트11</td>
                                                        <td>주체기관11</td>
                                                        <td>2020/05/10</td>
                                                        <td>2020/04/10</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="pt-2" style="float: right;">
	                                           	<button type="button" class="btn btn-sm dt-button" id="proWrite" onclick="showPopupWrite();">작성 </button>
	                                           	<button type="button" class="btn btn-sm dt-button" id="proUpdate" onclick="showPopupUpdate();">수정 </button>
	                                           	<button type="button" class="btn btn-sm dt-button" id="proDelete" onclick="">삭제</button>
                                    		</div>
                                        </div>
                                        <!-- radioBtn test -->
                                   		<!-- <button type="button" id="testBtn">선택</button>
                                   		<div class="col-sm-12" id="test"></div> -->
                                        
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
    
    <!--js-->
    <script>
		$(document).ready(function() {
   	        $("#foo-table").DataTable({
               lengthChange: false,
               info: false,
			   pageLength: 5,
               bPaginate: true,
               processing: true,
               ordering: true,
               serverSide: false,
               searching: true,
               ajax : {
                   "url":"#",
                   "type":"POST",
                   "dataSrc": function (d) {
                       	   var data = d.data;
                       	   return data;
                   }
               },
               columns : [
                   {data: "프로젝트 명"},
                   {data: "주최기관"},
                   {data: "시작일"},
                   {data: "종료일"}
               ]
           	});
               
            $('div').removeClass('form-inline');
            $('div.app-page-title').css('margin', '0px 0px 0px');
            $('div.app-page-title').css('padding', '50px 0px 30px 0px');
       	});

	/*
		// 체크된 테이블 행의 값 가져오기
   		$("#testBtn").click(function() {
   			var tdArr = new Array();
   			var checked = $("input[name=selected]:checked");
   			
   			// 체크된 라디오버튼의 값
   			checked.each(function(i) {
	   			var tr = checked.parent().parent().eq(i);
	   			var td = tr.children();
	   			
	   			var projectName = td.eq(1).text();
	   			var agency = td.eq(2).text();
	   			var startDay = td.eq(3).text();
	   			var endDay = td.eq(4).text();
	   			
	   			tdArr.push(projectName);
	   			tdArr.push(agency);
	   			tdArr.push(startDay);
	   			tdArr.push(endDay);
   			});
   			
   			$("#test").html("체크된 라디오버튼 행의 값 : " + tdArr);
   			
   		});
	*/
    </script>
</body>
</html>