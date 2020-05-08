<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
                                    <i class="pe-7s-ink-inverse"></i>
                                    <h1><sub>결재조회 </sub></h1>
                                    <p>
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
                                                        <th class="sorting_asc" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1" aria-sort="ascending"
                                                            aria-label="조회수: activate to sort column descending"
                                                            style="width: 200px;">요청일</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="제목: activate to sort column ascending"
                                                            style="width: 200px;">결재제목</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="작성날짜: activate to sort column ascending"
                                                            style="width: 200px;">요청자</th>
                                                        <th class="sorting" tabindex="0" aria-controls="foo-table"
                                                            rowspan="1" colspan="1"
                                                            aria-label="작성날짜: activate to sort column ascending"
                                                            style="width: 200px;">상태</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>주간업무 보고서 </td>
                                                        <td>박동한 </td>
                                                        <td>처리중 </td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>주간업무 보고서 </td>
                                                        <td>박동한 </td>
                                                        <td>처리중 </td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>사직 신청서 </td>
                                                        <td>박동한 </td>
                                                        <td>반려 </td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>휴가 신청서 </td>
                                                        <td>박동한 </td>
                                                        <td>승인 </td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>휴가 신청서 </td>
                                                        <td>김현선 </td>
                                                        <td>승인 </td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>주간업무 보고서 </td>
                                                        <td>홍예진 </td>
                                                        <td>승인 </td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>휴가 신청서 </td>
                                                        <td>홍예진 </td>
                                                        <td>승인 </td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>휴가 신청서</td>
                                                        <td>장혜영 </td>
                                                        <td>승인 </td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>주간업무 보고서 </td>
                                                        <td>이연수 </td>
                                                        <td>승인 </td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>사직 신청서 </td>
                                                        <td>김민수 </td>
                                                        <td>승인 </td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">2020/04/13</td>
                                                        <td>사직 신청서 </td>
                                                        <td>이연수 </td>
                                                        <td>승인 </td>
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
        	});
	            
	        $('div').removeClass('form-inline');
	        $('div.app-page-title').css('margin', '0px 0px 0px');
	        $('div.app-page-title').css('padding', '50px 0px 30px 0px');
	    });
    </script>
</body>
</html>