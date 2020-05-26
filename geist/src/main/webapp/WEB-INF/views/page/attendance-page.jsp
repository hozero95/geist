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
                                  		<button type="button" class="com-btn" id="attend">출근</button>
                                  		<button type="button" class="com-btn" id="getoff">퇴근</button>
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
    <script type="text/javascript" src="/resources/js/register.js"></script>
    <script type="text/javascript" src="/resources/js/My-register.js"></script>
    <script src = "http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" ></script>
    <!--js-->
    <script>
		
    	var attendanceService = (function() {
    		
    		function getList(param, callback, error) {
	    		var emp_no = param.emp_no;
		        $.getJSON("/attendance/" + emp_no + ".json", function(data) {
		        	if(callback) {
		        		callback(data);
		        	}
		        }).fail(function(xhr, status, err) {
		        	if(error) {
		        		error();
		        	}
		        });
	    	}
    		
    		function check(param, callback, error){
    			var emp_no = param.emp_no;
    			$.getJSON("/attendance/check/" + emp_no + ".json", function(data){
    				if(callback){
    					callback(data);
    				}
    			}).fail(function(xhr, status, err){
    				if(error){
    					error();
    				}
    			});
    		}
    		
    		function attendanceOn(param, callback, error) {
    			$.ajax({
    				type : 'post',
    				url : '/attendance/on',
    				data : JSON.stringify(param),
    				contentType : "application/json; charset=utf-8",
    				success : function(result, status, xhr) {
    					if(callback) {
    						callback(result);
    					}
    				},
    				error : function(xhr, status, err) {
    					if(error) {
    						error(err);
    					}
    				}
    			});
    		}
    		
    		function attendanceOff(param, callback, error) {
    			$.ajax({
    				type : 'put',
    				url : '/attendance/off',
    				data : JSON.stringify(param),
    				contentType : "application/json; charset=utf-8",
    				success : function(result, status, xhr) {
    					if(callback) {
    						callback(result);
    					}
    				},
    				error : function(xhr, status, err) {
    					if(error) {
    						error(err);
    					}
    				}
    			});
    		}
		    
    		return {
    			getList : getList,
    			check : check,
    			attendanceOn : attendanceOn,
    			attendanceOff : attendanceOff
    		};
    		
    	})();
    	
    	$(function() {
    		var emp_no = $("input[name='login_no']").val();
		    var att_on = $("#attend");
		    var att_off = $("#getoff");
		    var tbody = $(".table-body");
		    
		    console.log(emp_no);
		    
		    showCheck(emp_no);
		    showList(emp_no);
		    
		    function showCheck(emp_no) {
		    	attendanceService.check({
		    		emp_no : emp_no
		    	}, function(data) {
		    		if(data.checkOn == 1) {
		    			att_on.prop("disabled", true);
		    			att_on.addClass("disabled");
		    		} else {
		    			att_on.prop("disabled", false);
		    		}
		    		
		    		if(data.checkOff == 1) {
		    			att_off.prop("disabled", false);
		    		} else {
		    			att_off.prop("disabled", true);
		    			att_off.addClass("disabled");
		    			
		    		}
		    	});
		    }
		    
		    function showList(emp_no) {
		    	attendanceService.getList({
		    		emp_no : emp_no
		    	}, function(data) {
		    		var str = "";
		    		if(data == null || data.length == 0) {
		    			return;
		    		}
		    		for(var i = 0, len = data.length || 0; i < len; i++) {
		    			var status = "";
		    			switch(data[i].att_status) {
		    			case 1:
		    				status = "출근";
		    				break;
		    			case 2:
		    				status = "퇴근";
		    				break;
		    			case 3:
		    				status = "알 수 없음";
		    			}
		    			str += "<tr>";
						str += "<td>" + data[i].cal_date + "</td>";
						str += "<td>" + data[i].att_on + "</td>";
						str += "<td>" + data[i].att_off + "</td>";
						str += "<td>" + status + "</td>";
						str += "</tr>";
		    		}
		    		tbody.html(str);
		    	})
		    }
		    
		    att_on.on("click", function(e){
				attendanceService.attendanceOn({
					emp_no : emp_no
				}, function(result){
					alert(result);
					showCheck(emp_no);
					showList(emp_no);
				});
			});
			
			att_off.on("click", function(e){
				attendanceService.attendanceOff({
					emp_no : emp_no
				}, function(result){
					alert(result);
					showCheck(emp_no);
					showList(emp_no);
				});
			});

    	});
    </script>
</body>
</html>





