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
                                        action="${path}/#/.do">
                                        <div class="mb-3">
                                            <label for="title">제목</label>
                                            <input type="text" class="form-control" name="title" id="NOTI_TITLE"
                                                placeholder="제목을 입력해 주세요">
                                        </div>
                                        <div class="mb-3">
                                            <label for="content">내용</label>
                                            <textarea class="form-control" rows="15" name="content" id="NOTI_CONTENT"
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
	$(document).ready(function(){
        //ID가 wrtie_process를 클릭할떄
        $("#btnSave").click(function(){
            //JSON 객체에 값을 담아줌
            var json = {
				NOTI_TITLE : $("#NOTI_TITLE").val(),
				NOTI_CONTENT : $("#NOTI_CONTENT").val()
            };
            
            //변수명이 JSON에 담아둔 값만큼 포이치문을 돌림
            for(var str in json){
                //JSON에 STR의 길이가 0일 경우
                if(json[str].length == 0){
                    //해당하는 ID에 placeholder를 찾아 경고창을 띄움
                    alert($("#" + str).attr("placeholder") + "를 입력해주세요.");
                    //해당하는 ID에 포커스를 올림
                    $("#" + str).focus();
                    //리턴
                    return;
                }
            }
            //비동기 요청
             $.ajax({
                type : "post", //POST로
                url : "board_wrtie", //URL 지정
                data : json, //전달값은 JSON
                success : function(data) { //성공시
                    //받아온 데이터를 스위치문사용
                    //-1은 로그인 안될때, 0은 성공, 나머지는 db오류
                    switch (Number(data)) {
                    case -1:
                        alert("로그인 후 이용해주세요.");
                        window.location.href = "로그인창jsp";
                        break;
                    case 0:
                        alert("정상적으로 등록이 되었습니다.");
                        window.location.href = "index.jsp?contentPage=page/document-page.jsp";
                        break;

                    default:
                        alert("알수없는 오류가 발생했습니다. [ErrorCode : " + Number(data) + "]");
                        break;
                    }
                },
                error : function(error) {
                    alert("오류 발생"+ error);
                }
            });
        });
    });

	</script>
</body>
</html>