<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Geist</title>
<link href="${pageContext.request.contextPath}/resources/css/document.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" />
</head>
<body>
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
                                                    <input type="checkbox" id="assistant" name="assistant" value="대리" disabled="disabled">&nbsp;대리&nbsp;&nbsp; &nbsp;
			                                        <input type="checkbox" id="manager" name="manager" value="과장" disabled="disabled">&nbsp;과장&nbsp; &nbsp;&nbsp;
			                                        <input type="checkbox" id="deputy" name="deputy" value="차장" disabled="disabled">&nbsp;차장&nbsp; &nbsp;&nbsp;
			                                        <input type="checkbox" id="general" name="general" value="부장" disabled="disabled">&nbsp;부장&nbsp; &nbsp;&nbsp;
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
                                                <td id="assistant">&nbsp;</td>
                                                <td id="manager">&nbsp;</td>
                                                <td id="deputy">&nbsp;</td>
                                                <td id="general">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <hr>


                                    <label for="report" style="display: block;">
                                        <h5 style="text-align:center;" >주간 업무 보고 내용</h5>
                                    </label>
                                    <div class="report-area">
                                        <textarea id="report" name="report" readonly>보고 내용입니다 </textarea>
                                    </div>

                                    <div class="pt-2" style="float: right;">
                                    		<button type="button" class="btn btn-sm dt-button" id="appSearchBtn" onclick="location.replace('/approvalSearch');" style="display='none'">목록</button>
                                           	<button type="button" class="btn btn-sm dt-button" id="approve" onclick="alert('승인 되었습니다.')">승인</button>
                                           	<button type="button" class="btn btn-sm dt-button" id="return" onclick="alert('반려 되었습니다.')">반려</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/approvalAdmitDetail.js"></script>
</body>
</html>