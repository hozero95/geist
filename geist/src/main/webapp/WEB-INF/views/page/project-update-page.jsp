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
                                    <h2>프로젝트 </h2>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr">
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
	                                                									value="프로젝트1" required /></div></td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">주체기관</th>
	                                                <td><div class="in-put"><input type="text" id="proj_agency" name="projectAgency" maxlength="30"
	                                                									value="주체기관1" required /></div></td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">시작일</th>
	                                                <td><div class="in-put"><input type="text" id="proj_start" name="projectStart" maxlength="10"
	                                                									value="2020-03-20" required onkeyup="inputDateNumber(this)" oninput="noKorean(this)" /></div></td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">종료일</th>
	                                                <td><div class="in-put"><input type="text" id="proj_end" name="projectEnd" maxlength="10"
	                                                									value="2020-04-20" required onkeyup="inputDateNumber(this)" oninput="noKorean(this)" /></div></td>
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
    $( document ).ready( function() {
    	$(document).on('click', '#proUpdate', function(e){
    		e.preventDefault();
    		parent.close();
    		window.close();
    		self.close();
	    });
    });
    
    var proj_no = 1;
 	// var proj_no = ?
 	var dept_no = 1;
 	// var dept_no = ?
 	
 	
    
    var projectUpdateService = (function() {
    	
    	function getUpdateList(param, callback, error) {
    		
    		var porj_no = 1;
    		
    		$.getJSON("/projcet/projectUpdate/" + proj_no), function(data) {
    			callback(data);
    			console.log(data);
    		}
    		
    	}
    	
    	
    	function projcetUpdate(param, callback, error) {
    		
    		$.ajax({
    			type : 'get',
    			url : '/project/projectUpdate' + proj_no,
    			data : JSON.stringify(param),
    			contentType : "application/json; charset=utf-8",
    			success : function() {
    				console.log("성공 시 호출 됨!");
    				if(callback) {
    					callback();
    				}
    			}
    			
    		});
    	}
	 })();
    
    
    $(function() {
    	var btnUpdate = $("#proUpdate");
    	var dept_no = $("#dept_no");
    	var proj_name = $("#proj_name");
    	var proj_agency = $("#proj_agency");
    	var proj_start = $("#proj_start");
    	var proj_end = $("#proj_end");
    	
    	projectUpdateService.getUpdateList({
    		
    		
    		
    	})
    	
    	projcetUpdateService.projectUpdate({
    		proj_no : proj_no, 
    		proj_name : proj_name,
    		proj_agency : porj_agency,
    		proj_start : proj_start,
    		proj_end : proj_end
    	}, function(data) {
    		
    	})
    	
    	
    })
    
    
    
    
    
    
    // input#input-number : 자동 "-" 삽입
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
	// input#input-number : 한글 입력 불가능
	function noKorean(obj) {
		obj.value = obj.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
	}
    
    </script>
</body>
</html>