<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Geist</title>
</head>
<link href="../css/main.css" rel="stylesheet" />
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script src = "http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" ></script>
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
                            <c:forEach var="#" item="${list}">
                                <div class="container" role="main">
                                    <h4 class="m-0 p-2">정보조회</h4>
                                    <div class="rounded">
                                        <div class="board-info-box">
                                            <h1 class="m-0">${#.EMP_NAME} &nbsp; ${#.EMP_POSITION}</h1>
                                            <h6 class="m-0 pt-3 pb-4">Geist회사 > ${#.DEPT_NO}</h6>
                                        </div>
                                        <form name="form" id="form" role="form" method="post"
                                        action="${path}/#/.do">
                                            <table class="type09">
                                                <thead>
                                                    <th scope="row">아이디</th>
                                                    <td>${#.EMP_ID}</td>
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
                                                        <input type="password" id="My-pwd-new" class="form-control" maxlength="20" placeholder="새 비밀번호를 재입력해주세요" />
                                                        <span class="text-danger" id="My-pwd-new-error">비밀번호를 반드시 입력해주세요.</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">사원번호</th>
                                                    <td>${#.EMP_NO}</td>
                                                </tr>
                                                <tr>
	                                                <th scope="row">직책</th>
                                                    <td>
                                                        <input type="text" id="position" class="form-control" maxlength="20" placeholder="직책을 입력해주세요" />
                                                        <span class="text-danger" id="position-error">직책을 반드시 입력해주세요.</span>
                                                    </td>
                                            	</tr>
                                            	<tr>
	                                                <th scope="row">급여</th>
                                                    <td>
                                                        <input type="text" id="sal" class="form-control" maxlength="20" placeholder="급여를 입력해주세요" />
                                                        <span class="text-danger" id="sal-error">급여를 반드시 입력해주세요.</span>
                                                    </td>
                                            	</tr>
                                            	<tr>
	                                                <th scope="row">부서번호</th>
                                                    <td>
                                                        <input type="text" id="Department" class="form-control" maxlength="20" placeholder="부서번호를 입력해주세요" />
                                                        <span class="text-danger" id="Department-error">부서번호를 반드시 입력해주세요.</span>
                                                    </td>
                                            	</tr>
                                            	<tr>
                                                	<th scope="row">입사일</th>
                                                	<td>${#.EMP_DATE}</td>
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
                                                    <td>${#.EMP_BIRTH}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">주소</th>
                                                    <td>${#.EMP_ADDRESS}</td>
                                                </tr>
                                                </tbody>
                                                </c:forEach>
                                            </table>
                                            <div class="pt-2" style="float: right;">
                                                <button type="button" class="btn btn-sm dt-button" id="approve-btnSave" >가입승인</button>
                                                <button type="button" class="btn btn-sm dt-button" id="approve-delete" >가입거절</button>
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
	    	$(document).on('click', '#approve-btnSave', function(e){
	            e.preventDefault();
	            $("#form").submit();
	        });
	
	        $(document).on('click', '#approve-delete', function(e){
	        	var returnValue = confirm('가입승인을 거절하시겠습니까?')
				if(returnValue=true){
					alert("해당 아이디가 정상적으로 가입거절되었습니다.")
					self.location.href ="${path}/#/.do" //삭제메소드 불러오기
				}else{ 
					alert("취소되었습니다.") };
	        });
	        
    	});
    </script>
    <script type="text/javascript" src="../js/My-register.js"></script>
</body>
</html>