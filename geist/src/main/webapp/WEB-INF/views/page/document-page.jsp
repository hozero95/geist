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
                                        <i class="pe-7s-document-inverse"></i>
                                        <h2><sub>사내공지</sub></h2><p>
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
                                                            <th class="sorting_asc" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-sort="ascending" aria-label="번호: activate to sort column descending"
                                                                style="width: 100px;text-align: center;">번호</th>
                                                            <th class="sorting" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-label="제목: activate to sort column ascending" style="width: 800px; text-align: center;">제목</th>
                                                            <th class="sorting" tabindex="0" aria-controls="foo-table" rowspan="1" colspan="1"
                                                                aria-label="작성날짜: activate to sort column ascending" style="width: 300px;text-align: center;">작성날짜</th>
                                                        </tr>
                                                    </thead>
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
            $('#foo-table').DataTable( {
                "info" :  false,
                lengthChange: false,
                pageLength: 5,
                bPaginate: true,
                processing: true,
                ordering: true,
                serverSide: false,
                searching: true,
                ajax : {
                    "url":"#",
                    "type":"POST",
                    "dataSrc": function (d) {
                        	   var data = d.data;
                        	   return data;
                    }
                },
                columns : [
                    {data: "번호"},
                    {data: "제목"},
                    {data: "작성날짜"}
                ],
                dom: 'Bfrtip',
                buttons: [
                    {
                        text: '글쓰기',
                        action: function ( e, dt, node, config ) {
                        	e.preventDefault();
            	        	location.href="index.jsp?contentPage=page/document-page-write.jsp";
                        }
                    }
                ]
                
            });
            $('div').removeClass('form-inline');
            $('div.app-page-title').css('margin','0px 0px 0px');
            $('div.app-page-title').css('padding','50px 0px 30px 0px');
            
        });

    </script>
</body>
</html>