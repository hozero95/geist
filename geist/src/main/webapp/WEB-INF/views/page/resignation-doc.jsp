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
</head>
<body>
	<input type="hidden" name="login_no" value="${member.emp_no}">
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
                                    <i class="pe-7s-ink-inverse"></i>
                                    <h1><sub>전자결재</sub></h1>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr">
                            </div>
                            <!-- table -->
                            <div class="document">
                                <form name="resignation-doc" action="#">
                                    <br>
                                    <h3 style="text-align:center;">사직 신청서</h3>
                                    <hr><br>
                                    <div class="info">
                                        <table class="task-doc">
                                            <tr>
                                                <td><span class="table-text">부서</span></td>
                                                <td><span class="dept-name">개발팀</span></td>
                                            </tr>
                                            <tr>
                                                <td><span class="table-text">직급</span></td>
                                                <td><span class="emp-position">차장</span></td>
                                            </tr>
                                            <tr>
                                                <td><span class="table-text">작성자명</span></td>
                                                <td><span class="emp-name">김현선</span></td>
                                            </tr>
                                            <tr>
                                                <td><span class="table-text">기안일</span></td>
                                                <td><span class="app-date">2020-04-10</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <input type="checkbox" name="management" value="대리">&nbsp;대리&nbsp;
                                                    &nbsp; &nbsp;
                                                    <input type="checkbox" name="management" value="과장">&nbsp;과장&nbsp; &nbsp;
                                                    &nbsp;
                                                    <input type="checkbox" name="management" value="차장">&nbsp;차장&nbsp; &nbsp;
                                                    &nbsp;
                                                    <input type="checkbox" name="management" value="부장">&nbsp;부장&nbsp; &nbsp;
                                                    &nbsp;
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

                                    <div id="date-row">
                                        <h4 style="margin-right : 30px;">사직 희망일</h4><br>
                                        <div class="yy">
                                            <span class="ps-box">
                                                <input type="text" id="year" class="int" name="year" placeholder="년(4자)"
                                                    maxlength="4" />
                                            </span>
                                        </div>
                                        <div class="mm">
                                            <span class="ps-box">
                                                <select id="mm" class="sel">
                                                    <option value="월">&nbsp; 월</option>
                                                    <option value="01">&nbsp; 1</option>
                                                    <option value="02">&nbsp; 2</option>
                                                    <option value="03">&nbsp; 3</option>
                                                    <option value="04">&nbsp; 4</option>
                                                    <option value="05">&nbsp; 5</option>
                                                    <option value="06">&nbsp; 6</option>
                                                    <option value="07">&nbsp; 7</option>
                                                    <option value="08">&nbsp; 8</option>
                                                    <option value="09">&nbsp; 9</option>
                                                    <option value="10">&nbsp; 10</option>
                                                    <option value="11">&nbsp; 11</option>
                                                    <option value="12">&nbsp; 12</option>
                                                </select>
                                            </span>
                                        </div>
                                        <div class="dd">
                                            <span class="ps-box">
                                                <input type="text" id="dd" class="int" name="dd" placeholder="일"
                                                    mexlength="2" />
                                            </span>
                                        </div>

                                    </div>
                                    <div class="text">
                                        <h4>사직사유</h4>
                                        <input type="text" id="reason" placeholder="사유를 간단히 적어주세요" maxlength="100">
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