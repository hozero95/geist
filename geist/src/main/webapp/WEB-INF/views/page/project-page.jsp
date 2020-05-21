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
<script
	src="http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<!-- Bootstrap -->
<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<!-- Data button-->
<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script>
    function showPopupWrite() { window.open("/project/projectWrite", "프로젝트 작성", "width=1200, height=700, left=100, top=50"); }
    function showPopupUpdate() { window.open("/project/projectUpdate", "프로젝트 수정", "width=1200, height=700, left=100, top=50"); }
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
									<h1>
										<sub> 프로젝트</sub>
									</h1>
									<p>
								</div>
								<hr class="Geist-board-hr" />
							</div>
							<!-- table -->
							<div class="page-title-wrapper">
								<div id="foo-table_wrapper" class="">
									<div class="row">
										<div class="col-sm-12">

											<table id="foo-table" class="table table-bordered dataTable"
												role="grid" aria-describedby="foo-table_info">
												<thead>
													<tr role="row">
														<th id="ch-row"></th>
														<th class="sorting" tabindex="0" aria-controls="foo-table"
															rowspan="1" colspan="1"
															aria-label="제목: activate to sort column ascending"
															style="width: 1500px;">프로젝트 번호</th>
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
												<tbody id="table-body">
												</tbody>
											</table>
											<div class="pt-2" style="float: right;">
												<button type="button" class="btn btn-sm dt-button"
													id="proWrite" onclick="showPopupWrite();">작성</button>
												<button type="button" class="btn btn-sm dt-button"
													id="proUpdate" onclick="showPopupUpdate();">수정</button>
												<button type="button" class="btn btn-sm dt-button"
													id="proDelete" onclick="">삭제</button>
											</div>
										</div>
										<div class="table-page">
										
										</div>
										<!-- radioBtn test -->
										<button type="button" id="testBtn">선택</button>
										<div class="col-sm-12" id="test"></div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--js-->
	<script type="text/javascript" src="/resources/js/include.js"></script>
	<script type="text/javascript" src="/resources/js/main.js"></script>
	<script type="text/javascript" src="/resources/js/register.js"></script>
	<script type="text/javascript" src="/resources/js/My-register.js"></script>
	<script>
	
	$(function() {

		var proWrite = $("#proWrite");
		var proUpdate = $("#proUpdate");
		var proDelete = $("#proDelete");
		var tbody = $("#table-body");
		var tpage = $(".table-page");
		
		var proj_no;
		var proj_name;
		var proj_agency;
		var proj_start;
		var proj_end;
		var pageNum = 1;
		

		function projectList(param, callback, error) {
			var page = param.page;
			$.getJSON("/project/projectList/" + pageNum, function(data) {
				if(callback) {
					callback(data);
				}
			}).error(function() {
				console.log("projectList 실패");
			})
		}
		
		
		function projectDelete(proj_no, callback, error) {
			$.ajax({
				type : 'delete',
				url : '/project/projectDelete/' + proj_no,
				success : function(result, status, xhr) {
					console.log("projectDelete");
					if(callback) {
						callback(result);
					}
				},
				error : function() {
					console.log("프로젝트 삭제 실패");
				}
			});
			/*  return {
				projectList : projectList,
				projectDelete : projectDelete
			} */
		};
	
	    
	    function showList(page) {
			projectList({
				"proj_no" : proj_no,
				"proj_name" : proj_name,
				"proj_agency" : proj_agency,
				"proj_start" : proj_start,
				"proj_end" : proj_end,
			}, function(data){
				console.log(data)
				var str = "";
				if(data == null || data.length == 0) {
					return;
				}
				
				for(var i = 0, len = data.length || 0; i < len; i++) {
					
					str += "<tr onmouseover='this.style.backgroundColor=\"#dadada\"' onmouseout='this.style.backgroundColor=\"\"'>";
					str += "<td id='ch-row'><input type='radio' class='radioBtn' name='selected'></td>";
					str += "<td>" + data[i].proj_no + "</td>";
					str += "<td>" + data[i].proj_name + "</td>";
					str += "<td>" + data[i].proj_agency + "</td>";
					str += "<td>" + data[i].proj_start + "</td>";
					str += "<td>" + data[i].proj_end + "</td>";
					str += "</tr>";
				}
				tbody.html(str);
			});
		}
	    
	    function showListPage(count) {
	    	var endNum = Math.ceil(pageNum / 10.0) * 10;
	    	var startNum = endNum-9;
	    	var prev = startNum != 1;
	    	var next = false;
	    	
	    	if(endNum * 10 >= count) {
	    		endNum = Math.ceil(count / 10.0);
	    	}
	    	if(endNum * 10 < count) {
	    		next = true;
	    	}
	    	
	    	var str = "<ul>";
	    	if(prev) {
	    		str += "<li><a href '" + (startNum -1) + "'>Prev</a></li>";
	    	}
	    	for(var i = startNum; i <= endNum; i++) {
	    		var linkStart = pageNum != i ? "<a href='" + i + "'>'" : "";
	    		var linkEnd = pageNum != i ? "</a>" : "";
	    		str += "<li>" + linkStart + i + linkEnd + "</li>";
	    	}
	    	if(next) {
	    		str += "<li><a href='" + (endNum + 1) + "'>Next</a></li>";
	    	}
	    	str =+ "</ul>";
	    	
	    	tpage.html(str);
	    }
	    
	    tpage.on("click", "li a", function(e) {
	    	e.preventDefault();
	    	
	    	var targetPageNum = $(this).attr("href");
	    	pageNum = targetPageNum;
	    	
	    	showList(pageNum);
	    });
	    
	    
	    
	    

		proDelete.click(function() {
			var chk = $("tr").children().find("input[name=selected]").is(':checked');
			var checked = $("input[name=selected]:checked");
			var proj_no;
			
			checked.each(function(i) {
				var tr = checked.parent().parent().eq(i);
	   			var td = tr.children();				
			
				if(chk) {
					proj_no = Number(td.eq(1).text());
					console.log(typeof proj_no);
				}
			})
			projectDelete(proj_no, function(result){
				console.log(result)
				console.log('projectDelete() 호출!' + proj_no);
				location.reload();
			});
		})
		
		
	    
		proUpdate.on("click", function() {
			
		})
		
			    
	    showList(1);
		
		
		
		
		// 체크된 테이블 행의 값 가져오기
  		$('#testBtn').click(function() {
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
		
	});

    </script>
	</body>
</html>
