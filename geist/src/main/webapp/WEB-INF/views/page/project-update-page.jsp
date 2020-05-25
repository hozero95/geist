<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Geist</title>
<link href="/resources/css/main.css" rel="stylesheet" />
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script src="http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" ></script>
<style>
	input {
		border : none;
		width : 100%;
		height : 30px;
	}
</style>
</head>
<body>
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
                                    <i class="pe-7s-project-inverse"></i>
                                    <h2>프로젝트</h2>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr" />
                            </div>
                            <!-- Write -->
                            <form name="projectUpdate" action="#">
                                <div class="container" role="main">
                                    <h4 class="m-0 p-2">프로젝트 작성 </h4>
                                    <div class="rounded">

                                        <table class="type09">
                                            <thead>
                                                <th scope="row">부서번호</th>
                                                <td><div class="in-put"><input type="text" id="dept_no" maxlength="10" required /></div></td>
                                            </thead>
                                            <tbody>
	                                            <tr>
	                                                <th scope="row">프로젝트명</th>
	                                                <td><div class="in-put"><input type="text"id="proj_name" name="projectName" maxlength="30" 
	                                                									value="" required /></div></td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">주체기관</th>
	                                                <td><div class="in-put"><input type="text" id="proj_agency" name="projectAgency" maxlength="30"
	                                                									value="" required /></div></td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">시작일</th>
	                                                <td><div class="in-put"><input type="text" id="proj_start" name="projectStart" maxlength="10"
	                                                									value="" required onkeyup="inputDateNumber(this)" oninput="noKorean(this)" /></div></td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">종료일</th>
	                                                <td><div class="in-put"><input type="text" id="proj_end" name="projectEnd" maxlength="10"
	                                                									value="" required onkeyup="inputDateNumber(this)" oninput="noKorean(this)" /></div></td>
	                                            </tr>
                                            </tbody>
                                        </table>
                                        <div class="pt-2" style="float: right;">
                                            <button type="button" class="btn btn-sm dt-button" id="proUpdate">저장</button>
                                        </div>
                                    </div>

                                    
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    
    $(function() {
    	
    	var btnUpdate = $("#proUpdate");
    	
    	function getUpdateList(callback) {
    		$.getJSON("/projcet/projectUpdate/"), function(data) {
    			callback(data);
    			console.log(data);
    		}.error(function() {
    			console.log("수정데이터 받아오기 실패!");
    		})
    	}
    	
    	
    	function projcetUpdate(param, callback, error) {
    		$.ajax({
    			type : 'get',
    			url : '/project/projectUpdate/' + proj_no,
    			data : JSON.stringify(param),
    			contentType : "application/json; charset=utf-8",
    			success : function() {
    				console.log("수정 성공!");
    				if(callback) {
    					callback();
    				}
    			},
    			error : function() {
    				console.log("수정 실패!");
    			}
    		});
    	}

    	
    	function showUpdateList() {
    		getUpdateList(function() {
    			$("#dept_no").val(data.dept_no);
    			$("#proj_name").val(data.proj_name);
    			$("#proj_agency").val(data.proj_agency);
    			$("#proj_start").val(data.proj_start);
    			$("#proj_end").val(data.proj_end);
    		});
    	}
    	
    	btnUpdate.click(function() {
	    	var dept_no = $("#dept_no").val();
	    	var proj_name = $("#proj_name").val();
	    	var proj_agency = $("#proj_agency").val();
	    	var proj_start = $("#proj_start").val();
	    	var proj_end = $("#proj_end").val();
			
	    	console.log("수정버튼 클릭시 호출!");
   	   		console.log(dept_no);
   	   		console.log(proj_name);
   	   		console.log(proj_agency);
   	   		console.log(proj_start);
   	   		console.log(proj_end);
	    	
   	   		projcetUpdate({
   	   			"dept_no" : dept_no,
				"proj_name" : proj_name,
				"proj_agency" : proj_agency,
				"proj_start" : proj_start,
				"proj_end" : proj_end 	
   	   		}, function(e) {
   	   			console.log("콜백함수 호출됨 !");
				window.close();
	    		window.opener.location.reload();
   	   		})
    	})
    });
    
    
    
    
    // 자동 "-" 삽입
	function inputDateNumber(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var date = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 6) {
			date += number.substr(0, 4);
			date += "-";
			date += number.substr(4);
		} else if (number.length < 8) {
			date += number.substr(0, 4);
			date += "-";
			date += number.substr(4, 2);
			date += "-";
			date += number.substr(6);
		} else {
			date += number.substr(0, 4);
			date += "-";
			date += number.substr(4, 2);
			date += "-";
			date += number.substr(6);
		}
		obj.value = date;
	}
    
	// 한글 입력 불가능
	function noKorean(obj) {
		obj.value = obj.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
	}
    
    </script>
</body>
</html>