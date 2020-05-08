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
                            <div class="app-page-title" style="margin: 0px; padding: 50px 0px 30px;">
                                <div class="page-title-heading">
                                    <i class="pe-7s-document-inverse"></i>
                                    <h1><sub>사내공지</sub></h1>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr">
                            </div>
                            <!-- Write -->
                            <article>
                                <div class="container" role="main" style="padding: 0px 100px 0px 100px;">
                                    <form name="form" id="form" role="form" method="post"
                                        action="#">
                                        <div class="mb-3">
                                            <label for="title">제목</label>
                                            <input type="text" class="form-control" name="title" id="title"
                                                placeholder="제목을 입력해 주세요">
                                        </div>
                                        <div class="mb-3">
                                            <label for="content">내용</label>
                                            <textarea class="form-control" rows="15" name="content" id="content"
                                                placeholder="내용을 입력해 주세요"></textarea>
                                        </div>
                                    </form>
                                    <div class="pt-2" style="float: right;">
                                        <button type="button" class="btn btn-sm dt-button" id="btnSave" >저장</button>
                                        <button type="button" class="btn btn-sm dt-button" id="btnList" >목록</button>
                                    </div>

                                </div>

                            </article>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).on('click', '#btnSave', function(e){
            e.preventDefault();
            $("#form").submit();
        });

        $(document).on('click', '#btnList', function(e){
        	e.preventDefault();
        	location.href="index.jsp?contentPage=page/document-page.jsp";
        });
    </script>
</body>
</html>