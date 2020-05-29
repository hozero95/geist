<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Geist</title>
<link href="/resources/css/main.css" rel="stylesheet" />
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script src = "http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" ></script>
<style>
	input {
		border : none;
		width : 100%;
		height : 30px;
	}
	#modal {
		display : none;
		position : relative;
		width : 100%;
		height : 100%;
		z-index : 1;
	}
	#modal button {
		display : inline-block;
		width : 50px;
		height : 30px;
		margin-left : calc(100% - 55px);
		border : none;
		border-radius : 5px;
		color : white;
		background-color : #2ac1bc;
		box-shadow : 3px 3px 2px #aaaaaa;
	}
	#modal .modal_content {
		width : 260px;
		margin : 100px auto;
		padding : 20px 10px;
		background : #fff;
		border : 1px solid #666;
	}
	#modal .modal_layer {
		position : fixed;
		top : 0;
		left : 0;
		width : 100%;
		height : 100%;
		background : rgba(0, 0, 0, 0.5);
		z-index : -1;
	}
</style>
</head>
<body>
	
	<div class="app-container fixed-sidebar fixed-header closed-sidebar">
        <div class="app-main">
            <!-- Main page -->
            <div class="app-main-outer">
                <!-- Main button page -->
                <div id="modal">
					<div class="modal_content">
						<h5>내용을 모두 작성해주세요!</h5>
						<br />
						<button type="button" id="modal_close_btn">닫기</button>
					</div>
					<div class="modal_layer"></div>
				</div>
                <div class="app-main_inner">
                    <div class="container-fluid">
                        <div class="container">
                            <!-- Title -->
                            <div class="app-page-title" style="margin: 0px; padding: 50px 0px 20px;">
                                <div class="page-title-heading">
                                    <i class="pe-7s-project-inverse"></i>
                                    <h2>프로젝트 </h2>
                                    <p />
                                </div>
                                <hr class="Geist-board-hr" />
                            </div>
                            <!-- Write -->
                            <div name="projectWrite">
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
	                                                <td><div class="in-put"><input type="text" id="proj_name" maxlength="30" required /></div></td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">주체기관</th>
	                                                <td><div class="in-put"><input type="text" id="proj_agency" maxlength="30"  required /></div></td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">시작일</th>
	                                                <td>
	                                                <div class="in-put">
	                                                <input type="text" id="proj_start" maxlength="10" required onkeyup="inputDateNumber(this);" />
	                                                </div>
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">종료일</th>
	                                                <td>
	                                                <div class="in-put">
	                                                <input type="text" id="proj_end" maxlength="10" required onkeyup="inputDateNumber(this);" /></div></td>
	                                            </tr>
                                            </tbody>
                                        </table>
                                        <div class="pt-2" style="float: right;">
                                            <button type="button" class="btn btn-sm dt-button" id="proWrite" name="proWrite" style="box-shadow : 3px 3px 2px #aaaaaa">작성</button>
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
    
    <script type="text/javascript" src="/resources/js/projectWrite.js"> </script>
</body>
</html>