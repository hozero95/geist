<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Geist</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" />
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
                                    <p />
                                </div>
                                <hr class="Geist-board-hr" />
                            </div>
                            <!-- Write -->
                            <form name="projectUpdate">
                                <div class="container" role="main">
                                    <h4 class="m-0 p-2">프로젝트 수정</h4>
                                    <div class="rounded">

                                        <table class="type09">
                                            <thead>
                                                <th scope="row">프로젝트 번호</th>
                                                <td><div class="in-put"><input type="text" id="proj_no" maxlength="10" readonly /></div></td>
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
                                            <button type="button" class="btn btn-sm dt-button" id="proUpdate" style="box-shadow : 3px 3px 2px #aaaaaa">저장</button>
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
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/projectUpdate.js"></script>
</body>
</html>