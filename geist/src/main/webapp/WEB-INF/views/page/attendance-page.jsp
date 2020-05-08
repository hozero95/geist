<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
</style>
<title>Geist</title>
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
                                 	<form name="commute-btn" action="#">
                                  		<button type="button" class="com-btn" name="attend">출근</button>
                                  		<button type="button" class="com-btn" name="getoff">퇴근</button>
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
                                                <tbody>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>08:35:38</td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>09:26:39</td>
                                                        <td>18:25:22</td>
                                                        <td>지각</td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>08:47:55</td>
                                                        <td>19:04:15</td>
                                                        <td>퇴근</td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>08:35:38</td>
                                                        <td>18:56:36</td>
                                                        <td>퇴근</td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>08:35:38</td>
                                                        <td>18:18:18</td>
                                                        <td>퇴근</td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>08:21:34</td>
                                                        <td>21:18:18</td>
                                                        <td>야근</td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>08:59:46</td>
                                                        <td>18:45:21</td>
                                                        <td>퇴근</td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>10:21:55</td>
                                                        <td>19:30:21</td>
                                                        <td>지각</td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>08:40:38</td>
                                                        <td>19:10:23</td>
                                                        <td>퇴근</td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>08:35:38</td>
                                                        <td>13:20:12</td>
                                                        <td>조퇴</td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>08:35:38</td>
                                                        <td>18:55:29</td>
                                                        <td>퇴근</td>
                                                    </tr>
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

    <!--js-->
    <script>
		$(document).ready(function() {
	        $("#foo-table").DataTable({
            // 표시 건수기능 숨기기
            lengthChange: false,
            // 검색 기능 숨기기
            searching: false,
            // 정보 표시 숨기기
            info: false,
         	// 페이징 기능 숨기기
        	paging: false
	        });
	            
	        $('div').removeClass('form-inline');
	        $('div.app-page-title').css('margin', '0px 0px 0px');
	        $('div.app-page-title').css('padding', '50px 0px 30px 0px');
	    });
    </script>
</body>
</html>