<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Geist</title>
<link href="/resources/css/document.css" rel="stylesheet" />
<link href="/resources/css/main.css" rel="stylesheet" />
<!-- 기안일을 위해 필요한 스크립트 -->
<script type="text/javascript" src="/resources/js/date.js"></script>
</head>
<body>
	<input type="hidden" name="login_no" value="${member.emp_no}">
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
                                    <i class="pe-7s-ink-inverse"></i>
                                    <h1><sub>전자결재</sub></h1>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr">
                            </div>
                            <!-- table -->
                            <div class="document">
                                <form name="approval-doc" action="#">
                                    <br>
                                    <h3 style="text-align:center;">주간업무 보고서</h3>
                                    <hr><br>
                                    <div class="info">
                                        <table class="task-doc">
                                            <tr>
                                                <td><span class="table-text">부서</span></td>
                                                <td><span class="dept-name">총무팀</span></td>
                                            </tr>
                                            <tr>
                                                <td><span class="table-text">직급</span></td>
                                                <td><span class="emp-position">과장</span></td>
                                            </tr>
                                            <tr>
                                                <td><span class="table-text">작성자명</span></td>
                                                <td><span class="emp-name">김호영</span></td>
                                            </tr>
                                            <tr>
                                                <td><span class="table-text">기안일</span></td>
                                                <td><span class="app-date">2020-04-09</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
													<label for="position1"><input type="checkbox" name="management" value="대리" id="position1">&nbsp;대리</label>&nbsp;&nbsp;&nbsp;													 
													<label for="position2"><input type="checkbox" name="management" value="과장" id="position2">&nbsp;과장</label>&nbsp;&nbsp; &nbsp; 
													<label for="position3"><input type="checkbox" name="management" value="차장" id="position3">&nbsp;차장</label>&nbsp;&nbsp; &nbsp; 
													<label for="position4"><input type="checkbox" name="management" value="부장" id="position4">&nbsp;부장</label>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 
												</td>
                                            </tr>
                                        </table>

                                        <table class="sign">
                                            <thead>
                                                <td>대 리</td>
                                                <td>과 장</td>
                                                <td>차 장</td>
                                                <td>부 장</td>
                                            </thead>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <hr>


                                    <label for="report" style="display: block;">
                                        <h5 style="text-align:center;" >주간 업무 보고 내용</h5>
                                    </label>
                                    <div class="report-area">
                                        <textarea id="report" name="report" placeholder="내용을 적어주세요."></textarea>
                                    </div>

                                    <div class="btn-row">
                                        <input type="button" class="btn-write" value="작성" onclick="alert('작성 되었습니다')">
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript" src="/resources/js/approvalRequest.js"></script>
</body>
</html>