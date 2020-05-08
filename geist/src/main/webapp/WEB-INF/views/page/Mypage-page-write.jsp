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
                            <div class="app-page-title" style="margin: 0px; padding: 50px 0px 20px;">
                                <div class="page-title-heading">
                                    <i class="pe-7s-user-inverse"></i>
                                    <h2>마이페이지</h2>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr">
                            </div>
                            <!-- Write -->
                            <article>
                                <div class="container" role="main">
                                    <h4 class="m-0 p-2">정보조회</h4>
                                    <div class="rounded">
                                        <div class="board-info-box">
                                            <h1 class="m-0">000사원</h1>
                                            <h6 class="m-0 pt-3 pb-4">Geist회사 > 기획팀</h6>
                                        </div>
                                        <form name="form" id="form" role="form" method="post"
                                        action="#">
                                            <table class="type09">
                                                <thead>
                                                    <th scope="row">아이디</th>
                                                    <td>123456</td>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <th scope="row">새 비밀번호</th>
                                                    <td>
                                                        <input type="password" id="My-pwd" class="form-control" maxlength="20" placeholder="새 비밀번호를 입력해주세요" />
                                                        <span class="text-danger" id="My-pwd-error">비밀번호를 반드시 입력해주세요.</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">새 비밀번호 재입력</th>
                                                    <td>
                                                        <input type="password" id="My-pwd2" class="form-control" maxlength="20" placeholder="새 비밀번호를 재입력해주세요" />
                                                        <span class="text-danger" id="My-pwd-error2">비밀번호를 반드시 입력해주세요.</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">사원번호</th>
                                                    <td>12345</td>
                                                </tr>
                                                <tr>
	                                                <th scope="row">직책</th>
	                                                <td>내용이 들어갑니다.</td>
                                            	</tr>
                                            	<tr>
	                                                <th scope="row">급여</th>
	                                                <td>내용이 들어갑니다.</td>
                                            	</tr>
                                            	<tr>
                                                	<th scope="row">입사일</th>
                                                	<td>내용이 들어갑니다.</td>
                                            	</tr>                                                
                                                <tr>
                                                    <th scope="row">사내연락처</th>
                                                    <td>
                                                        <input type="text" id="My-phone2" class="form-control" oninput="noKorean(this);"
              onkeyup="inputPhoneNumber(this);" maxlength="13"  placeholder="사내연락처를 입력해주세요" class="form-control" />
                                                        <span class="text-danger" id="My-company-ph-error">사내연락처를 반드시 입력해주세요.</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">개인연락처</th>
                                                    <td>
                                                        <input type="text" id="My-phone" class="form-control" oninput="noKorean(this);"
              onkeyup="inputPhoneNumber(this);" maxlength="13"  placeholder="개인연락처를 입력해주세요" class="form-control" />
                                                        <span class="text-danger" id="My-phone-error">개인연락처를 반드시 입력해주세요.</span>
                                                    </td>
                                                </tr>                                       
                                                <tr>
                                                    <th scope="row">생년월일</th>
                                                    <td>내용이 들어갑니다.</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">주소</th>
                                                    <td>
                                                        <div class="form-row">
                                                            <div class="col-md-4">
                                                                <input type="text" id="My-postcode" placeholder="우편번호" class="form-control"/>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <input type="text" id="My-addr1" placeholder="주소" class="form-control"/>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <input type="button" id="pst-btn" onclick="execDaumPostcode()" value="우편번호 찾기" class="dt-button form-control"
                                                                style="margin:0px 5px 5px 5px"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="col-md-6">
                                                                <input type="text" id="My-addr2" placeholder="참고항목" class="form-control"/>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <input type="text" id="My-addr-etc" placeholder="상세주소" class="col-md-6 form-control"/>
                                                            </div>
                                                        </div>
                                                        <span class="text-danger" id="My-addr-error">주소는 반드시 입력하세요</span>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <div class="pt-2" style="float: right;">
                                                <button type="button" class="btn btn-sm dt-button" id="My-btnSave" >저장</button>
                                                <button type="button" class="btn btn-sm dt-button" id="My-btnList" >목록</button>
                                            </div>
                                        </form>
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
    	$(document).ready(function() {
	    	$(document).on('click', '#My-btnSave', function(e){
	            e.preventDefault();
	            $("#form").submit();
	        });
	
	        $(document).on('click', '#My-btnList', function(e){
	        	e.preventDefault();
	        	location.href="index.jsp?contentPage=page/Mypage-page.jsp";
	        });
    	});
    </script>
</body>
</html>