<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Geist</title>
<script>
    function showPopup() { window.open("./page/admin-approve-page-write.jsp", "회원정보", "width=900, height=700, left=100, top=50"); }
</script>
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
                                        <i class="pe-7s-master-inverse"></i>
                                        <h2><sub>가입승인</sub></h2><p>
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
                                                        	<th class="sorting" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-label="회사소속: activate to sort column ascending" style="width: 400px;">사원번호</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-sort="ascending" aria-label="이름: activate to sort column descending"
                                                                style="width: 80px;">이름</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-sort="ascending" aria-label="부서명: activate to sort column descending"
                                                                style="width: 300px;">부서명</th>
                                                            <th class="sorting" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-label="직책: activate to sort column ascending" style="width: 300px;">직책</th>
                                                            <th class="sorting_asc" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-sort="ascending" aria-label="조회: activate to sort column descending"
                                                                style="width: 200px;text-align: center;">조회</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr role="row" class="odd">
                                                            <td class="sorting_1">12345</td>
                                                            <td>홍길동</td>
                                                            <td>기획팀</td>
                                                            <td>사원</td>
                                                            <td>
                                                                <button type="button" class="btn btn-sm dt-button" style="text-align: center;" onclick="showPopup();">조회</button>                                                         
                                                            </td>
                                                        </tr>
                                                        <tr role="row" class="even">
                                                            <td class="sorting_1">12346</td>
                                                            <td>김을룡</td>
                                                            <td>제작팀</td>
                                                            <td>사원</td>                                                            
                                                            <td>
                                                                <button type="button" class="btn btn-sm dt-button" style="text-align: center;" onclick="showPopup();">조회</button>                                                         
                                                            </td>                                                      
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


    <script>

	    $(document).ready(function() {
        	$("#foo-table").DataTable({
                "info" :  false,
                lengthChange: false,
            });
            $('div').removeClass('form-inline');
            $('div.app-page-title').css('margin','0px 0px 0px');
            $('div.app-page-title').css('padding','50px 0px 30px 0px');
        });
    </script>
</body>
</html>