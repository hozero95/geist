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
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
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
                                        <i class="pe-7s-book-inverse"></i>
                                        <h2><sub>주소록</sub></h2><p>
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
                                                                style="width: 150px;">이름</th>
                                                            <th class="sorting" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-label="이메일: activate to sort column ascending" style="width: 400px;">이메일</th>
                                                            <th class="sorting" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-label="개인연락처: activate to sort column ascending" style="width: 300px;">개인연락처</th>
                                                            <th class="sorting" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                            aria-label="사내연락처: activate to sort column ascending" style="width: 300px;">사내연락처</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-sort="ascending" aria-label="직책: activate to sort column descending"
                                                                style="width: 100px;">직책</th>
                                                            <th class="sorting" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-label="부서명: activate to sort column ascending" style="width: 300px;">부서명</th>
                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody class="table-body">
                                                        <tr role="row" class="odd">
                                                            <td class="sorting_1">1</td>
                                                            <td>홍길동</td>
                                                            <td>abc@naver.com</td>
                                                            <td>010-1234-5678</td>
                                                            <td>사원</td>
                                                            <td>기획팀</td>
                                                            <td>Geist</td>
                                                        </tr>
                                                        <tr role="row" class="even">
                                                            <td class="sorting_1">2</td>
                                                            <td>김을룡</td>
                                                            <td>abc@naver.com</td>
                                                            <td>010-1234-5678</td>
                                                            <td>사원</td>
                                                            <td>제작팀</td>
                                                            <td>Geist</td>
                                                        </tr>
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
    <script type="text/javascript" src="/resources/js/include.js"></script>
    <script type="text/javascript" src="/resources/js/main.js"></script>
    <script type="text/javascript" src="/resources/js/register.js"></script>
    <script type="text/javascript" src="/resources/js/My-register.js"></script>
    
    <script>
    	$(document).ready(function() {
    		/*
        	$("#foo-table").DataTable({
                "info" :  false,
                lengthChange: false,
        	});
    		*/
            $('div').removeClass('form-inline');
            $('div.app-page-title').css('margin','0px 0px 0px');
            $('div.app-page-title').css('padding','50px 0px 30px 0px');
        });
    </script>
    
    <script type="text/javascript">
	var addressService = (function(){
		function getList(param, callback, error){
			var page = param.page;
			console.log("param.page === " + param.page);
			$.getJSON("/address/" + page + ".json", function(data){
				if(callback){
					console.log("data.count === " + data.count)
					console.log("data.page === " + data.page)
					callback(data.count, data.list);
				}
			}).fail(function(xhr, status, err){
				console.log("getList error !!!!!!!!!!")
				if(error){
					error();
				}
			});
		}
		
		function searchTypeList(param, callback, error){
			var page = param.page;
			var type = param.type;
			var keyword = param.keyword;
			console.log("param.page === " + param.page);
			console.log("param.keyword === " + param.keyword);
			$.getJSON("/address/" + page + "/" + type + "/" + keyword + ".json", function(data){
				if(callback){
					console.log("data.count === " + data.count);
					console.log("data.keyword === " + data.keyword);
					callback(data.count, data.list, data.type, data.keyword);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		function searchList(param, callback, error){
			var page = param.page;
			var keyword = param.keyword;
			console.log("param.page === " + param.page);
			console.log("param.keyword === " + param.keyword);
			$.getJSON("/address/" + page + "/" + keyword + ".json", function(data){
				if(callback){
					console.log("data.count === " + data.count);
					console.log("data.keyword === " + data.keyword);
					callback(data.count, data.list, data.keyword);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
			
		//리턴하여 사용할 함수 등록
		return {
			getList : getList,
			searchTypeList : searchTypeList,
			searchList : searchList
		}		
	})();
	
    //json으로 넘어온 데이터 사용
	$(document).ready(function() {
		var searchForm = $("#searchForm");
		var search = $(".search");
		var tbody = $(".table-body");
		var tpage = $(".table-page");
		var main = $(".mainBtn");
		var pageNum = 1;
		
		showList(1);
		
		function showList(page){
			addressService.getList({
				page : page || 1
			}, function(count, list){
				if(page == -1){
					pageNum = Math.ceil(count / 10.0);
					showList(pageNum);
					return;
				}
				var str = "";
				if(list == null || list.length == 0){
					return;
				}
				for(var i = 0, len = list.length || 0; i < len; i++){
					console.log("list === " + list);
					str += "<tr>";
					str += "<td>" + list[i].emp_name + "</td>";
					str += "<td>" + list[i].emp_email + "</td>";
					str += "<td>" + list[i].emp_phone + "</td>";
					str += "<td>" + list[i].emp_tel + "</td>";
					str += "<td>" + list[i].emp_position + "</td>";
					str += "<td>" + list[i].dept_no + "</td>";
					str += "</tr>";
				}
				
				tbody.html(str);
				showListPage(count);
			});
		}
		
		function showSearchTypeList(page, type, keyword){
			addressService.searchTypeList({
				page : page || 1,
				type : type,
				keyword : keyword
			},function(count, list, type, keyword){
				if(page == -1){
					pageNum = Math.ceil(count / 10.0);
					showList(pageNum);
					return;
				}
				var str = "";
				if(list == null || list.length == 0){
					alert("검색 결과가 없습니다.");
					return;
				}
				for(var i = 0, len = list.length || 0; i < len; i++){
					str += "<tr>";
					str += "<td>" + list[i].emp_name + "</td>";
					str += "<td>" + list[i].emp_email + "</td>";
					str += "<td>" + list[i].emp_phone + "</td>";
					str += "<td>" + list[i].emp_tel + "</td>";
					str += "<td>" + list[i].emp_position + "</td>";
					str += "<td>" + list[i].dept_no + "</td>";
					str += "</tr>";
				}
				
				$("select[name='type']").find("option[value='" + type + "']").attr("selected", true);
				$("input[name='keyword']").val(keyword);
				tbody.html(str);
				showListPage(count);
			});
		}
		
		function showSearchList(page, keyword){
			addressService.searchList({
				page : page || 1,
				keyword : keyword
			},function(count, list, keyword){
				if(page == -1){
					pageNum = Math.ceil(count / 10.0);
					showList(pageNum);
					return;
				}
				var str = "";
				if(list == null || list.length == 0){
					alert("검색 결과가 없습니다.");
					return;
				}
				for(var i = 0, len = list.length || 0; i < len; i++){
					str += "<tr>";
					str += "<td>" + list[i].emp_name + "</td>";
					str += "<td>" + list[i].emp_email + "</td>";
					str += "<td>" + list[i].emp_phone + "</td>";
					str += "<td>" + list[i].emp_tel + "</td>";
					str += "<td>" + list[i].emp_position + "</td>";
					str += "<td>" + list[i].dept_no + "</td>";
					str += "</tr>";
				}
				
				$("input[name='keyword']").val(keyword);
				tbody.html(str);
				showListPage(count);
			});
		}
		
		function showListPage(count){
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= count){
				endNum = Math.ceil(count / 10.0);
			}
			if(endNum * 10 < count){
				next = true;
			}
			
			var str = "<ul>";
			if(prev){
				str += "<li><a href='" + (startNum - 1) + "'>Prev</a></li>";
			}
			for(var i = startNum; i <= endNum; i++){
				var linkStart = pageNum != i ? "<a href='" + i + "'>" : "";
				var linkEnd = pageNum != i ? "</a>" : "";
				str += "<li>" + linkStart + i + linkEnd + "</li>";
			}
			if(next){
				str += "<li><a href='" + (endNum + 1) + "'>Next</a></li>";
			}
			str += "</ul>";
			
			tpage.html(str);
		}
		
		search.on("click", function(e){	//엔터로 변경해야 함
			/*
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요.");
				return false;
			}
		*/
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return false;
			}
			
			//var type = $("select[name='type'] option:selected").val();
			var keyword = $("input[name='keyword']").val();
			
			e.preventDefault();
			//showSearchTypeList(1, type, keyword);
			showSearchList(1, keyword);
		});
		
		tpage.on("click", "li a", function(e){
			e.preventDefault();
			
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
		
		main.on("click", function(){
			location.href = "/main";
		});
	});
    
    </script>
</body>
</html>